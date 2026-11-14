<?php

namespace App\Http\Controllers;

use Carbon\Carbon;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Str;
use Illuminate\Validation\Rule;

class RosterAssignmentController extends Controller
{
    public function index(Request $request)
    {
        $month = $request->input('month', now()->format('Y-m'));
        $assignments = $this->baseQuery()
            ->whereBetween('ra.RosterDate', [Carbon::parse($month.'-01')->startOfMonth()->toDateString(), Carbon::parse($month.'-01')->endOfMonth()->toDateString()])
            ->orderBy('ra.RosterDate')->orderBy('ra.StartTime')
            ->paginate(50)
            ->withQueryString();
        return view('roster.assignments.index', compact('assignments', 'month'));
    }

    public function create()
    {
        return view('roster.assignments.form', $this->formData());
    }

    public function createMultiple()
    {
        return view('roster.assignments.multiple', $this->formData());
    }

    public function storeMultiple(Request $request)
    {
        $rows = $this->multipleClassData($request);
        $dates = $this->datesFor($request);
        $recurrence = $this->recurrenceData($request);

        foreach ($dates as $date) {
            $scheduled = [];
            foreach ($rows as $row) {
                $candidate = $row + ['RosterDate' => $date];
                if ($this->conflicts($candidate) || $this->roomConflicts($candidate) || $this->conflictsWithBatch($candidate, $scheduled)) {
                    return back()->withInput()->withErrors(['RoutineRows' => "Schedule conflict on {$date}. A teacher or room is already assigned during one of these class times."]);
                }
                $scheduled[] = $candidate;
            }
        }

        DB::transaction(function () use ($rows, $dates, $recurrence) {
            foreach ($rows as $row) {
                $seriesId = (string) Str::uuid();
                foreach ($dates as $date) {
                    DB::table('tblRosterAssignment')->insert($row + $recurrence + [
                        'RosterSeriesID' => $seriesId,
                        'RosterDate' => $date,
                        'created_at' => now(),
                        'updated_at' => now(),
                    ]);
                }
            }
        });

        return redirect()->route('roster.assignments.index', ['month' => Carbon::parse($dates[0])->format('Y-m')])
            ->with('success', count($rows).' class routine(s) added for '.count($dates).' date(s).');
    }

