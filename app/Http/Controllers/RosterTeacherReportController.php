<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Barryvdh\DomPDF\Facade\Pdf;
use Carbon\Carbon;

class RosterTeacherReportController extends RosterReportController
{
    public function index(Request $request)
    {
        $request->validate(['report_date' => ['nullable', 'date'], 'RosterPersonID' => ['nullable', 'exists:tblRosterPerson,RosterPersonID']]);
        $reportDate = $request->input('report_date', now()->toDateString());
        $people = DB::table('tblRosterPerson')->where('Status', 1)->orderBy('PersonName')->get();
        $personId = $request->input('RosterPersonID');
        $person = $personId ? $people->firstWhere('RosterPersonID', (int) $personId) : null;
        $rows = $personId ? $this->attendanceRows($reportDate, $reportDate, fn ($query) => $query->where('ra.RosterPersonID', $personId)) : collect();
        $timeline = $this->timeline($rows, $reportDate);
        return view('roster.reports.teacher', compact('reportDate', 'people', 'personId', 'person', 'rows', 'timeline'));
    }

    public function exportPdf(Request $request)
    {
        $request->validate(['report_date' => ['required', 'date'], 'RosterPersonID' => ['required', 'exists:tblRosterPerson,RosterPersonID']]);
        $reportDate = $request->report_date;
        $person = DB::table('tblRosterPerson')->where('RosterPersonID', $request->RosterPersonID)->firstOrFail();
        $rows = $this->attendanceRows($reportDate, $reportDate, fn ($query) => $query->where('ra.RosterPersonID', $person->RosterPersonID));
        $title = 'Teacher-wise Attendance Report';
        $subtitle = $person->PersonName.' - '.\Carbon\Carbon::parse($reportDate)->format('d M Y');
        $mode = 'teacher';
        return Pdf::loadView('roster.reports.selection-pdf', compact('rows', 'title', 'subtitle', 'mode'))->setPaper('a4', 'landscape')->download("teacher-attendance-{$reportDate}.pdf");
    }

    private function timeline($rows, string $reportDate)
    {
        $items = collect();
        $lastEnd = null;
        foreach ($rows->sortBy('StartRaw') as $row) {
            $start = Carbon::parse($reportDate.' '.$row['StartRaw']);
            $end = Carbon::parse($reportDate.' '.$row['EndRaw']);
            if ($end->lessThanOrEqualTo($start)) $end->addDay();
            if ($lastEnd && $start->gt($lastEnd)) $items->push(['blank' => true, 'Start' => $lastEnd->format('h:i A'), 'End' => $start->format('h:i A')]);
            $items->push(['blank' => false, 'row' => $row]);
            if (!$lastEnd || $end->gt($lastEnd)) $lastEnd = $end;
        }
        return $items;
    }
}
