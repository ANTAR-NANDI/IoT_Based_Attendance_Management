<?php

namespace App\Http\Controllers;

use Illuminate\Support\Facades\DB;
use Illuminate\Http\Request;

class DashboardController extends RosterReportController
{
    public function index(Request $request)
    {
        $request->validate(['from_date' => ['nullable', 'date'], 'to_date' => ['nullable', 'date', 'after_or_equal:from_date']]);
        $fromDate = $request->input('from_date', now()->toDateString());
        $toDate = $request->input('to_date', $fromDate);
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
        $statusCounts = [
            'Present' => $attendanceRows->where('Status', 'Present')->count(),
            'Proxy' => $attendanceRows->where('Status', 'Proxy')->count(),
            'No Punch-out' => $attendanceRows->where('Status', 'No Punch-out')->count(),
            'Absent' => $attendanceRows->where('Status', 'Absent')->count(),
        ];
        $teacherAccuracy = $attendanceRows->groupBy('PersonName')->map(function ($rows) {
            $accurate = $rows->filter(fn ($row) => $row['Status'] === 'Present' && $row['LateMinutes'] === null && $row['EarlyOutMinutes'] === null)->count();
            return round($rows->isNotEmpty() ? ($accurate / $rows->count()) * 100 : 0, 1);
        })->sortDesc();
        $dashboardMetrics = [
            ['label' => 'Scheduled duties', 'value' => $todayAssignments, 'color' => 'bg-blue-600'],
            ['label' => 'Present', 'value' => $statusCounts['Present'], 'color' => 'bg-emerald-600'],
            ['label' => 'Proxy coverage', 'value' => $statusCounts['Proxy'], 'color' => 'bg-amber-600'],
            ['label' => 'Total short time', 'value' => round($attendanceRows->sum('ShortMinutes'), 1).' min', 'color' => 'bg-rose-600'],
        ];

        return view('dashboard', compact('totalRosterPeople', 'totalDevices', 'totalRosterShifts', 'todayAssignments', 'reportLocations', 'reportPeople', 'fromDate', 'toDate', 'statusCounts', 'teacherAccuracy', 'dashboardMetrics'));
    }
}