    public function store(Request $request)
    {
        $data = $this->assignmentData($request);
        $dates = $this->datesFor($request);
        $recurrence = $this->recurrenceData($request);
        foreach ($dates as $date) {
            $candidate = array_merge($data, ['RosterDate' => $date]);
            if ($this->conflicts($candidate)) return back()->withInput()->withErrors(['RosterPersonID' => "Schedule conflict on {$date}. This person already has an overlapping duty."]);
            if ($this->roomConflicts($candidate)) return back()->withInput()->withErrors(['RosterLocationID' => "Room conflict on {$date}. This room is already booked during the selected time frame."]);
        }
        $seriesId = (string) Str::uuid();
        DB::transaction(function () use ($data, $dates, $recurrence, $seriesId) {
            foreach ($dates as $date) {
                DB::table('tblRosterAssignment')->insert(array_merge($data, $recurrence, [
                    'RosterSeriesID' => $seriesId,
                    'RosterDate' => $date,
                    'created_at' => now(),
                    'updated_at' => now(),
                ]));
            }
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
        $assignment = DB::table('tblRosterAssignment')->where('RosterAssignmentID', $id)->firstOrFail();
        $data = $this->assignmentData($request);
        $dates = $this->datesFor($request);
        $recurrence = $this->recurrenceData($request);
        $isSeriesEdit = !empty($assignment->RosterSeriesID) || count($dates) > 1 || $recurrence['RepeatMode'] !== 'Once';

        foreach ($dates as $date) {
            $candidate = array_merge($data, ['RosterDate' => $date]);
            if ($this->conflicts($candidate, $assignment->RosterSeriesID ? null : $id, $assignment->RosterSeriesID)) {
                return back()->withInput()->withErrors(['RosterPersonID' => "Schedule conflict on {$date}. This person already has an overlapping duty."]);
            }
            if ($this->roomConflicts($candidate, $assignment->RosterSeriesID ? null : $id, $assignment->RosterSeriesID)) {
                return back()->withInput()->withErrors(['RosterLocationID' => "Room conflict on {$date}. This room is already booked during the selected time frame."]);
            }
        }

        if ($isSeriesEdit) {
            $seriesId = $assignment->RosterSeriesID ?: (string) Str::uuid();
            DB::transaction(function () use ($assignment, $data, $dates, $recurrence, $seriesId) {
                if ($assignment->RosterSeriesID) {
                    DB::table('tblRosterAssignment')->where('RosterSeriesID', $assignment->RosterSeriesID)->delete();
                } else {
                    DB::table('tblRosterAssignment')->where('RosterAssignmentID', $assignment->RosterAssignmentID)->delete();
                }
                foreach ($dates as $date) {
                    DB::table('tblRosterAssignment')->insert(array_merge($data, $recurrence, [
                        'RosterSeriesID' => $seriesId,
                        'RosterDate' => $date,
                        'created_at' => now(),
                        'updated_at' => now(),
                    ]));
                }
            });
            return redirect()->route('roster.assignments.index', ['month' => Carbon::parse($dates[0])->format('Y-m')])->with('success', 'Entire roster routine updated.');
        }

        DB::table('tblRosterAssignment')->where('RosterAssignmentID', $id)->update(array_merge($data, ['updated_at' => now()]));
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
            'locations' => DB::table('tblRosterLocation as l')
                ->leftJoin('tblDevice as d', 'l.DeviceID', '=', 'd.DeviceID')
                ->where('l.Status', 1)
                ->select('l.*', 'd.DeviceName', 'd.Status as DeviceStatus')
                ->orderBy('l.LocationName')
                ->get(),
            'departments' => DB::table('tblDepartment')->orderBy('DepartmentName')->get(),
            'batches' => DB::table('tblBatch')->where('Status', 1)->orderBy('BatchName')->get(),
            'subjects' => DB::table('tblSubject')->orderBy('SubjectName')->get(),
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
            'RosterShiftID' => ['nullable', 'exists:tblRosterShift,RosterShiftID'],
            'CustomStartTime' => ['nullable', 'date_format:H:i'],
            'CustomEndTime' => ['nullable', 'date_format:H:i'],
            'RosterLocationID' => ['nullable', 'exists:tblRosterLocation,RosterLocationID'],
            'AssignmentType' => ['required', Rule::in(['General Duty', 'Class Duty', 'Makeup Class', 'Rescheduled Class', 'Exam Duty', 'Other'])],
            'DepartmentID' => ['nullable', 'exists:tblDepartment,DepartmentID'],
            'BatchID' => ['nullable', 'exists:tblBatch,BatchID'],
            'SubjectID' => ['nullable', 'exists:tblSubject,SubjectID'],
            'Status' => ['required', Rule::in(['Active', 'Cancelled', 'Hold'])],
            'Remarks' => ['nullable', 'max:255'],
        ]);
        if ($this->isAcademicClassType($input['AssignmentType'])) {
            foreach (['DepartmentID' => 'department', 'BatchID' => 'batch', 'SubjectID' => 'subject', 'RosterLocationID' => 'room'] as $field => $label) {
                if (empty($input[$field])) throw \Illuminate\Validation\ValidationException::withMessages([$field => "Select the class {$label}."]);
            }
            if (empty($input['CustomStartTime']) || empty($input['CustomEndTime'])) throw \Illuminate\Validation\ValidationException::withMessages(['CustomStartTime' => 'Enter the exact class start and end time.']);
            $subjectDepartment = DB::table('tblSubject')->where('SubjectID', $input['SubjectID'])->value('DepartmentID');
            if ((int) $subjectDepartment !== (int) $input['DepartmentID']) throw \Illuminate\Validation\ValidationException::withMessages(['SubjectID' => 'The subject must belong to the selected department.']);
            $batchDepartment = DB::table('tblBatch')->where('BatchID', $input['BatchID'])->value('DepartmentID');
            if ((int) $batchDepartment !== (int) $input['DepartmentID']) throw \Illuminate\Validation\ValidationException::withMessages(['BatchID' => 'The batch must belong to the selected department.']);
        } elseif ($input['AssignmentType'] === 'Exam Duty') {
            if (empty($input['CustomStartTime']) || empty($input['CustomEndTime'])) throw \Illuminate\Validation\ValidationException::withMessages(['CustomStartTime' => 'Enter the exact exam start and end time.']);
            if (empty($input['RosterLocationID'])) throw \Illuminate\Validation\ValidationException::withMessages(['RosterLocationID' => 'Select the exam room.']);
        } elseif (empty($input['RosterShiftID'])) {
            throw \Illuminate\Validation\ValidationException::withMessages(['RosterShiftID' => 'Select a shift template for a general, exam, or other duty.']);
        }

        // The attendance terminal belongs to the selected room.  Never trust
        // a device ID posted by the browser for a routine.
        $input['DeviceID'] = null;
        if (!empty($input['RosterLocationID'])) {
            $deviceId = DB::table('tblRosterLocation')->where('RosterLocationID', $input['RosterLocationID'])->value('DeviceID');
            $deviceIsActive = $deviceId && DB::table('tblDevice')->where('DeviceID', $deviceId)->where('Status', 1)->exists();
            if (!$deviceIsActive && $this->requiresAttendanceDevice($input['AssignmentType'])) {
                throw \Illuminate\Validation\ValidationException::withMessages(['RosterLocationID' => 'This room has no active ZKT device. Add or activate its device in Room Setup first.']);
            }
            $input['DeviceID'] = $deviceIsActive ? $deviceId : null;
        }
        unset($input['EndDate'], $input['RepeatMode'], $input['Weekdays']);
        $shift = !empty($input['RosterShiftID']) ? DB::table('tblRosterShift')->where('RosterShiftID', $input['RosterShiftID'])->firstOrFail() : null;
        $usesExactTime = in_array($input['AssignmentType'], ['Class Duty', 'Makeup Class', 'Rescheduled Class', 'Exam Duty'], true);
        $customStart = $usesExactTime ? ($input['CustomStartTime'] ?? null) : null;
        $customEnd = $usesExactTime ? ($input['CustomEndTime'] ?? null) : null;
        if ($customStart !== null && $customStart >= $customEnd) {
            throw \Illuminate\Validation\ValidationException::withMessages(['CustomEndTime' => 'End time must be after start time.']);
        }
        unset($input['CustomStartTime'], $input['CustomEndTime']);
        $grace = DB::table('tblRosterSetting')->where('id', 1)->firstOrFail();
        return $input + [
            'StartTime' => $customStart ?: $shift->StartTime, 'EndTime' => $customEnd ?: $shift->EndTime,
            'CrossesMidnight' => $customStart ? false : $shift->CrossesMidnight,
            'EntryEarlyMinutes' => $grace->EntryEarlyMinutes, 'EntryLateMinutes' => $grace->EntryLateMinutes,
            'ExitEarlyMinutes' => $grace->ExitEarlyMinutes, 'ExitLateMinutes' => $grace->ExitLateMinutes,
        ];
    }

