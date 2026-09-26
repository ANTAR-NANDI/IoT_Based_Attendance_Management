<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Barryvdh\DomPDF\Facade\Pdf;

class RosterTeacherReportController extends RosterReportController
{
    public function index(Request $request)
    {
        $request->validate([
            'report_date' => ['nullable', 'date'],
            'RosterPersonIDs' => ['nullable', 'array'],
            'RosterPersonIDs.*' => ['exists:tblRosterPerson,RosterPersonID'],
        ]);
        $reportDate = $request->input('report_date', now()->toDateString());
        $people = DB::table('tblRosterPerson')->where('Status', 1)->orderBy('PersonName')->get();
        $personIds = collect($request->input('RosterPersonIDs', []))->map(fn ($id) => (int) $id)->unique()->values();
        $selectedPeople = $people->whereIn('RosterPersonID', $personIds->all())->values();
        $rows = $personIds->isNotEmpty()
            ? $this->attendanceRows($reportDate, $reportDate, fn ($query) => $query->whereIn('ra.RosterPersonID', $personIds->all()))
            : collect();
        $matrix = $this->scheduleMatrix($rows);

        return view('roster.reports.teacher', compact('reportDate', 'people', 'personIds', 'selectedPeople', 'rows', 'matrix'));
    }

    public function exportPdf(Request $request)
    {
        $request->validate([
            'report_date' => ['required', 'date'],
            'RosterPersonIDs' => ['required', 'array', 'min:1'],
            'RosterPersonIDs.*' => ['exists:tblRosterPerson,RosterPersonID'],
        ]);
        $reportDate = $request->report_date;
        $personIds = collect($request->RosterPersonIDs)->map(fn ($id) => (int) $id)->unique()->values();
        $selectedPeople = DB::table('tblRosterPerson')->whereIn('RosterPersonID', $personIds)->orderBy('PersonName')->get();
        $rows = $this->attendanceRows($reportDate, $reportDate, fn ($query) => $query->whereIn('ra.RosterPersonID', $personIds->all()));
        $matrix = $this->scheduleMatrix($rows);
        $title = 'Teacher-wise Attendance Report';
        $subtitle = $selectedPeople->pluck('PersonName')->join(', ').' - '.\Carbon\Carbon::parse($reportDate)->format('d M Y');
        return Pdf::loadView('roster.reports.teacher-matrix-pdf', compact('matrix', 'selectedPeople', 'title', 'subtitle'))
            ->setPaper('a4', 'portrait')
            ->stream("teacher-attendance-{$reportDate}.pdf");
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
                    'people' => [],
                ];
            }
            $slots[$key]['people'][$row['RosterPersonID']] = $row;
        }
        uasort($slots, fn ($left, $right) => strcmp($left['StartRaw'], $right['StartRaw']));
        return collect($slots)->values();
    }
}
