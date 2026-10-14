<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;

class EmployeeAttendanceController extends RosterReportController
{
    public function index(Request $request)
    {
        $request->validate([
            'from_date' => ['nullable', 'date'],
            'to_date' => ['nullable', 'date', 'after_or_equal:from_date'],
        ]);

        $personId = $request->user()->RosterPersonID;
        abort_unless($personId, 403, 'Your employee account has not been linked to an employee profile.');

        $fromDate = $request->input('from_date', now()->startOfMonth()->toDateString());
        $toDate = $request->input('to_date', now()->toDateString());
        $rows = $this->attendanceRows($fromDate, $toDate, fn ($query) => $query->where('ra.RosterPersonID', $personId));
        $summary = $this->summaryFor($rows)->first();

        return view('employee.attendance', compact('rows', 'summary', 'fromDate', 'toDate'));
    }
}