    private function multipleClassData(Request $request): array
    {
        $input = $request->validate([
            'RosterDate' => ['required', 'date'],
            'EndDate' => ['nullable', 'date', 'after_or_equal:RosterDate'],
            'RepeatMode' => ['nullable', Rule::in(['Once', 'Daily', 'Weekly'])],
            'Weekdays' => ['nullable', 'array'],
            'Weekdays.*' => ['integer', 'between:0,6'],
            'Status' => ['required', Rule::in(['Active', 'Cancelled', 'Hold'])],
            'StartTime' => ['required', 'date_format:H:i'],
            'EndTime' => ['required', 'date_format:H:i'],
            'RoutineRows' => ['required', 'array', 'min:1'],
            'RoutineRows.*.DepartmentID' => ['required', 'exists:tblDepartment,DepartmentID'],
            'RoutineRows.*.BatchID' => ['required', 'exists:tblBatch,BatchID'],
            'RoutineRows.*.SubjectID' => ['required', 'exists:tblSubject,SubjectID'],
            'RoutineRows.*.RosterPersonID' => ['required', 'exists:tblRosterPerson,RosterPersonID'],
            'RoutineRows.*.ProxyPersonID' => ['nullable', 'exists:tblRosterPerson,RosterPersonID'],
            'RoutineRows.*.RosterLocationID' => ['required', 'exists:tblRosterLocation,RosterLocationID'],
            'RoutineRows.*.Remarks' => ['nullable', 'max:255'],
        ]);

        if ($input['StartTime'] >= $input['EndTime']) {
            throw \Illuminate\Validation\ValidationException::withMessages(['EndTime' => 'End time must be after start time.']);
        }

        $rows = [];
        foreach ($input['RoutineRows'] as $index => $row) {
            if (!empty($row['ProxyPersonID']) && $row['ProxyPersonID'] == $row['RosterPersonID']) {
                throw \Illuminate\Validation\ValidationException::withMessages(["RoutineRows.{$index}.ProxyPersonID" => 'The proxy teacher must be different from the teacher.']);
            }
            $departmentId = (int) $row['DepartmentID'];
            if ((int) DB::table('tblSubject')->where('SubjectID', $row['SubjectID'])->value('DepartmentID') !== $departmentId) {
                throw \Illuminate\Validation\ValidationException::withMessages(["RoutineRows.{$index}.SubjectID" => 'The subject must belong to the selected department.']);
            }
            if ((int) DB::table('tblBatch')->where('BatchID', $row['BatchID'])->value('DepartmentID') !== $departmentId) {
                throw \Illuminate\Validation\ValidationException::withMessages(["RoutineRows.{$index}.BatchID" => 'The batch must belong to the selected department.']);
            }
            $deviceId = DB::table('tblRosterLocation')->where('RosterLocationID', $row['RosterLocationID'])->value('DeviceID');
            if (!$deviceId || !DB::table('tblDevice')->where('DeviceID', $deviceId)->where('Status', 1)->exists()) {
                throw \Illuminate\Validation\ValidationException::withMessages(["RoutineRows.{$index}.RosterLocationID" => 'This room has no active ZKT device. Add or activate its device in Room Setup first.']);
            }
            $rows[] = [
                ...$row,
                'DeviceID' => $deviceId,
                'RosterShiftID' => null,
                'AssignmentType' => 'Class Duty',
                'Status' => $input['Status'],
                'StartTime' => $input['StartTime'],
                'EndTime' => $input['EndTime'],
                'CrossesMidnight' => false,
                ...$this->attendanceWindow(),
            ];
        }
        return $rows;
    }

