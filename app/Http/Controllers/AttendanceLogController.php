<?php

namespace App\Http\Controllers;

use Barryvdh\DomPDF\Facade\Pdf;
use Carbon\Carbon;
use Illuminate\Http\Request;
use Illuminate\Pagination\LengthAwarePaginator;
use Illuminate\Support\Facades\DB;

class AttendanceLogController extends Controller
{
    public function classAttendance(Request $request)
    {
        [$report, $summary, $fromDate, $toDate] = $this->buildReport($request);
        $perPage = 15;
        $page = LengthAwarePaginator::resolveCurrentPage();
        $paginatedReport = new LengthAwarePaginator(
            $report->slice(($page - 1) * $perPage, $perPage)->values(),
            $report->count(), $perPage, $page,
            ['path' => $request->url(), 'query' => $request->query()]
        );

        return view('reports.attendance', ['report' => $paginatedReport, 'summary' => $summary, 'fromDate' => $fromDate, 'toDate' => $toDate]);
    }

    public function exportPdf(Request $request)
    {
        [$report, $summary, $fromDate, $toDate] = $this->buildReport($request);

        return Pdf::loadView('reports.pdf', compact('report', 'summary', 'fromDate', 'toDate'))
            ->setPaper('a4', 'landscape')
            ->download("class-attendance-{$fromDate}-to-{$toDate}.pdf");
    }

    /** Shows every teacher with attendance totals for the selected reporting period. */
    public function teacherAttendance(Request $request)
    {
        [$report, , $fromDate, $toDate] = $this->buildReport($request);

        $metricsByTeacher = $report->groupBy('TeacherID')
            ->map(fn ($rows) => $this->teacherMetrics($rows));

        $teachers = DB::table('tblTeacher as t')
            ->leftJoin('tblDepartment as d', 't.DepartmentID', '=', 'd.DepartmentID')
            ->select('t.TeacherID', 't.TeacherName', 't.EmployeeID', 't.ZKUserID', 'd.DepartmentName')
            ->when($request->filled('search'), function ($query) use ($request) {
                $search = $request->search;
                $query->where(function ($inner) use ($search) {
                    $inner->where('t.TeacherName', 'like', "%{$search}%")
                        ->orWhere('t.EmployeeID', 'like', "%{$search}%")
                        ->orWhere('d.DepartmentName', 'like', "%{$search}%");
                });
            })
            ->orderBy('t.TeacherName')
            ->paginate(15)
            ->through(function ($teacher) use ($metricsByTeacher) {
                $teacher->metrics = $metricsByTeacher->get($teacher->TeacherID, $this->emptyTeacherMetrics());
                return $teacher;
            });

        return view('reports.teacher-attendance', compact('teachers', 'fromDate', 'toDate'));
    }

    /** Shows the complete attendance history and metrics for one teacher. */
    public function teacherAttendanceDetail(Request $request, int $teacherId)
    {
        $teacher = DB::table('tblTeacher as t')
            ->leftJoin('tblDepartment as d', 't.DepartmentID', '=', 'd.DepartmentID')
            ->select('t.*', 'd.DepartmentName')
            ->where('t.TeacherID', $teacherId)
            ->first();

        abort_unless($teacher, 404);

        $request->merge(['TeacherID' => $teacherId]);
        [$report, , $fromDate, $toDate] = $this->buildReport($request);
        $metrics = $this->teacherMetrics($report);

        return view('reports.teacher-attendance-detail', compact('teacher', 'report', 'metrics', 'fromDate', 'toDate'));
    }

