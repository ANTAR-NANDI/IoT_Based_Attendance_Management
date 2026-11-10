<?php

namespace App\Http\Controllers;

use Barryvdh\DomPDF\Facade\Pdf;
use Illuminate\Http\Request;
use Illuminate\Pagination\LengthAwarePaginator;
use Illuminate\Support\Facades\DB;

class EmployeeAttendanceController extends RosterReportController
{
    public function index(Request $request)
    {
        ['person' => $person, 'rows' => $rows, 'summary' => $summary, 'holidayCount' => $holidayCount, 'attendanceRate' => $attendanceRate, 'fromDate' => $fromDate, 'toDate' => $toDate] = $this->attendanceData($request);
        $recentRows = $rows->take(5);

        return view('employee.dashboard', compact('person', 'recentRows', 'summary', 'holidayCount', 'attendanceRate', 'fromDate', 'toDate'));
    }

    public function report(Request $request)
    {
        $data = $this->attendanceData($request);
        $perPage = min(100, max(10, (int) $request->input('per_page', 25)));
        $page = LengthAwarePaginator::resolveCurrentPage();
        $data['rows'] = new LengthAwarePaginator(
            $data['rows']->forPage($page, $perPage)->values(),
            $data['rows']->count(),
            $perPage,
            $page,
            ['path' => $request->url(), 'query' => $request->query()]
        );
        $data['perPage'] = $perPage;

        return view('employee.attendance', $data);
    }

    public function exportPdf(Request $request)
    {
        ['person' => $person, 'rows' => $rows, 'summary' => $summary, 'fromDate' => $fromDate, 'toDate' => $toDate] = $this->attendanceData($request);

        return Pdf::loadView('employee.attendance-pdf', compact('person', 'rows', 'summary', 'fromDate', 'toDate'))
            ->setPaper('a4', 'landscape')
            ->download("my-attendance-{$fromDate}-to-{$toDate}.pdf");
    }

    private function attendanceData(Request $request): array
    {
        $request->validate([
            'from_date' => ['nullable', 'date'],
            'to_date' => ['nullable', 'date', 'after_or_equal:from_date'],
        ]);

        $person = $this->employeeProfile($request);
        $fromDate = $request->input('from_date', now()->startOfMonth()->toDateString());
        $toDate = $request->input('to_date', now()->toDateString());
        $rows = $this->attendanceRows($fromDate, $toDate, fn ($query) => $query->where('ra.RosterPersonID', $person->RosterPersonID));
        $summary = $this->summaryFor($rows)->first() ?? $this->emptySummary($person);

        return compact('person', 'rows', 'summary', 'fromDate', 'toDate') + [
            'holidayCount' => $rows->where('Status', 'Holiday')->count(),
            'attendanceRate' => $summary['Scheduled'] > 0 ? round(($summary['Present'] / $summary['Scheduled']) * 100, 1) : 0,
        ];
    }

    private function employeeProfile(Request $request)
    {
        $personId = $request->user()->RosterPersonID;
        abort_unless($personId, 403, 'Your employee account has not been linked to an employee profile.');

        return DB::table('tblRosterPerson as p')
            ->leftJoin('tblDepartment as d', 'p.DepartmentID', '=', 'd.DepartmentID')
            ->select('p.*', 'd.DepartmentName as SelectedDepartment')
            ->where('p.RosterPersonID', $personId)
            ->firstOrFail();
    }

    private function emptySummary($person): array
    {
        return [
            'RoleName' => $person->RoleName,
            'PersonName' => $person->PersonName,
            'Scheduled' => 0,
            'Present' => 0,
            'Proxy' => 0,
            'Late' => 0,
            'EarlyOut' => 0,
            'NoPunchOut' => 0,
            'Absent' => 0,
            'ScheduledMinutes' => 0,
            'ActualMinutes' => 0,
            'ShortMinutes' => 0,
        ];
    }
}