    private function attendanceWindow(): array
    {
        $grace = DB::table('tblRosterSetting')->where('id', 1)->firstOrFail();
        return ['EntryEarlyMinutes' => $grace->EntryEarlyMinutes, 'EntryLateMinutes' => $grace->EntryLateMinutes,
            'ExitEarlyMinutes' => $grace->ExitEarlyMinutes, 'ExitLateMinutes' => $grace->ExitLateMinutes];
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

    private function recurrenceData(Request $request): array
    {
        $start = Carbon::parse($request->RosterDate)->toDateString();
        $end = $request->filled('EndDate') ? Carbon::parse($request->EndDate)->toDateString() : $start;
        $weekdays = collect($request->input('Weekdays', []))->map(fn ($day) => (int) $day)->values()->all();

        return [
            'SeriesStartDate' => $start,
            'SeriesEndDate' => $end,
            'RepeatMode' => $request->input('RepeatMode', 'Once'),
            'Weekdays' => $weekdays ? json_encode($weekdays) : null,
        ];
    }

    private function conflicts(array $data, ?int $ignoreId = null, ?string $ignoreSeriesId = null): bool
    {
        if ($data['Status'] !== 'Active') return false;
        [$candidateStart, $candidateEnd] = $this->times($data);
        $assignmentDate = $data['RosterDate'];
        $existing = DB::table('tblRosterAssignment')->where('RosterPersonID', $data['RosterPersonID'])->where('Status', 'Active')
            // A roster date is a calendar day: 12:00 AM through 11:59 PM.
            // A Sunday duty must not cause a conflict for a Monday duty.
            ->whereDate('RosterDate', $assignmentDate)
            ->when($ignoreId, fn ($q) => $q->where('RosterAssignmentID', '!=', $ignoreId))
            ->when($ignoreSeriesId, fn ($q) => $q->where(function ($seriesQuery) use ($ignoreSeriesId) {
                $seriesQuery->whereNull('RosterSeriesID')->orWhere('RosterSeriesID', '!=', $ignoreSeriesId);
            }))->get();
        foreach ($existing as $row) {
            [$start, $end] = $this->times((array) $row);
            if ($candidateStart->lt($end) && $candidateEnd->gt($start)) return true;
        }

        // A teacher cannot be booked for a generic roster duty while an
        // existing class routine is running. Class routines remain in their
        // own module, but participate in roster conflict validation.
        $person = DB::table('tblRosterPerson')->where('RosterPersonID', $data['RosterPersonID'])->first();
        if ($person?->SourceTeacherID) {
            // tblRoutine stores a weekly template. Match the selected weekday
            // and the candidate's calendar date only.
            $classDate = Carbon::parse($assignmentDate);
            $classes = DB::table('tblRoutine')
                ->where('TeacherID', $person->SourceTeacherID)
                ->where('Status', 1)
                ->where('DayName', $classDate->format('l'))
                ->where(function ($query) use ($assignmentDate) {
                    $query->where(function ($semester) use ($assignmentDate) {
                        $semester->where('SemesterStartDate', '<=', $assignmentDate)
                            ->where('SemesterEndDate', '>=', $assignmentDate);
                    })->orWhere(function ($legacy) use ($assignmentDate) {
                        $legacy->whereNull('SemesterStartDate')
                            ->whereDate('RoutineDate', $assignmentDate);
                    });
                })
                ->get();

            foreach ($classes as $class) {
                $classStart = Carbon::parse($assignmentDate.' '.$class->StartTime);
                $classEnd = Carbon::parse($assignmentDate.' '.$class->EndTime);
                if ($candidateStart->lt($classEnd) && $candidateEnd->gt($classStart)) return true;
            }
        }
        return false;
    }

    private function conflictsWithBatch(array $candidate, array $scheduled): bool
    {
        [$start, $end] = $this->times($candidate);
        foreach ($scheduled as $row) {
            if ($row['RosterPersonID'] !== $candidate['RosterPersonID'] && $row['RosterLocationID'] !== $candidate['RosterLocationID']) continue;
            [$otherStart, $otherEnd] = $this->times($row);
            if ($start->lt($otherEnd) && $end->gt($otherStart)) return true;
        }
        return false;
    }

    private function roomConflicts(array $data, ?int $ignoreId = null, ?string $ignoreSeriesId = null): bool
    {
        if ($data['Status'] !== 'Active' || empty($data['RosterLocationID'])) return false;

        [$candidateStart, $candidateEnd] = $this->times($data);
        $existing = DB::table('tblRosterAssignment')
            ->where('RosterLocationID', $data['RosterLocationID'])
            ->where('Status', 'Active')
            ->whereDate('RosterDate', $data['RosterDate'])
            ->when($ignoreId, fn ($q) => $q->where('RosterAssignmentID', '!=', $ignoreId))
            ->when($ignoreSeriesId, fn ($q) => $q->where(function ($seriesQuery) use ($ignoreSeriesId) {
                $seriesQuery->whereNull('RosterSeriesID')->orWhere('RosterSeriesID', '!=', $ignoreSeriesId);
            }))
            ->get();

        foreach ($existing as $row) {
            [$start, $end] = $this->times((array) $row);
            if ($candidateStart->lt($end) && $candidateEnd->gt($start)) return true;
        }

        return false;
    }

    private function isAcademicClassType(string $assignmentType): bool
    {
        return in_array($assignmentType, ['Class Duty', 'Makeup Class', 'Rescheduled Class'], true);
    }

    private function requiresAttendanceDevice(string $assignmentType): bool
    {
        return $this->isAcademicClassType($assignmentType) || $assignmentType === 'Exam Duty';
    }

    private function times(array $row): array
    {
        $start = Carbon::parse($row['RosterDate'].' '.$row['StartTime']);
        $end = Carbon::parse($row['RosterDate'].' '.$row['EndTime']);
        // Only an explicitly overnight duty continues onto the next calendar
        // day. A same-day class with an incorrect time value must not block
        // the teacher's following day.
        if ($row['CrossesMidnight']) $end->addDay();
        return [$start, $end];
    }

    private function baseQuery()
    {
        return DB::table('tblRosterAssignment as ra')
            ->join('tblRosterPerson as p', 'ra.RosterPersonID', '=', 'p.RosterPersonID')
            ->leftJoin('tblRosterPerson as proxy', 'ra.ProxyPersonID', '=', 'proxy.RosterPersonID')
            ->leftJoin('tblRosterShift as s', 'ra.RosterShiftID', '=', 's.RosterShiftID')
            ->leftJoin('tblRosterLocation as l', 'ra.RosterLocationID', '=', 'l.RosterLocationID')
            ->leftJoin('tblDevice as d', 'ra.DeviceID', '=', 'd.DeviceID')
            ->leftJoin('tblDepartment as dept', 'ra.DepartmentID', '=', 'dept.DepartmentID')
            ->leftJoin('tblBatch as batch', 'ra.BatchID', '=', 'batch.BatchID')
            ->leftJoin('tblSubject as subject', 'ra.SubjectID', '=', 'subject.SubjectID')
            ->select('ra.*', 'p.PersonName', 'p.RoleName', 'proxy.PersonName as ProxyPersonName', 's.ShiftName', 'l.LocationName', 'd.DeviceName', 'dept.DepartmentName as AcademicDepartmentName', 'batch.BatchName', 'batch.Session as AcademicSession', 'batch.Semester as AcademicSemester', 'subject.Code as SubjectCode', 'subject.SubjectName');
    }
}
