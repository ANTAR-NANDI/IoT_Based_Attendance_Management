<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;

class FacultyStatisticsController extends RosterReportController
{
    public function show(Request $request, int $id)
    {
        $request->validate([
            'from_date' => ['nullable', 'date'],
            'to_date' => ['nullable', 'date', 'after_or_equal:from_date'],
        ]);

        $faculty = DB::table('tblRosterPerson as p')
            ->leftJoin('tblDepartment as d', 'p.DepartmentID', '=', 'd.DepartmentID')
            ->leftJoin('tblDesignation as des', 'p.DesignationID', '=', 'des.DesignationID')
            ->select('p.*', 'd.DepartmentName as SelectedDepartment', 'des.DesignationName as SelectedDesignation')
            ->where('p.RosterPersonID', $id)
            ->firstOrFail();

        $fromDate = $request->input('from_date', now()->startOfMonth()->toDateString());
        $toDate = $request->input('to_date', now()->toDateString());
        $rows = $this->attendanceRows($fromDate, $toDate, fn ($query) => $query
            ->where('ra.RosterPersonID', $faculty->RosterPersonID)
            ->whereIn('ra.AssignmentType', ['Class Duty', 'Makeup Class', 'Rescheduled Class', 'Exam Duty']));
        $countedRows = $rows->where('Status', '!=', 'Holiday');
        $totalClasses = $countedRows->count();
        $percentage = fn (int $count): float => $totalClasses ? round(($count / $totalClasses) * 100, 1) : 0;
        $attended = $countedRows->whereIn('Status', ['Present', 'No Punch-out'])->count();
        $proxy = $countedRows->where('Status', 'Proxy')->count();
        $absent = $countedRows->whereIn('Status', ['Absent', 'Late - Absent'])->count();
        $makeup = $countedRows->where('AssignmentType', 'Makeup Class')->count();
        $rescheduled = $countedRows->where('AssignmentType', 'Rescheduled Class')->count();

        $statistics = [
            ['label' => 'Total classes', 'value' => $totalClasses, 'percent' => $totalClasses ? 100 : 0, 'description' => 'Excludes holidays', 'color' => 'bg-slate-800'],
            ['label' => 'Attended', 'value' => $attended, 'percent' => $percentage($attended), 'description' => 'Faculty biometric attendance', 'color' => 'bg-emerald-600'],
            ['label' => 'Proxy', 'value' => $proxy, 'percent' => $percentage($proxy), 'description' => 'Covered by a planned proxy', 'color' => 'bg-amber-600'],
            ['label' => 'Absent', 'value' => $absent, 'percent' => $percentage($absent), 'description' => 'No valid check-in after grace', 'color' => 'bg-rose-600'],
            ['label' => 'Makeup classes', 'value' => $makeup, 'percent' => $percentage($makeup), 'description' => 'Added makeup duties', 'color' => 'bg-violet-600'],
            ['label' => 'Rescheduled', 'value' => $rescheduled, 'percent' => $percentage($rescheduled), 'description' => 'Added rescheduled duties', 'color' => 'bg-indigo-600'],
        ];

        return view('roster.people.statistics', compact('faculty', 'fromDate', 'toDate', 'rows', 'statistics', 'totalClasses'));
    }
}
