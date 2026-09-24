<?php

namespace App\Http\Controllers;

use Carbon\Carbon;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Barryvdh\DomPDF\Facade\Pdf;

class RosterReportController extends Controller
{
    public function index(Request $request)
    {
        $request->validate(['from_date' => ['nullable', 'date'], 'to_date' => ['nullable', 'date', 'after_or_equal:from_date'], 'role' => ['nullable', 'string']]);
        $fromDate = $request->input('from_date', now()->toDateString());
        $toDate = $request->input('to_date', $fromDate);
        $rows = $this->attendanceRows($fromDate, $toDate, function ($query) use ($request) {
            if ($request->filled('role')) $query->where('p.RoleName', $request->role);
        });
        $summary = $this->summaryFor($rows);

        $roles = DB::table('tblRosterPerson')->distinct()->orderBy('RoleName')->pluck('RoleName');
        return view('roster.reports.index', compact('rows', 'summary', 'fromDate', 'toDate', 'roles'));
    }

    public function exportPdf(Request $request)
    {
        $request->validate(['from_date' => ['nullable', 'date'], 'to_date' => ['nullable', 'date', 'after_or_equal:from_date'], 'role' => ['nullable', 'string']]);
        $fromDate = $request->input('from_date', now()->toDateString());
        $toDate = $request->input('to_date', $fromDate);
        $rows = $this->attendanceRows($fromDate, $toDate, function ($query) use ($request) {
            if ($request->filled('role')) $query->where('p.RoleName', $request->role);
        });
        $summary = $this->summaryFor($rows);
        $role = $request->input('role', 'All roles');
        return Pdf::loadView('roster.reports.pdf', compact('rows', 'summary', 'fromDate', 'toDate', 'role'))
            ->setPaper('a4', 'landscape')
            ->download("roster-attendance-{$fromDate}-to-{$toDate}.pdf");
    }

    protected function summaryFor($rows)
    {
        return $rows->groupBy(fn ($row) => $row['RoleName'].'|'.$row['PersonName'])->map(function ($items) {
            return [
                'RoleName' => $items->first()['RoleName'], 'PersonName' => $items->first()['PersonName'],
                'Scheduled' => $items->count(), 'Present' => $items->where('Status', 'Present')->count(),
                'Proxy' => $items->where('Status', 'Proxy')->count(), 'Late' => $items->whereNotNull('LateMinutes')->count(),
                'EarlyOut' => $items->whereNotNull('EarlyOutMinutes')->count(), 'NoPunchOut' => $items->where('Status', 'No Punch-out')->count(),
                'Absent' => $items->whereIn('Status', ['Absent', 'Late - Absent'])->count(),
                'ScheduledMinutes' => $items->sum('ScheduledMinutes'), 'ActualMinutes' => $items->sum('ActualMinutes'), 'ShortMinutes' => $items->sum('ShortMinutes'),
            ];
        })->values();
    }

    protected function attendanceRows(string $fromDate, string $toDate, ?callable $filter = null)
    {
        $query = DB::table('tblRosterAssignment as ra')
            ->join('tblRosterPerson as p', 'ra.RosterPersonID', '=', 'p.RosterPersonID')
            ->leftJoin('tblRosterPerson as proxy', 'ra.ProxyPersonID', '=', 'proxy.RosterPersonID')
            ->leftJoin('tblRosterLocation as l', 'ra.RosterLocationID', '=', 'l.RosterLocationID')
            ->leftJoin('tblDevice as d', 'ra.DeviceID', '=', 'd.DeviceID')
            ->leftJoin('tblDepartment as dept', 'ra.DepartmentID', '=', 'dept.DepartmentID')
            ->leftJoin('tblBatch as batch', 'ra.BatchID', '=', 'batch.BatchID')
            ->leftJoin('tblSubject as subject', 'ra.SubjectID', '=', 'subject.SubjectID')
            ->select('ra.*', 'p.PersonName', 'p.RoleName', 'p.ZKUserID', 'proxy.PersonName as ProxyPersonName', 'proxy.ZKUserID as ProxyZKUserID', 'l.LocationName', 'd.DeviceName', 'dept.DepartmentName as AcademicDepartmentName', 'batch.BatchName', 'batch.Session as AcademicSession', 'batch.Semester as AcademicSemester', 'subject.Code as SubjectCode', 'subject.SubjectName')
            ->whereBetween('ra.RosterDate', [$fromDate, $toDate])->where('ra.Status', 'Active');
        if ($filter) $filter($query);
        $assignments = $query->orderBy('ra.RosterDate')->orderBy('ra.StartTime')->get();

        $logs = $assignments->isEmpty() ? collect() : DB::table('tblAttendanceLog')
            ->whereIn('DeviceID', $assignments->pluck('DeviceID')->filter()->unique())
            ->whereBetween('PunchTime', [Carbon::parse($fromDate)->subDay(), Carbon::parse($toDate)->endOfDay()->addDay()])
            ->orderBy('PunchTime')->get()->groupBy('DeviceID');

        $grace = DB::table('tblRosterSetting')->where('id', 1)->firstOrFail();
        return $assignments->map(fn ($assignment) => $this->evaluate($assignment, $logs, $grace));
    }