    /** Reconciles every scheduled class with punches from its assigned room device. */
    private function buildReport(Request $request): array
    {
        $request->validate([
            'from_date' => 'nullable|date',
            'to_date' => 'nullable|date|after_or_equal:from_date',
            'TeacherID' => 'nullable|exists:tblTeacher,TeacherID',
            'BatchID' => 'nullable|exists:tblBatch,BatchID',
        ]);

        $fromDate = $request->input('from_date', now()->toDateString());
        $toDate = $request->input('to_date', $fromDate);
        $grace = $this->graceSettings();

        $routineQuery = DB::table('tblRoutine as ro')
            ->join('tblTeacher as t', 'ro.TeacherID', '=', 't.TeacherID')
            ->leftJoin('tblTeacher as pt', 'ro.ProxyTeacherID', '=', 'pt.TeacherID')
            ->join('tblSubject as s', 'ro.SubjectID', '=', 's.SubjectID')
            ->join('tblBatch as b', 'ro.BatchID', '=', 'b.BatchID')
            ->join('tblRoom as r', 'ro.RoomID', '=', 'r.RoomID')
            ->select('ro.*', 't.TeacherName', 't.ZKUserID', 'pt.TeacherName as ProxyTeacherName', 'pt.ZKUserID as ProxyTeacherZKUserID', 's.SubjectName', 'b.BatchName', 'r.RoomNo')
            // A routine is a weekly semester template, not a separate row for
            // each calendar date. Fetch every template that intersects the
            // report period, then expand its matching weekdays below.
            ->where('ro.SemesterStartDate', '<=', $toDate)
            ->where('ro.SemesterEndDate', '>=', $fromDate)
            ->where('ro.Status', 1);

        if ($request->filled('TeacherID')) {
            $routineQuery->where('ro.TeacherID', $request->TeacherID);
        }
        if ($request->filled('BatchID')) {
            $routineQuery->where('ro.BatchID', $request->BatchID);
        }

        $templates = $routineQuery->orderBy('ro.StartTime')->get();
        $routines = $templates->flatMap(function ($template) use ($fromDate, $toDate) {
            $start = Carbon::parse($template->SemesterStartDate)->max(Carbon::parse($fromDate));
            $end = Carbon::parse($template->SemesterEndDate)->min(Carbon::parse($toDate));
            $occurrences = collect();

            while ($start->lte($end)) {
                if ($start->format('l') === $template->DayName) {
                    $occurrence = clone $template;
                    $occurrence->RoutineDate = $start->toDateString();
                    $occurrences->push($occurrence);
                }
                $start->addDay();
            }

            return $occurrences;
        })->sortBy([['RoutineDate', 'asc'], ['StartTime', 'asc']])->values();
        if ($routines->isEmpty()) {
            return [collect(), collect(), $fromDate, $toDate];
        }

        $logs = DB::table('tblAttendanceLog')
            ->whereIn('DeviceID', $routines->pluck('DeviceID')->unique())
            ->whereBetween('PunchTime', [
                Carbon::parse($fromDate)->subMinutes($grace['entry_early_minutes']),
                Carbon::parse($toDate)->endOfDay()->addMinutes($grace['exit_late_minutes']),
            ])
            ->orderBy('PunchTime')->get()->groupBy('DeviceID');

        $report = $routines->map(function ($routine) use ($logs, $grace) {
            $classStart = Carbon::parse("{$routine->RoutineDate} {$routine->StartTime}");
            $classEnd = Carbon::parse("{$routine->RoutineDate} {$routine->EndTime}");
            $entryOpen = $classStart->copy()->subMinutes($grace['entry_early_minutes']);
            // Routine and grace values have minute precision, so include the
            // complete final grace minute (for example, 3:55:00-3:55:59).
            $entryClose = $classStart->copy()->addMinutes($grace['entry_late_minutes'])->endOfMinute();
            $exitOpen = $classEnd->copy()->subMinutes($grace['exit_early_minutes']);
            $exitClose = $classEnd->copy()->endOfMinute()->addMinutes($grace['exit_late_minutes']);
            $deviceLogs = ($logs->get($routine->DeviceID) ?? collect())
                ->filter(fn ($log) => Carbon::parse($log->PunchTime)->betweenIncluded(
                    $entryOpen, $exitClose
                ))->values();

            $result = [
                'RoutineID' => $routine->RoutineID, 'TeacherID' => $routine->TeacherID, 'RoutineDate' => $routine->RoutineDate, 'DayName' => $routine->DayName,
                'StartTime' => $routine->StartTime, 'EndTime' => $routine->EndTime, 'SubjectName' => $routine->SubjectName,
                'BatchName' => $routine->BatchName, 'RoomNo' => $routine->RoomNo, 'AssignedTeacher' => $routine->TeacherName,
                'GraceWindows' => $grace,
                'ActualTeacher' => null,
                'ProxyTeacher' => $routine->ProxyTeacherName,
                // A scheduled class is Upcoming before its start, Running
                // during entry grace, and Absent only after grace expires.
                'Status' => now()->lessThan($classStart)
                    ? 'Upcoming'
                    : (now()->lessThanOrEqualTo($entryClose) ? 'Running' : 'Absent'),
                'CheckIn' => null, 'CheckOut' => null,
                'ScheduledMinutes' => $classStart->diffInMinutes($classEnd), 'ActualMinutes' => null,
                'LateByMinutes' => null, 'LeftEarlyByMinutes' => null,
            ];

            if ($deviceLogs->isEmpty()) {
                return $result;
            }

            // EmployeeID from the device is the biometric enrollment number, not tblTeacher.TeacherID.
            $assignedLogs = $routine->ZKUserID === null ? collect() : $deviceLogs
                ->filter(fn ($log) => (string) $log->EmployeeID === (string) $routine->ZKUserID)->values();
            $entryLogs = $assignedLogs->filter(fn ($log) => Carbon::parse($log->PunchTime)->betweenIncluded($entryOpen, $entryClose));
            $exitLogs = $assignedLogs->filter(fn ($log) => Carbon::parse($log->PunchTime)->betweenIncluded($exitOpen, $exitClose));

            if ($entryLogs->isNotEmpty()) {
                $checkInLog = $entryLogs->first();
                $checkOutLog = $exitLogs->filter(fn ($log) => Carbon::parse($log->PunchTime)->greaterThan(Carbon::parse($checkInLog->PunchTime)))->last();
                return $this->applyPunchResult($result, $checkInLog, $checkOutLog, $routine->TeacherName, $classStart, $classEnd);
            }

            // Preserve a late scan in the report, but do not count it as a
            // valid attendance entry once the global entry grace has expired.
            $lateEntryLogs = $assignedLogs->filter(fn ($log) => Carbon::parse($log->PunchTime)->greaterThan($entryClose)
                && Carbon::parse($log->PunchTime)->lessThanOrEqualTo($classEnd->copy()->endOfMinute()));

            if ($lateEntryLogs->isNotEmpty()) {
                $checkInLog = $lateEntryLogs->first();
                $checkOutLog = $exitLogs->filter(fn ($log) => Carbon::parse($log->PunchTime)->greaterThan(Carbon::parse($checkInLog->PunchTime)))->last();

                return $this->applyPunchResult($result, $checkInLog, $checkOutLog, $routine->TeacherName, $classStart, $classEnd, 'Late - Absent');
            }

            // A proxy must be selected explicitly in the routine. Random
            // device punches never create a proxy attendance.
            $proxyEntryLogs = $routine->ProxyTeacherZKUserID === null ? collect() : $deviceLogs
                ->filter(fn ($log) => (string) $log->EmployeeID === (string) $routine->ProxyTeacherZKUserID)
                ->filter(fn ($log) => Carbon::parse($log->PunchTime)->betweenIncluded($entryOpen, $entryClose))
                ->values();

            if ($proxyEntryLogs->isEmpty()) {
                return $result;
            }

            $proxyCheckInLog = $proxyEntryLogs->first();
            $proxyCheckOutLog = $deviceLogs
                ->filter(fn ($log) => (string) $log->EmployeeID === (string) $proxyCheckInLog->EmployeeID)
                ->filter(fn ($log) => Carbon::parse($log->PunchTime)->betweenIncluded($exitOpen, $exitClose))
                ->filter(fn ($log) => Carbon::parse($log->PunchTime)->greaterThan(Carbon::parse($proxyCheckInLog->PunchTime)))
                ->last();

            return $this->applyPunchResult($result, $proxyCheckInLog, $proxyCheckOutLog, $routine->ProxyTeacherName, $classStart, $classEnd, 'Proxy');
        });

        $summary = $report->groupBy('AssignedTeacher')->map(function ($rows, $teacherName) {
            // A proxy punch proves somebody else was in the room; it must not
            // give attendance-time credit to the assigned teacher.
            $creditedRows = $rows->whereNotIn('Status', ['Proxy', 'Late - Absent']);
            $noPunchOutRows = $rows->filter(fn ($row) => $row['CheckIn'] !== null && $row['CheckOut'] === null);
            $absentRows = $rows
                ->whereIn('Status', ['Absent', 'Late - Absent'])
                ->filter(fn ($row) => !($row['CheckIn'] !== null && $row['CheckOut'] === null));

            return [
                'TeacherName' => $teacherName, 'TotalClasses' => $rows->count(),
                'Present' => $rows->where('Status', 'Present')->count(),
                'Absent' => $absentRows->count(),
                'Upcoming' => $rows->where('Status', 'Upcoming')->count(),
                'Proxy' => $rows->where('Status', 'Proxy')->count(), 'Incomplete' => $rows->where('Status', 'Incomplete Punch')->count(),
                'NoPunchOut' => $noPunchOutRows->count(),
                'ScheduledMinutes' => $creditedRows->sum('ScheduledMinutes'),
                'ActualMinutes' => $creditedRows->sum('ActualMinutes'),
            ];
        })->values();

        return [$report, $summary, $fromDate, $toDate];
    }

