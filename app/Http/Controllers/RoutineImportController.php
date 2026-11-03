<?php

namespace App\Http\Controllers;

use Carbon\Carbon;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Str;
use Illuminate\Validation\Rule;

class RoutineImportController extends Controller
{
    public function create()
    {
        return view('roster.assignments.import', [
            'departments' => DB::table('tblDepartment')->orderBy('DepartmentName')->get(),
            'batches' => DB::table('tblBatch')->where('Status', 1)->orderBy('Session')->orderBy('BatchName')->get(),
        ]);
    }

    public function template()
    {
        return response()->download(public_path('templates/routine-import-template.xlsx'), 'routine-import-template.xlsx');
    }

    public function store(Request $request)
    {
        $input = $request->validate([
            'DepartmentID' => ['required', 'exists:tblDepartment,DepartmentID'],
            'BatchID' => ['required', 'exists:tblBatch,BatchID'],
            'StartDate' => ['required', 'date'],
            'EndDate' => ['required', 'date', 'after_or_equal:StartDate'],
            'routine_file' => ['required', 'file', 'mimes:xlsx,csv', 'max:5120'],
        ]);
        $batch = DB::table('tblBatch')->where('BatchID', $input['BatchID'])->first();
        if ((int) $batch->DepartmentID !== (int) $input['DepartmentID']) {
            return back()->withInput()->withErrors(['BatchID' => 'Select a batch that belongs to the selected department.']);
        }

        try {
            $rows = $this->readRows($request->file('routine_file')->getPathname(), $request->file('routine_file')->getClientOriginalExtension());
            $routines = $this->resolveRows($rows, (int) $input['DepartmentID'], $input['StartDate'], $input['EndDate']);
        } catch (\RuntimeException $exception) {
            return back()->withInput()->withErrors(['routine_file' => $exception->getMessage()]);
        }

        $settings = DB::table('tblRosterSetting')->where('id', 1)->firstOrFail();
        DB::transaction(function () use ($routines, $input, $settings) {
            foreach ($routines as $routine) {
                $seriesId = (string) Str::uuid();
                foreach ($this->occurrences($input['StartDate'], $input['EndDate'], $routine['weekday']) as $date) {
                    DB::table('tblRosterAssignment')->insert([
                        'RosterSeriesID' => $seriesId, 'RosterDate' => $date, 'SeriesStartDate' => $input['StartDate'], 'SeriesEndDate' => $input['EndDate'],
                        'RepeatMode' => 'Weekly', 'Weekdays' => json_encode([$routine['weekday']]), 'RosterPersonID' => $routine['teacher']->RosterPersonID,
                        'ProxyPersonID' => null, 'RosterShiftID' => null, 'RosterLocationID' => $routine['room']->RosterLocationID, 'DeviceID' => $routine['room']->DeviceID,
                        'AssignmentType' => 'Class Duty', 'DepartmentID' => $input['DepartmentID'], 'BatchID' => $input['BatchID'], 'SubjectID' => $routine['subject']->SubjectID,
                        'StartTime' => $routine['start'], 'EndTime' => $routine['end'], 'CrossesMidnight' => false,
                        'EntryEarlyMinutes' => $settings->EntryEarlyMinutes, 'EntryLateMinutes' => $settings->EntryLateMinutes,
                        'ExitEarlyMinutes' => $settings->ExitEarlyMinutes, 'ExitLateMinutes' => $settings->ExitLateMinutes,
                        'Status' => 'Active', 'Remarks' => $routine['remarks'], 'created_at' => now(), 'updated_at' => now(),
                    ]);
                }
            }
        });

        return redirect()->route('roster.assignments.index', ['month' => Carbon::parse($input['StartDate'])->format('Y-m')])
            ->with('success', count($routines).' routine row(s) imported for '.$batch->BatchName.'.');
    }