    protected function evaluate($a, $logs, $grace): array
    {
        $start = Carbon::parse($a->RosterDate.' '.$a->StartTime);
        $end = Carbon::parse($a->RosterDate.' '.$a->EndTime);
        if ($a->CrossesMidnight || $end->lessThanOrEqualTo($start)) $end->addDay();
        $entryOpen = $start->copy()->subMinutes($grace->EntryEarlyMinutes);
        $entryClose = $start->copy()->addMinutes($grace->EntryLateMinutes)->endOfMinute();
        $exitOpen = $end->copy()->subMinutes($grace->ExitEarlyMinutes);
        $exitClose = $end->copy()->addMinutes($grace->ExitLateMinutes)->endOfMinute();
        $deviceLogs = ($logs->get($a->DeviceID) ?? collect())->filter(fn ($log) => Carbon::parse($log->PunchTime)->betweenIncluded($entryOpen, $exitClose))->values();
        $result = ['RosterDate' => $a->RosterDate, 'PersonName' => $a->PersonName, 'RoleName' => $a->RoleName, 'ProxyPersonName' => $a->ProxyPersonName, 'LocationName' => $a->LocationName, 'DeviceName' => $a->DeviceName, 'AcademicDepartmentName' => $a->AcademicDepartmentName, 'BatchName' => $a->BatchName, 'AcademicSession' => $a->AcademicSession, 'AcademicSemester' => $a->AcademicSemester, 'SubjectCode' => $a->SubjectCode, 'SubjectName' => $a->SubjectName, 'AssignmentType' => $a->AssignmentType, 'Start' => $start->format('h:i A'), 'End' => $end->format('h:i A'), 'StartRaw' => $start->format('H:i:s'), 'EndRaw' => $end->format('H:i:s'), 'CheckIn' => null, 'CheckOut' => null, 'ActualPerson' => null, 'Status' => now()->lt($start) ? 'Upcoming' : (now()->lte($entryClose) ? 'Running' : 'Absent'), 'ScheduledMinutes' => $start->diffInMinutes($end), 'ActualMinutes' => 0, 'ShortMinutes' => $start->diffInMinutes($end), 'LateMinutes' => null, 'EarlyOutMinutes' => null];
        foreach ([['zk' => $a->ZKUserID, 'name' => $a->PersonName, 'proxy' => false], ['zk' => $a->ProxyZKUserID, 'name' => $a->ProxyPersonName, 'proxy' => true]] as $candidate) {
            if (!$candidate['zk']) continue;
            $personLogs = $deviceLogs->filter(fn ($log) => (string) $log->EmployeeID === (string) $candidate['zk'])->values();
            $entries = $personLogs->filter(fn ($log) => Carbon::parse($log->PunchTime)->betweenIncluded($entryOpen, $entryClose));
            if ($entries->isEmpty()) continue;
            $in = Carbon::parse($entries->first()->PunchTime);
            // The first valid punch is check-in and the last later punch before
            // the close of the duty window is check-out. This deliberately
            // includes an early departure so it can be reported as Early out.
            $outs = $personLogs->filter(fn ($log) => Carbon::parse($log->PunchTime)->gt($in) && Carbon::parse($log->PunchTime)->lte($exitClose));
            $out = $outs->isNotEmpty() ? Carbon::parse($outs->last()->PunchTime) : null;
            $result['ActualPerson'] = $candidate['name']; $result['CheckIn'] = $in->format('h:i A'); $result['CheckOut'] = $out?->format('h:i A');
            $result['Status'] = $candidate['proxy'] ? 'Proxy' : ($out ? 'Present' : 'No Punch-out');
            $result['ActualMinutes'] = $out ? $in->diffInMinutes($out) : 0;
            $result['ShortMinutes'] = max(0, $result['ScheduledMinutes'] - $result['ActualMinutes']);
            $result['LateMinutes'] = $in->gt($start) ? $start->diffInMinutes($in) : null;
            $result['EarlyOutMinutes'] = $out && $out->lt($end) ? $out->diffInMinutes($end) : null;
            return $result;
        }
        return $result;
    }
}
