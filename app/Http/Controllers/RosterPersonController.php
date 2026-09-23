<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
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
        DB::table('tblRosterPerson')->insert($data + ['created_at' => now(), 'updated_at' => now()]);
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
        DB::table('tblRosterPerson')->where('RosterPersonID', $id)->update($data + ['updated_at' => now()]);
        return redirect()->route('roster.people.index')->with('success', 'Roster person updated.');
    }

    private function validated(Request $request, $person = null): array
    {
        return $request->validate([
            'EmployeeCode' => ['nullable', 'max:50', Rule::unique('tblRosterPerson', 'EmployeeCode')->ignore($person?->RosterPersonID, 'RosterPersonID')],
            'PersonName' => ['required', 'max:150'],
            'DepartmentID' => ['required', 'exists:tblDepartment,DepartmentID'],
            'DesignationID' => ['required', 'exists:tblDesignation,DesignationID'],
            'ZKUserID' => ['nullable', 'max:50', Rule::unique('tblRosterPerson', 'ZKUserID')->ignore($person?->RosterPersonID, 'RosterPersonID')],
            'WorkMode' => ['required', Rule::in(['Normal', 'Roster', 'Both'])],
            'Status' => ['required', 'boolean'],
        ]) + $this->names($request) + ['RunsRoster' => $request->WorkMode !== 'Normal'];
    }

    private function formData($person = null): array { return ['person' => $person, 'departments' => DB::table('tblDepartment')->where('Status', 1)->orderBy('DepartmentName')->get(), 'designations' => DB::table('tblDesignation')->where('Status', 1)->orderBy('DesignationName')->get()]; }
    private function names(Request $request): array { return ['RoleName' => DB::table('tblDesignation')->where('DesignationID', $request->DesignationID)->value('DesignationName'), 'DepartmentName' => DB::table('tblDepartment')->where('DepartmentID', $request->DepartmentID)->value('DepartmentName')]; }
}