    private function resolveRows(array $rows, int $departmentId, string $startDate, string $endDate): array
    {
        $required = ['day', 'in time', 'out time', 'subject code', 'teacher code', 'room number', 'remarks'];
        if (!$rows) throw new \RuntimeException('The Excel file has no data rows.');
        $headerRow = null;
        foreach ($rows as $index => $row) {
            if (array_map(fn ($value) => strtolower(trim((string) $value)), $row) === $required) { $headerRow = $index; break; }
        }
        if ($headerRow === null) throw new \RuntimeException('Use the downloaded template. Its columns must be: Day, In Time, Out Time, Subject Code, Teacher Code, Room Number, Remarks.');
        $headers = $required;
        $rows = array_slice($rows, $headerRow + 1);

        $result = [];
        foreach ($rows as $index => $row) {
            if (!array_filter($row, fn ($value) => $value !== null && $value !== '')) continue;
            $line = $index + $headerRow + 2;
            $data = array_combine($headers, array_pad($row, count($headers), ''));
            $weekday = $this->weekday($data['day'] ?? '');
            $start = $this->time($data['in time'] ?? ''); $end = $this->time($data['out time'] ?? '');
            if ($weekday === null || !$start || !$end || $start >= $end) throw new \RuntimeException("Row {$line}: provide a valid day and start/end time.");
            $subjectCode = trim((string) ($data['subject code'] ?? '')); $teacherCode = trim((string) ($data['teacher code'] ?? '')); $roomNumber = trim((string) ($data['room number'] ?? ''));
            $subject = DB::table('tblSubject')->where('DepartmentID', $departmentId)->whereRaw('UPPER(TRIM(Code)) = ?', [strtoupper($subjectCode)])->first();
            $teacher = DB::table('tblRosterPerson')->where('Status', 1)->where(fn ($query) => $query->where('EmployeeCode', $teacherCode)->orWhere('ZKUserID', $teacherCode)->orWhere('ShortName', $teacherCode))->first();
            $room = DB::table('tblRosterLocation as l')->join('tblDevice as d', 'l.DeviceID', '=', 'd.DeviceID')->where('l.Status', 1)->where('d.Status', 1)->whereRaw("REPLACE(REPLACE(UPPER(l.LocationName), 'ROOM', ''), '-', '') = ?", [strtoupper(str_replace([' ', '-'], '', $roomNumber))])->select('l.RosterLocationID', 'l.DeviceID')->first();
            if (!$subject) throw new \RuntimeException("Row {$line}: subject code '{$subjectCode}' was not found in the selected department.");
            if (!$teacher) throw new \RuntimeException("Row {$line}: teacher code '{$teacherCode}' was not found or is inactive.");
            if (!$room) throw new \RuntimeException("Row {$line}: room '{$roomNumber}' has no active linked device.");
            $result[] = ['weekday' => $weekday, 'start' => $start, 'end' => $end, 'subject' => $subject, 'teacher' => $teacher, 'room' => $room, 'remarks' => trim((string) ($data['remarks'] ?? '')) ?: null];
        }
        return $result;
    }

    private function occurrences(string $startDate, string $endDate, int $weekday): array
    {
        $start = Carbon::parse($startDate)->startOfDay(); $end = Carbon::parse($endDate)->endOfDay();
        $dates = []; for ($date = $start; $date->lte($end); $date->addDay()) if ($date->dayOfWeek === $weekday) $dates[] = $date->toDateString();
        return $dates;
    }

    private function weekday(string $value): ?int
    {
        return ['sun' => 0, 'sunday' => 0, 'mon' => 1, 'monday' => 1, 'tue' => 2, 'tuesday' => 2, 'wed' => 3, 'wednesday' => 3, 'thu' => 4, 'thursday' => 4, 'fri' => 5, 'friday' => 5, 'sat' => 6, 'saturday' => 6][strtolower(trim($value))] ?? null;
    }

    private function time(mixed $value): ?string
    {
        if (is_numeric($value) && (float) $value >= 0 && (float) $value < 1) return Carbon::createFromTimestamp((int) round((float) $value * 86400), 'UTC')->format('H:i');
        try { return Carbon::parse(trim((string) $value))->format('H:i'); } catch (\Throwable) { return null; }
    }

    private function readRows(string $path, string $extension): array
    {
        if (strtolower($extension) === 'csv') return array_map('str_getcsv', file($path, FILE_IGNORE_NEW_LINES));
        if (!class_exists(\ZipArchive::class)) throw new \RuntimeException('Excel imports need the PHP ZIP extension. Upload a CSV file instead.');
        $zip = new \ZipArchive(); if ($zip->open($path) !== true) throw new \RuntimeException('The uploaded Excel file could not be read.');
        $shared = []; if ($xml = $zip->getFromName('xl/sharedStrings.xml')) foreach (simplexml_load_string($xml)->si as $item) $shared[] = (string) $item->t ?: (string) $item->r->t;
        $sheetXml = $zip->getFromName('xl/worksheets/sheet1.xml'); $zip->close(); if (!$sheetXml) throw new \RuntimeException('The Excel file must contain data on its first worksheet.');
        $rows = []; foreach (simplexml_load_string($sheetXml)->sheetData->row as $sheetRow) { $row = []; foreach ($sheetRow->c as $cell) { $column = preg_replace('/\d+/', '', (string) $cell['r']); $index = 0; foreach (str_split($column) as $letter) $index = $index * 26 + (ord($letter) - 64); $value = (string) $cell->v; $row[$index - 1] = (string) $cell['t'] === 's' ? ($shared[(int) $value] ?? '') : $value; } $rows[] = $row ? array_values(array_replace(array_fill(0, max(array_keys($row)) + 1, ''), $row)) : []; }
        return $rows;
    }
}
