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
        $request->validate([
            'report_date' => ['nullable', 'date'],
            'RosterLocationIDs' => ['nullable', 'array'],
            'RosterLocationIDs.*' => ['exists:tblRosterLocation,RosterLocationID'],
        ]);
        $reportDate = $request->input('report_date', now()->toDateString());
        $locations = DB::table('tblRosterLocation')->where('Status', 1)->orderBy('LocationName')->get();
        $locationIds = collect($request->input('RosterLocationIDs', []))->map(fn ($id) => (int) $id)->unique()->values();
        $selectedLocations = $locations->whereIn('RosterLocationID', $locationIds->all())->values();
        $rows = $locationIds->isNotEmpty()
            ? $this->attendanceRows($reportDate, $reportDate, fn ($query) => $query->whereIn('ra.RosterLocationID', $locationIds->all()))
            : collect();
        $matrix = $this->scheduleMatrix($rows);

        return view('roster.reports.location', compact('reportDate', 'locations', 'locationIds', 'selectedLocations', 'rows', 'matrix'));
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
        return Pdf::loadView('roster.reports.selection-pdf', compact('rows', 'title', 'subtitle', 'mode'))->setPaper('a4', 'portrait')->download("room-attendance-{$reportDate}.pdf");
    }
    private function scheduleMatrix($rows)
    {
        $slots = [];
        foreach ($rows as $row) {
            $key = $row['StartRaw'].'|'.$row['EndRaw'];
            if (!isset($slots[$key])) {
                $slots[$key] = [
                    'Start' => $row['Start'],
                    'End' => $row['End'],
                    'StartRaw' => $row['StartRaw'],
                    'rooms' => [],
                ];
            }
            $slots[$key]['rooms'][$row['RosterLocationID']] = $row;
        }

        uasort($slots, fn ($left, $right) => strcmp($left['StartRaw'], $right['StartRaw']));
        return collect($slots)->values();
    }
}