    private function teacherMetrics($rows): array
    {
        $attendedStatuses = collect(['Present', 'Incomplete Punch']);
        $attendedRows = $rows->whereIn('Status', $attendedStatuses);
        $dailyRows = $rows->groupBy('RoutineDate');

        return [
            'ScheduledDays' => $dailyRows->count(),
            'AttendedDays' => $attendedRows->pluck('RoutineDate')->unique()->count(),
            'FullyPresentDays' => $dailyRows->filter(fn ($day) => $day->every(fn ($row) => $row['Status'] === 'Present'))->count(),
            'TotalClasses' => $rows->count(),
            'Present' => $rows->where('Status', 'Present')->count(),
            'Late' => $rows->filter(fn ($row) => $row['LateByMinutes'] !== null)->count(),
            'Absent' => $rows->whereIn('Status', ['Absent', 'Late - Absent'])->count(),
            'MissedClasses' => $rows->whereIn('Status', ['Absent', 'Late - Absent'])->count(),
            'Proxy' => $rows->where('Status', 'Proxy')->count(),
            'Incomplete' => $rows->where('Status', 'Incomplete Punch')->count(),
            'LeftEarly' => $rows->filter(fn ($row) => $row['LeftEarlyByMinutes'] !== null)->count(),
        ];
    }

