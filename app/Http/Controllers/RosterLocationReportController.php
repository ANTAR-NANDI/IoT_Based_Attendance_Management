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
            'from_date' => ['nullable', 'date'],
            'to_date' => ['nullable', 'date', 'after_or_equal:from_date'],
            'RosterLocationIDs' => ['nullable', 'array'],
            'RosterLocationIDs.*' => ['exists:tblRosterLocation,RosterLocationID'],
        ]);
        $fromDate = $request->input('from_date', now()->toDateString());
        $toDate = $request->input('to_date', $fromDate);
        $locations = DB::table('tblRosterLocation')->where('Status', 1)->orderBy('LocationName')->get();
        $locationIds = collect($request->input('RosterLocationIDs', []))->map(fn ($id) => (int) $id)->unique()->values();
        $selectedLocations = $locations->whereIn('RosterLocationID', $locationIds->all())->values();
        $rows = $locationIds->isNotEmpty()
            ? $this->attendanceRows($fromDate, $toDate, fn ($query) => $query->whereIn('ra.RosterLocationID', $locationIds->all()))
            : collect();
        $matrix = $this->scheduleMatrix($rows);

        return view('roster.reports.location', compact('fromDate', 'toDate', 'locations', 'locationIds', 'selectedLocations', 'rows', 'matrix'));
    }

    public function exportPdf(Request $request)
    {
        $request->validate([
            'from_date' => ['required', 'date'],
            'to_date' => ['required', 'date', 'after_or_equal:from_date'],
            'RosterLocationIDs' => ['required', 'array', 'min:1'],
            'RosterLocationIDs.*' => ['exists:tblRosterLocation,RosterLocationID'],
        ]);
        $fromDate = $request->from_date;
        $toDate = $request->to_date;
        $locationIds = collect($request->RosterLocationIDs)->map(fn ($id) => (int) $id)->unique()->values();
        $selectedLocations = DB::table('tblRosterLocation')->whereIn('RosterLocationID', $locationIds)->orderBy('LocationName')->get();
        $rows = $this->attendanceRows($fromDate, $toDate, fn ($query) => $query->whereIn('ra.RosterLocationID', $locationIds->all()));
        $matrix = $this->scheduleMatrix($rows);
        $title = 'Room-wise Attendance Report';
        $subtitle = $selectedLocations->pluck('LocationName')->join(', ').' - '.\Carbon\Carbon::parse($fromDate)->format('d M Y').' to '.\Carbon\Carbon::parse($toDate)->format('d M Y');
        return Pdf::loadView('roster.reports.room-matrix-pdf', compact('matrix', 'selectedLocations', 'title', 'subtitle'))
            ->setPaper('a4', 'portrait')
            ->stream("room-attendance-{$fromDate}-to-{$toDate}.pdf");
    }
    private function scheduleMatrix($rows)
    {
        $slots = [];
        foreach ($rows as $row) {
            $key = $row['RosterDate'].'|'.$row['StartRaw'].'|'.$row['EndRaw'];
            if (!isset($slots[$key])) {
                $slots[$key] = [
                    'Date' => $row['RosterDate'],
                    'Start' => $row['Start'],
                    'End' => $row['End'],
                    'StartRaw' => $row['StartRaw'],
                    'rooms' => [],
                ];
            }
            $slots[$key]['rooms'][$row['RosterLocationID']] = $row;
        }

        uasort($slots, fn ($left, $right) => strcmp($left['Date'].' '.$left['StartRaw'], $right['Date'].' '.$right['StartRaw']));
        return collect($slots)->values();
    }
}
