<?php

namespace App\Http\Controllers;

use Illuminate\Support\Facades\DB;
use Illuminate\Http\Request;

class DashboardController extends RosterReportController
{
    public function index(Request $request)
    {
        $request->validate([
            'from_date' => ['nullable', 'date'],
            'to_date' => ['nullable', 'date', 'after_or_equal:from_date'],
            'status_from_date' => ['nullable', 'date'],
            'status_to_date' => ['nullable', 'date', 'after_or_equal:status_from_date'],
        ]);
        $fromDate = $request->input('from_date', now()->toDateString());
        $toDate = $request->input('to_date', $fromDate);
        $statusFromDate = $request->input('status_from_date', $fromDate);
        $statusToDate = $request->input('status_to_date', $statusFromDate);
        $totalRosterPeople = DB::table('tblRosterPerson')->where('Status', 1)->count();
        $totalDevices = DB::table('tblDevice')->where('Status', 1)->count();
        $totalRosterShifts = DB::table('tblRosterShift')->where('Status', 1)->count();
        $todayAssignments = DB::table('tblRosterAssignment')
            ->whereBetween('RosterDate', [$fromDate, $toDate])
            ->where('Status', 'Active')
            ->count();
        $reportLocations = DB::table('tblRosterLocation')->where('Status', 1)->orderBy('LocationName')->get();
        $reportPeople = DB::table('tblRosterPerson')->where('Status', 1)->orderBy('PersonName')->get();
        $attendanceRows = $this->attendanceRows($fromDate, $toDate);
        $statusAttendanceRows = ($statusFromDate === $fromDate && $statusToDate === $toDate)
            ? $attendanceRows
            : $this->attendanceRows($statusFromDate, $statusToDate);
        $statusCounts = [
            'Present' => $statusAttendanceRows->where('Status', 'Present')->count(),
            'Proxy' => $statusAttendanceRows->where('Status', 'Proxy')->count(),
            'No Punch-out' => $statusAttendanceRows->where('Status', 'No Punch-out')->count(),
            'Absent' => $statusAttendanceRows->where('Status', 'Absent')->count(),
            'Holiday' => $statusAttendanceRows->where('Status', 'Holiday')->count(),
        ];
        $teacherAccuracy = $attendanceRows->groupBy('PersonName')->map(function ($rows) {
            $rows = $rows->reject(fn ($row) => $row['Status'] === 'Holiday');
            $accurate = $rows->filter(fn ($row) => $row['Status'] === 'Present' && $row['LateMinutes'] === null && $row['EarlyOutMinutes'] === null)->count();
            return round($rows->isNotEmpty() ? ($accurate / $rows->count()) * 100 : 0, 1);
        })->sortDesc();
        $todayDate = now()->toDateString();
        $todayRows = ($fromDate === $todayDate && $toDate === $todayDate)
            ? $attendanceRows
            : $this->attendanceRows($todayDate, $todayDate);
        $todayTeacherCounts = ['Scheduled' => 0, 'Present' => 0, 'Absent' => 0, 'Proxy' => 0, 'Pending' => 0];
        foreach ($todayRows->reject(fn ($row) => $row['Status'] === 'Holiday')->groupBy('RosterPersonID') as $teacherRows) {
            $todayTeacherCounts['Scheduled']++;
            $hasAttendance = $teacherRows->whereIn('Status', ['Present', 'No Punch-out'])->isNotEmpty();
            $hasPendingDuty = $teacherRows->whereIn('Status', ['Upcoming', 'Running'])->isNotEmpty();
            $hasProxy = $teacherRows->where('Status', 'Proxy')->isNotEmpty();

            if ($hasAttendance) {
                $todayTeacherCounts['Present']++;
            } elseif ($hasProxy) {
                $todayTeacherCounts['Proxy']++;
            } elseif ($hasPendingDuty) {
                $todayTeacherCounts['Pending']++;
            } else {
                $todayTeacherCounts['Absent']++;
            }
        }

        // A class is "not taken" only after its check-in grace period has
        // expired and neither the assigned faculty member nor a planned proxy
        // has a valid attendance entry. Upcoming and running classes stay out
        // of this operational exception list.
        $classesNotTakenToday = $todayRows
            ->whereIn('AssignmentType', ['Class Duty', 'Makeup Class', 'Rescheduled Class', 'Exam Duty'])
            ->whereIn('Status', ['Absent', 'Late - Absent'])
            ->values();
        return view('dashboard', compact('totalRosterPeople', 'totalDevices', 'totalRosterShifts', 'todayAssignments', 'reportLocations', 'reportPeople', 'fromDate', 'toDate', 'statusFromDate', 'statusToDate', 'statusCounts', 'teacherAccuracy', 'todayDate', 'todayTeacherCounts', 'classesNotTakenToday'));
    }
}