    private function emptyTeacherMetrics(): array
    {
        return [
            'ScheduledDays' => 0, 'AttendedDays' => 0, 'FullyPresentDays' => 0, 'TotalClasses' => 0,
            'Present' => 0, 'Late' => 0, 'Absent' => 0, 'MissedClasses' => 0, 'Proxy' => 0,
            'Incomplete' => 0, 'LeftEarly' => 0,
        ];
    }

    private function graceSettings(): array
    {
        $settings = DB::table('tblAttendanceSetting')->where('id', 1)->first();

        return [
            'entry_early_minutes' => $settings?->EntryEarlyMinutes ?? config('attendance.entry_early_minutes'),
            'entry_late_minutes' => $settings?->EntryLateMinutes ?? config('attendance.entry_late_minutes'),
            'exit_early_minutes' => $settings?->ExitEarlyMinutes ?? config('attendance.exit_early_minutes'),
            'exit_late_minutes' => $settings?->ExitLateMinutes ?? config('attendance.exit_late_minutes'),
        ];
    }

    private function applyPunchResult(array $result, $checkInLog, $checkOutLog, string $actualTeacher, Carbon $classStart, Carbon $classEnd, ?string $status = null): array
    {
        $checkIn = Carbon::parse($checkInLog->PunchTime);
        $checkOut = $checkOutLog ? Carbon::parse($checkOutLog->PunchTime) : null;

        $result['ActualTeacher'] = $actualTeacher;
        $result['Status'] = $status ?? ($checkOut ? 'Present' : 'Incomplete Punch');
        $result['CheckIn'] = $checkIn->format('h:i A');
        $result['CheckOut'] = $checkOut?->format('h:i A');
        $result['ActualMinutes'] = $checkOut ? (int) round($checkIn->diffInMinutes($checkOut)) : null;

        if ($checkIn->greaterThan($classStart)) {
            $result['LateByMinutes'] = (int) round($classStart->diffInMinutes($checkIn));
        }
        if ($checkOut && $checkOut->lessThan($classEnd)) {
            $result['LeftEarlyByMinutes'] = (int) round($checkOut->diffInMinutes($classEnd));
        }

        return $result;
    }
}
