<?php

namespace App\Http\Controllers;

use Carbon\Carbon;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Illuminate\Validation\Rule;

class RosterAssignmentController extends Controller
{
    public function index(Request $request)
    {
        $month = $request->input('month', now()->format('Y-m'));
        $assignments = $this->baseQuery()
            ->whereBetween('ra.RosterDate', [Carbon::parse($month.'-01')->startOfMonth()->toDateString(), Carbon::parse($month.'-01')->endOfMonth()->toDateString()])
            ->orderBy('ra.RosterDate')->orderBy('ra.StartTime')->get();
        return view('roster.assignments.index', compact('assignments', 'month'));
    }

    public function create()
    {
        return view('roster.assignments.form', $this->formData());
    }

    public function store(Request $request)
    {
        $data = $this->assignmentData($request);
        $dates = $this->datesFor($request);
        foreach ($dates as $date) {
            $candidate = $data + ['RosterDate' => $date];
            if ($this->conflicts($candidate)) return back()->withInput()->withErrors(['RosterPersonID' => "Schedule conflict on {$date}. This person already has an overlapping duty."]);
        }
        DB::transaction(function () use ($data, $dates) {
            foreach ($dates as $date) DB::table('tblRosterAssignment')->insert($data + ['RosterDate' => $date, 'created_at' => now(), 'updated_at' => now()]);
        });
        return redirect()->route('roster.assignments.index', ['month' => Carbon::parse($dates[0])->format('Y-m')])->with('success', count($dates).' roster duty/duties added.');
    }

    public function edit(int $id)
    {
        $assignment = DB::table('tblRosterAssignment')->where('RosterAssignmentID', $id)->firstOrFail();
        return view('roster.assignments.form', $this->formData($assignment));
    }

    public function update(Request $request, int $id)
    {
        $data = $this->assignmentData($request);
        if ($this->conflicts($data, $id)) return back()->withInput()->withErrors(['RosterPersonID' => 'This person already has an overlapping class or roster shift.']);
        DB::table('tblRosterAssignment')->where('RosterAssignmentID', $id)->update($data + ['updated_at' => now()]);
        return redirect()->route('roster.assignments.index', ['month' => Carbon::parse($data['RosterDate'])->format('Y-m')])->with('success', 'Roster duty updated.');
    }

    public function destroy(int $id)
    {
        DB::table('tblRosterAssignment')->where('RosterAssignmentID', $id)->delete();
        return back()->with('success', 'Roster duty removed.');
    }

    private function formData($assignment = null): array
    {
        return [
            'assignment' => $assignment,
            'people' => DB::table('tblRosterPerson')->where('Status', 1)->orderBy('PersonName')->get(),
            'shifts' => DB::table('tblRosterShift')->where('Status', 1)->orderBy('StartTime')->get(),
            'locations' => DB::table('tblRosterLocation')->where('Status', 1)->orderBy('LocationName')->get(),
            'devices' => DB::table('tblDevice')->where('Status', 1)->orderBy('DeviceName')->get(),
        ];
    }

    private function assignmentData(Request $request): array
    {
        $input = $request->validate([
            'RosterDate' => ['required', 'date'],
            'EndDate' => ['nullable', 'date', 'after_or_equal:RosterDate'],
            'RepeatMode' => ['nullable', Rule::in(['Once', 'Daily', 'Weekly'])],
            'Weekdays' => ['nullable', 'array'],
            'Weekdays.*' => ['integer', 'between:0,6'],
            'RosterPersonID' => ['required', 'exists:tblRosterPerson,RosterPersonID'],
            'ProxyPersonID' => ['nullable', 'exists:tblRosterPerson,RosterPersonID', 'different:RosterPersonID'],
            'RosterShiftID' => ['required', 'exists:tblRosterShift,RosterShiftID'],
            'RosterLocationID' => ['nullable', 'exists:tblRosterLocation,RosterLocationID'],
            'DeviceID' => ['nullable', 'exists:tblDevice,DeviceID'],
            'AssignmentType' => ['required', Rule::in(['General Duty', 'Class Duty', 'Exam Duty', 'Other'])],
            'Status' => ['required', Rule::in(['Active', 'Cancelled'])],
            'Remarks' => ['nullable', 'max:255'],
        ]);
        unset($input['EndDate'], $input['RepeatMode'], $input['Weekdays']);
        $shift = DB::table('tblRosterShift')->where('RosterShiftID', $input['RosterShiftID'])->firstOrFail();
        $grace = DB::table('tblRosterSetting')->where('id', 1)->firstOrFail();
        return $input + [
            'StartTime' => $shift->StartTime, 'EndTime' => $shift->EndTime,
            'CrossesMidnight' => $shift->CrossesMidnight,
            'EntryEarlyMinutes' => $grace->EntryEarlyMinutes, 'EntryLateMinutes' => $grace->EntryLateMinutes,
            'ExitEarlyMinutes' => $grace->ExitEarlyMinutes, 'ExitLateMinutes' => $grace->ExitLateMinutes,
        ];
    }

