<?php

namespace App\Http\Controllers;

use Barryvdh\DomPDF\Facade\Pdf;
use Carbon\Carbon;
use Illuminate\Http\Request;
use Illuminate\Pagination\LengthAwarePaginator;
use Illuminate\Support\Facades\DB;

class AttendanceLogController extends Controller
{
    private const EARLY_PUNCH_BUFFER_MIN = 15;
    private const LATE_PUNCH_BUFFER_MIN = 20;

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

        $routineQuery = DB::table('tblRoutine as ro')
            ->join('tblTeacher as t', 'ro.TeacherID', '=', 't.TeacherID')
            ->join('tblSubject as s', 'ro.SubjectID', '=', 's.SubjectID')
            ->join('tblBatch as b', 'ro.BatchID', '=', 'b.BatchID')
            ->join('tblRoom as r', 'ro.RoomID', '=', 'r.RoomID')
            ->select('ro.*', 't.TeacherName', 't.ZKUserID', 's.SubjectName', 'b.BatchName', 'r.RoomNo')
            ->whereBetween('ro.RoutineDate', [$fromDate, $toDate])
            ->where('ro.Status', 1);

        if ($request->filled('TeacherID')) {
            $routineQuery->where('ro.TeacherID', $request->TeacherID);
        }
        if ($request->filled('BatchID')) {
            $routineQuery->where('ro.BatchID', $request->BatchID);
        }

        $routines = $routineQuery->orderBy('ro.RoutineDate')->orderBy('ro.StartTime')->get();
        if ($routines->isEmpty()) {
            return [collect(), collect(), $fromDate, $toDate];
        }

        $logs = DB::table('tblAttendanceLog')
            ->whereIn('DeviceID', $routines->pluck('DeviceID')->unique())
            ->whereBetween('PunchTime', [
                Carbon::parse($fromDate)->subMinutes(self::EARLY_PUNCH_BUFFER_MIN),
                Carbon::parse($toDate)->endOfDay()->addMinutes(self::LATE_PUNCH_BUFFER_MIN),
            ])
            ->orderBy('PunchTime')->get()->groupBy('DeviceID');

        $teacherNamesByZkUserId = DB::table('tblTeacher')->whereNotNull('ZKUserID')->pluck('TeacherName', 'ZKUserID');

        $report = $routines->map(function ($routine) use ($logs, $teacherNamesByZkUserId) {
            $classStart = Carbon::parse("{$routine->RoutineDate} {$routine->StartTime}");
            $classEnd = Carbon::parse("{$routine->RoutineDate} {$routine->EndTime}");
            $deviceLogs = ($logs->get($routine->DeviceID) ?? collect())
                ->filter(fn ($log) => Carbon::parse($log->PunchTime)->betweenIncluded(
                    $classStart->copy()->subMinutes(self::EARLY_PUNCH_BUFFER_MIN),
                    $classEnd->copy()->addMinutes(self::LATE_PUNCH_BUFFER_MIN)
                ))->values();

            $result = [
                'RoutineID' => $routine->RoutineID, 'RoutineDate' => $routine->RoutineDate, 'DayName' => $routine->DayName,
                'StartTime' => $routine->StartTime, 'EndTime' => $routine->EndTime, 'SubjectName' => $routine->SubjectName,
                'BatchName' => $routine->BatchName, 'RoomNo' => $routine->RoomNo, 'AssignedTeacher' => $routine->TeacherName,
                'ActualTeacher' => null, 'Status' => 'Absent', 'CheckIn' => null, 'CheckOut' => null,
                'ScheduledMinutes' => $classStart->diffInMinutes($classEnd), 'ActualMinutes' => null,
                'LateByMinutes' => null, 'LeftEarlyByMinutes' => null,
            ];

            if ($deviceLogs->isEmpty()) {
                return $result;
            }

            // EmployeeID from the device is the biometric enrollment number, not tblTeacher.TeacherID.
            $assignedLogs = $routine->ZKUserID === null ? collect() : $deviceLogs
                ->filter(fn ($log) => (string) $log->EmployeeID === (string) $routine->ZKUserID)->values();

            if ($assignedLogs->isNotEmpty()) {
                return $this->applyPunchResult($result, $assignedLogs, $routine->TeacherName, $classStart, $classEnd, (int) $routine->GraceMinute);
            }

            $actualIds = $deviceLogs->pluck('EmployeeID')->unique()->values();
            $actualNames = $actualIds->map(fn ($id) => $teacherNamesByZkUserId->get($id))->filter()->implode(', ');

            return $this->applyPunchResult($result, $deviceLogs, $actualNames ?: 'Unknown ZKT user: '.$actualIds->implode(', '), $classStart, $classEnd, (int) $routine->GraceMinute, 'Proxy');
        });

        $summary = $report->groupBy('AssignedTeacher')->map(function ($rows, $teacherName) {
            return [
                'TeacherName' => $teacherName, 'TotalClasses' => $rows->count(),
                'Present' => $rows->where('Status', 'Present')->count(), 'Absent' => $rows->where('Status', 'Absent')->count(),
                'Proxy' => $rows->where('Status', 'Proxy')->count(), 'Incomplete' => $rows->where('Status', 'Incomplete Punch')->count(),
                'ScheduledMinutes' => $rows->sum('ScheduledMinutes'), 'ActualMinutes' => $rows->sum('ActualMinutes'),
            ];
        })->values();

        return [$report, $summary, $fromDate, $toDate];
    }

    private function applyPunchResult(array $result, $punches, string $actualTeacher, Carbon $classStart, Carbon $classEnd, int $graceMinute, ?string $status = null): array
    {
        $checkIn = Carbon::parse($punches->first()->PunchTime);
        $checkOut = $punches->count() >= 2 ? Carbon::parse($punches->last()->PunchTime) : null;

        $result['ActualTeacher'] = $actualTeacher;
        $result['Status'] = $status ?? ($checkOut ? 'Present' : 'Incomplete Punch');
        $result['CheckIn'] = $checkIn->format('h:i A');
        $result['CheckOut'] = $checkOut?->format('h:i A');
        $result['ActualMinutes'] = $checkOut ? $checkIn->diffInMinutes($checkOut) : null;

        if ($status === null && $checkIn->greaterThan($classStart->copy()->addMinutes($graceMinute))) {
            $result['LateByMinutes'] = $classStart->copy()->addMinutes($graceMinute)->diffInMinutes($checkIn);
        }
        if ($checkOut && $checkOut->lessThan($classEnd)) {
            $result['LeftEarlyByMinutes'] = $checkOut->diffInMinutes($classEnd);
        }

        return $result;
    }
}
