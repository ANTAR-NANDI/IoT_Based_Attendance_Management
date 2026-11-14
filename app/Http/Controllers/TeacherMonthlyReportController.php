<?php

namespace App\Http\Controllers;

use Carbon\Carbon;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;

class TeacherMonthlyReportController extends RosterReportController
{
    public function index(Request $request)
    {
        $request->validate([
            'month' => ['nullable', 'date_format:Y-m'],
            'RosterPersonID' => ['nullable', 'exists:tblRosterPerson,RosterPersonID'],
        ]);

        $month = $request->input('month', now()->format('Y-m'));
        $fromDate = Carbon::createFromFormat('Y-m', $month)->startOfMonth()->toDateString();
        $toDate = Carbon::createFromFormat('Y-m', $month)->endOfMonth()->toDateString();
        $teachers = DB::table('tblRosterPerson as p')
            ->join('tblRosterAssignment as ra', 'ra.RosterPersonID', '=', 'p.RosterPersonID')
            ->where('p.Status', 1)
            ->whereIn('ra.AssignmentType', ['Class Duty', 'Makeup Class', 'Rescheduled Class', 'Exam Duty'])
            ->select('p.RosterPersonID', 'p.PersonName')
            ->distinct()
            ->orderBy('p.PersonName')
            ->get();

        $rows = $this->attendanceRows($fromDate, $toDate, function ($query) use ($request) {
            $query->whereIn('ra.AssignmentType', ['Class Duty', 'Makeup Class', 'Rescheduled Class', 'Exam Duty']);
            if ($request->filled('RosterPersonID')) {
                $query->where('ra.RosterPersonID', $request->RosterPersonID);
            }
        });

        $summary = $rows->groupBy('RosterPersonID')->map(function ($teacherRows) {
            $countedRows = $teacherRows->where('Status', '!=', 'Holiday');
            return [
                'RosterPersonID' => $teacherRows->first()['RosterPersonID'],
                'PersonName' => $teacherRows->first()['PersonName'],
                'RegularClasses' => $countedRows->where('AssignmentType', 'Class Duty')->count(),
                'ExamClasses' => $countedRows->where('AssignmentType', 'Exam Duty')->count(),
                'MakeupClasses' => $countedRows->where('AssignmentType', 'Makeup Class')->count(),
                'RescheduledClasses' => $countedRows->where('AssignmentType', 'Rescheduled Class')->count(),
                'Attended' => $countedRows->whereIn('Status', ['Present', 'No Punch-out'])->count(),
                'Proxy' => $countedRows->where('Status', 'Proxy')->count(),
                'Absent' => $countedRows->whereIn('Status', ['Absent', 'Late - Absent'])->count(),
            ];
        })->sortBy('PersonName')->values();

        return view('roster.reports.teacher-monthly', compact('month', 'fromDate', 'toDate', 'teachers', 'rows', 'summary'));
    }
}