    private function datesFor(Request $request): array
    {
        $mode = $request->input('RepeatMode', 'Once');
        $start = Carbon::parse($request->RosterDate)->startOfDay();
        $end = $request->filled('EndDate') ? Carbon::parse($request->EndDate)->startOfDay() : $start->copy();
        if ($mode === 'Once') return [$start->toDateString()];
        if ($mode === 'Weekly' && empty($request->Weekdays)) abort(422, 'Select at least one weekday for a weekly roster.');
        $days = collect($request->input('Weekdays', []))->map(fn ($day) => (int) $day)->all();
        $dates = [];
        for ($date = $start->copy(); $date->lte($end); $date->addDay()) {
            if ($mode === 'Daily' || ($mode === 'Weekly' && in_array($date->dayOfWeek, $days, true))) $dates[] = $date->toDateString();
        }
        return $dates;
    }

    private function conflicts(array $data, ?int $ignoreId = null): bool
    {
        if ($data['Status'] !== 'Active') return false;
        [$candidateStart, $candidateEnd] = $this->times($data);
        $existing = DB::table('tblRosterAssignment')->where('RosterPersonID', $data['RosterPersonID'])->where('Status', 'Active')
            ->whereBetween('RosterDate', [$candidateStart->copy()->subDay()->toDateString(), $candidateEnd->toDateString()])
            ->when($ignoreId, fn ($q) => $q->where('RosterAssignmentID', '!=', $ignoreId))->get();
        foreach ($existing as $row) {
            [$start, $end] = $this->times((array) $row);
            if ($candidateStart->lt($end) && $candidateEnd->gt($start)) return true;
        }

        // A teacher cannot be booked for a generic roster duty while an
        // existing class routine is running. Class routines remain in their
        // own module, but participate in roster conflict validation.
        $person = DB::table('tblRosterPerson')->where('RosterPersonID', $data['RosterPersonID'])->first();
        if ($person?->SourceTeacherID) {
            $classes = DB::table('tblRoutine')
                ->where('TeacherID', $person->SourceTeacherID)
                ->where('Status', 1)
                ->whereBetween('RoutineDate', [$candidateStart->toDateString(), $candidateEnd->toDateString()])
                ->get();
            foreach ($classes as $class) {
                $classStart = Carbon::parse($class->RoutineDate.' '.$class->StartTime);
                $classEnd = Carbon::parse($class->RoutineDate.' '.$class->EndTime);
                if ($candidateStart->lt($classEnd) && $candidateEnd->gt($classStart)) return true;
            }
        }
        return false;
    }

    private function times(array $row): array
    {
        $start = Carbon::parse($row['RosterDate'].' '.$row['StartTime']);
        $end = Carbon::parse($row['RosterDate'].' '.$row['EndTime']);
        if ($row['CrossesMidnight'] || $end->lessThanOrEqualTo($start)) $end->addDay();
        return [$start, $end];
    }

    private function baseQuery()
    {
        return DB::table('tblRosterAssignment as ra')
            ->join('tblRosterPerson as p', 'ra.RosterPersonID', '=', 'p.RosterPersonID')
            ->leftJoin('tblRosterPerson as proxy', 'ra.ProxyPersonID', '=', 'proxy.RosterPersonID')
            ->join('tblRosterShift as s', 'ra.RosterShiftID', '=', 's.RosterShiftID')
            ->leftJoin('tblRosterLocation as l', 'ra.RosterLocationID', '=', 'l.RosterLocationID')
            ->leftJoin('tblDevice as d', 'ra.DeviceID', '=', 'd.DeviceID')
            ->select('ra.*', 'p.PersonName', 'p.RoleName', 'proxy.PersonName as ProxyPersonName', 's.ShiftName', 'l.LocationName', 'd.DeviceName');
    }
}
