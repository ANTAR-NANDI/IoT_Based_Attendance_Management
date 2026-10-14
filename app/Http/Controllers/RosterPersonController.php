<?php

namespace App\Http\Controllers;

use App\Models\User;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Hash;
use Illuminate\Validation\Rule;

class RosterPersonController extends Controller
{
    public function index(Request $request)
    {
        $people = DB::table('tblRosterPerson as p')->leftJoin('tblDepartment as d', 'p.DepartmentID', '=', 'd.DepartmentID')->leftJoin('tblDesignation as des', 'p.DesignationID', '=', 'des.DesignationID')
            ->when($request->filled('search'), fn ($q) => $q->where(function ($q) use ($request) {
                $q->where('p.PersonName', 'like', "%{$request->search}%")->orWhere('p.EmployeeCode', 'like', "%{$request->search}%")->orWhere('p.ZKUserID', 'like', "%{$request->search}%")->orWhere('des.DesignationName', 'like', "%{$request->search}%");
            }))
            ->select('p.*', 'd.DepartmentName as SelectedDepartment', 'des.DesignationName as SelectedDesignation')->orderBy('p.PersonName')->paginate(20)->withQueryString();

        return view('roster.people.index', compact('people'));
    }

    public function create()
    {
        return view('roster.people.form', $this->formData());
    }

    public function store(Request $request)
    {
        $data = $this->validated($request);
        DB::transaction(function () use ($data, $request) {
            $personId = DB::table('tblRosterPerson')->insertGetId($data + ['created_at' => now(), 'updated_at' => now()]);
            $this->saveEmployeeAccount($request, $personId);
        });
        return redirect()->route('roster.people.index')->with('success', 'Roster person added.');
    }

    public function edit(int $id)
    {
        $person = DB::table('tblRosterPerson')->where('RosterPersonID', $id)->firstOrFail();
        return view('roster.people.form', $this->formData($person));
    }

    public function update(Request $request, int $id)
    {
        $person = DB::table('tblRosterPerson')->where('RosterPersonID', $id)->firstOrFail();
        $data = $this->validated($request, $person);
        DB::transaction(function () use ($data, $request, $id) {
            DB::table('tblRosterPerson')->where('RosterPersonID', $id)->update($data + ['updated_at' => now()]);
            $this->saveEmployeeAccount($request, $id);
        });
        return redirect()->route('roster.people.index')->with('success', 'Roster person updated.');
    }

    private function validated(Request $request, $person = null): array
    {
        $account = $person ? User::where('RosterPersonID', $person->RosterPersonID)->first() : null;
        return $request->validate([
            'EmployeeCode' => ['nullable', 'max:50', Rule::unique('tblRosterPerson', 'EmployeeCode')->ignore($person?->RosterPersonID, 'RosterPersonID')],
            'PersonName' => ['required', 'max:150'],
            'DepartmentID' => ['required', 'exists:tblDepartment,DepartmentID'],
            'DesignationID' => ['required', 'exists:tblDesignation,DesignationID'],
            'ZKUserID' => ['nullable', 'max:50', Rule::unique('tblRosterPerson', 'ZKUserID')->ignore($person?->RosterPersonID, 'RosterPersonID')],
            'WorkMode' => ['required', Rule::in(['Normal', 'Roster', 'Both'])],
            'Status' => ['required', 'boolean'],
            'AccountEmail' => ['nullable', 'email', Rule::unique('users', 'email')->ignore($account?->id)],
            'AccountPassword' => [$account ? 'nullable' : 'required_with:AccountEmail', 'nullable', 'string', 'min:8', 'confirmed'],
        ]) + $this->names($request) + ['RunsRoster' => $request->WorkMode !== 'Normal'];
    }

    private function saveEmployeeAccount(Request $request, int $personId): void
    {
        $email = $request->input('AccountEmail');
        $account = User::where('RosterPersonID', $personId)->first();
        if (!$email) return;
        $person = DB::table('tblRosterPerson')->where('RosterPersonID', $personId)->first();
        $attributes = ['name' => $person->PersonName, 'email' => $email, 'role' => 'employee', 'RosterPersonID' => $personId];
        if ($request->filled('AccountPassword')) $attributes['password'] = Hash::make($request->input('AccountPassword'));
        if ($account) $account->forceFill($attributes)->save();
        else User::create($attributes);
    }

    private function formData($person = null): array { return ['person' => $person, 'account' => $person ? User::where('RosterPersonID', $person->RosterPersonID)->first() : null, 'departments' => DB::table('tblDepartment')->where('Status', 1)->orderBy('DepartmentName')->get(), 'designations' => DB::table('tblDesignation')->where('Status', 1)->orderBy('DesignationName')->get()]; }
    private function names(Request $request): array { return ['RoleName' => DB::table('tblDesignation')->where('DesignationID', $request->DesignationID)->value('DesignationName'), 'DepartmentName' => DB::table('tblDepartment')->where('DepartmentID', $request->DepartmentID)->value('DepartmentName')]; }
}
