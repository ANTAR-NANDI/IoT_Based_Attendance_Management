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
            'from_date' => ['nullable', 'date'],
            'to_date' => ['nullable', 'date', 'after_or_equal:from_date'],
            'RosterPersonIDs' => ['nullable', 'array'],
            'RosterPersonIDs.*' => ['exists:tblRosterPerson,RosterPersonID'],
        ]);
        $fromDate = $request->input('from_date', now()->toDateString());
        $toDate = $request->input('to_date', $fromDate);
        $people = DB::table('tblRosterPerson')->where('Status', 1)->orderBy('PersonName')->get();
        $personIds = collect($request->input('RosterPersonIDs', []))->map(fn ($id) => (int) $id)->unique()->values();
        $selectedPeople = $people->whereIn('RosterPersonID', $personIds->all())->values();
        $rows = $personIds->isNotEmpty()
            ? $this->attendanceRows($fromDate, $toDate, fn ($query) => $query->whereIn('ra.RosterPersonID', $personIds->all()))
            : collect();
        $matrix = $this->scheduleMatrix($rows);

        return view('roster.reports.teacher', compact('fromDate', 'toDate', 'people', 'personIds', 'selectedPeople', 'rows', 'matrix'));
    }

    public function exportPdf(Request $request)
    {
        $request->validate([
            'from_date' => ['required', 'date'],
            'to_date' => ['required', 'date', 'after_or_equal:from_date'],
            'RosterPersonIDs' => ['required', 'array', 'min:1'],
            'RosterPersonIDs.*' => ['exists:tblRosterPerson,RosterPersonID'],
        ]);
        $fromDate = $request->from_date;
        $toDate = $request->to_date;
        $personIds = collect($request->RosterPersonIDs)->map(fn ($id) => (int) $id)->unique()->values();
        $selectedPeople = DB::table('tblRosterPerson')->whereIn('RosterPersonID', $personIds)->orderBy('PersonName')->get();
        $rows = $this->attendanceRows($fromDate, $toDate, fn ($query) => $query->whereIn('ra.RosterPersonID', $personIds->all()));
        $matrix = $this->scheduleMatrix($rows);
        $title = 'Teacher-wise Attendance Report';
        $subtitle = $selectedPeople->pluck('PersonName')->join(', ').' - '.\Carbon\Carbon::parse($fromDate)->format('d M Y').' to '.\Carbon\Carbon::parse($toDate)->format('d M Y');
        return Pdf::loadView('roster.reports.teacher-matrix-pdf', compact('matrix', 'selectedPeople', 'title', 'subtitle'))
            ->setPaper('a4', 'portrait')
            ->stream("teacher-attendance-{$fromDate}-to-{$toDate}.pdf");
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
                    'people' => [],
                ];
            }
            $slots[$key]['people'][$row['RosterPersonID']] = $row;
        }
        uasort($slots, fn ($left, $right) => strcmp($left['Date'].' '.$left['StartRaw'], $right['Date'].' '.$right['StartRaw']));
        return collect($slots)->values();
    }
}
