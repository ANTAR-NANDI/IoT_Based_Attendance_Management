<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Barryvdh\DomPDF\Facade\Pdf;
use Carbon\Carbon;

class RosterLocationReportController extends RosterReportController
{
    public function index(Request $request)
    {
        $request->validate(['report_date' => ['nullable', 'date'], 'RosterLocationID' => ['nullable', 'exists:tblRosterLocation,RosterLocationID']]);
        $reportDate = $request->input('report_date', now()->toDateString());
        $locations = DB::table('tblRosterLocation')->where('Status', 1)->orderBy('LocationName')->get();
        $locationId = $request->input('RosterLocationID');
        $location = $locationId ? $locations->firstWhere('RosterLocationID', (int) $locationId) : null;
        $rows = $locationId ? $this->attendanceRows($reportDate, $reportDate, fn ($query) => $query->where('ra.RosterLocationID', $locationId)) : collect();
        $timeline = $this->timeline($rows, $reportDate);
        return view('roster.reports.location', compact('reportDate', 'locations', 'locationId', 'location', 'rows', 'timeline'));
    }

    public function exportPdf(Request $request)
    {
        $request->validate(['report_date' => ['required', 'date'], 'RosterLocationID' => ['required', 'exists:tblRosterLocation,RosterLocationID']]);
        $reportDate = $request->report_date;
        $location = DB::table('tblRosterLocation')->where('RosterLocationID', $request->RosterLocationID)->firstOrFail();
        $rows = $this->attendanceRows($reportDate, $reportDate, fn ($query) => $query->where('ra.RosterLocationID', $location->RosterLocationID));
        $title = 'Room-wise Attendance Report';
        $subtitle = $location->LocationName.' - '.\Carbon\Carbon::parse($reportDate)->format('d M Y');
        $mode = 'room';
        return Pdf::loadView('roster.reports.selection-pdf', compact('rows', 'title', 'subtitle', 'mode'))->setPaper('a4', 'landscape')->download("room-attendance-{$reportDate}.pdf");
    }
    private function timeline($rows, string $reportDate)
    {
        $items = collect();
        $lastEnd = null;
        foreach ($rows->sortBy('StartRaw') as $row) {
            $start = Carbon::parse($reportDate.' '.$row['StartRaw']);
            $end = Carbon::parse($reportDate.' '.$row['EndRaw']);
            if ($end->lessThanOrEqualTo($start)) $end->addDay();
            if ($lastEnd && $start->gt($lastEnd)) {
                $items->push(['blank' => true, 'Start' => $lastEnd->format('h:i A'), 'End' => $start->format('h:i A')]);
            }
            $items->push(['blank' => false, 'row' => $row]);
            if (!$lastEnd || $end->gt($lastEnd)) $lastEnd = $end;
        }
        return $items;
    }
}
