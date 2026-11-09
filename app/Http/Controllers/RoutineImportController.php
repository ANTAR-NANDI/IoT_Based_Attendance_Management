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
            'sessions' => DB::table('tblBatch')->where('Status', 1)->distinct()->orderBy('Session')->pluck('Session'),
        ]);
    }

    public function template()
    {
        $template = public_path('templates/routine-import-template.xlsx');
        $teachers = DB::table('tblRosterPerson')
            ->where('Status', 1)
            ->whereNotNull('EmployeeCode')
            ->where('EmployeeCode', '<>', '')
            ->orderBy('PersonName')
            ->orderBy('EmployeeCode')
            ->get(['PersonName', 'ShortName', 'EmployeeCode']);

        return response()->streamDownload(function () use ($template, $teachers) {
            $temporaryTemplate = tempnam(storage_path('app'), 'routine-template-');

            try {
                if ($temporaryTemplate === false || !copy($template, $temporaryTemplate)) {
                    throw new \RuntimeException('The Excel template could not be prepared.');
                }

                $this->refreshTeacherWorksheet($temporaryTemplate, $teachers->all());
                readfile($temporaryTemplate);
            } finally {
                if ($temporaryTemplate && file_exists($temporaryTemplate)) {
                    unlink($temporaryTemplate);
                }
            }
        }, 'routine-import-template.xlsx', [
            'Cache-Control' => 'no-store, no-cache, must-revalidate, max-age=0',
            'Pragma' => 'no-cache',
            'Expires' => '0',
        ]);
    }

    /** Refreshes the reference-only Teachers worksheet without changing routine rows. */
    private function refreshTeacherWorksheet(string $path, array $teachers): void
    {
        if (!class_exists(\ZipArchive::class)) {
            throw new \RuntimeException('Excel template downloads need the PHP ZIP extension.');
        }

        $zip = new \ZipArchive();
        if ($zip->open($path) !== true) {
            throw new \RuntimeException('The Excel template could not be opened.');
        }

        try {
            $lastRow = max(2, count($teachers) + 1);
            $zip->addFromString('xl/worksheets/sheet2.xml', $this->teacherWorksheetXml($teachers, $lastRow));

            $workbook = $zip->getFromName('xl/workbook.xml');
            $routineSheet = $zip->getFromName('xl/worksheets/sheet1.xml');
            if ($workbook === false || $routineSheet === false) {
                throw new \RuntimeException('The Excel template is missing a required worksheet.');
            }

            $workbook = preg_replace_callback(
                '/(<definedName name="Teacher(?:Names|ShortNames|Codes)">Teachers!\$[ABC]\$2:\$[ABC]\$)\d+(<\/definedName>)/',
                fn (array $match) => $match[1].$lastRow.$match[2],
                $workbook
            );
            $routineSheet = preg_replace_callback(
                '/Teachers!\$A\$2:\$C\$\d+/',
                fn () => 'Teachers!$A$2:$C$'.$lastRow,
                $routineSheet
            );

            $zip->addFromString('xl/workbook.xml', $workbook);
            $zip->addFromString('xl/worksheets/sheet1.xml', $routineSheet);
        } finally {
            $zip->close();
        }
    }

    private function teacherWorksheetXml(array $teachers, int $lastRow): string
    {
        $rows = [$this->teacherWorksheetRow(1, ['Teacher Name', 'Short Name', 'Teacher Code'], 1)];
        foreach ($teachers as $index => $teacher) {
            $rows[] = $this->teacherWorksheetRow($index + 2, [
                $teacher->PersonName,
                $teacher->ShortName,
                $teacher->EmployeeCode,
            ], 3);
        }

        return '<?xml version="1.0" encoding="UTF-8" standalone="yes"?>'
            .'<worksheet xmlns="http://schemas.openxmlformats.org/spreadsheetml/2006/main" xmlns:r="http://schemas.openxmlformats.org/officeDocument/2006/relationships" xmlns:mc="http://schemas.openxmlformats.org/markup-compatibility/2006" mc:Ignorable="x14ac" xmlns:x14ac="http://schemas.microsoft.com/office/spreadsheetml/2009/9/ac">'
            .'<dimension ref="A1:C'.$lastRow.'"/><sheetViews><sheetView workbookViewId="0"><pane ySplit="1" topLeftCell="A2" activePane="bottomLeft" state="frozen"/><selection pane="bottomLeft" activeCell="A2" sqref="A2"/></sheetView></sheetViews>'
            .'<sheetFormatPr defaultRowHeight="15" x14ac:dyDescent="0.25"/><cols><col min="1" max="1" width="34.7109375" customWidth="1"/><col min="2" max="3" width="16.7109375" customWidth="1"/></cols>'
            .'<sheetData>'.implode('', $rows).'</sheetData><pageMargins left="0.7" right="0.7" top="0.75" bottom="0.75" header="0.3" footer="0.3"/></worksheet>';
    }

    private function teacherWorksheetRow(int $rowNumber, array $values, int $style): string
    {
        $cells = '';
        foreach (['A', 'B', 'C'] as $index => $column) {
            $value = (string) ($values[$index] ?? '');
            $cells .= '<c r="'.$column.$rowNumber.'" s="'.$style.'" t="inlineStr"><is><t'
                .(preg_match('/^\s|\s$/u', $value) ? ' xml:space="preserve"' : '')
                .'>'.htmlspecialchars($value, ENT_XML1 | ENT_QUOTES, 'UTF-8').'</t></is></c>';
        }

        return '<row r="'.$rowNumber.'" spans="1:3" x14ac:dyDescent="0.25">'.$cells.'</row>';
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
            $batch = [];
            foreach ($routines as $routine) {
                $seriesId = (string) Str::uuid();
                foreach ($this->occurrences($input['StartDate'], $input['EndDate'], $routine['weekday']) as $date) {
                    $batch[] = [
                        'RosterSeriesID' => $seriesId, 'RosterDate' => $date, 'SeriesStartDate' => $input['StartDate'], 'SeriesEndDate' => $input['EndDate'],
                        'RepeatMode' => 'Weekly', 'Weekdays' => json_encode([$routine['weekday']]), 'RosterPersonID' => $routine['teacher']->RosterPersonID,
                        'ProxyPersonID' => null, 'RosterShiftID' => null, 'RosterLocationID' => $routine['room']->RosterLocationID, 'DeviceID' => $routine['room']->DeviceID,
                        'AssignmentType' => 'Class Duty', 'DepartmentID' => $input['DepartmentID'], 'BatchID' => $input['BatchID'], 'SubjectID' => $routine['subject']->SubjectID,
                        'StartTime' => $routine['start'], 'EndTime' => $routine['end'], 'CrossesMidnight' => false,
                        'EntryEarlyMinutes' => $settings->EntryEarlyMinutes, 'EntryLateMinutes' => $settings->EntryLateMinutes,
                        'ExitEarlyMinutes' => $settings->ExitEarlyMinutes, 'ExitLateMinutes' => $settings->ExitLateMinutes,
                        'Status' => 'Active', 'Remarks' => $routine['remarks'], 'created_at' => now(), 'updated_at' => now(),
                    ];

                    if (count($batch) === 500) {
                        DB::table('tblRosterAssignment')->insert($batch);
                        $batch = [];
                    }
                }
            }

            if ($batch) {
                DB::table('tblRosterAssignment')->insert($batch);
            }
        });

        return redirect()->route('roster.assignments.index', ['month' => Carbon::parse($input['StartDate'])->format('Y-m')])
            ->with('success', count($routines).' routine row(s) imported for '.$batch->BatchName.'.');
    }

    private function resolveRows(array $rows, int $departmentId, string $startDate, string $endDate): array
    {
        $required = ['day', 'in time', 'out time', 'subject code', 'teacher code', 'room number'];
        if (!$rows) throw new \RuntimeException('The Excel file has no data rows.');
        $headerRow = null;
        foreach ($rows as $index => $row) {
            $headers = array_map(fn ($value) => strtolower(trim((string) $value)), $row);
            if (!array_diff($required, $headers)) { $headerRow = $index; break; }
        }
        if ($headerRow === null) throw new \RuntimeException('Use columns: Day, In Time, Out Time, Subject Code, Teacher Code, and Room Number. Level, Term, Section, and Remarks are optional.');
        $headers = array_map(fn ($value) => strtolower(trim((string) $value)), $rows[$headerRow]);
        $rows = array_slice($rows, $headerRow + 1);

        $result = [];
        foreach ($rows as $index => $row) {
            if (!array_filter($row, fn ($value) => $value !== null && $value !== '')) continue;
            $line = $index + $headerRow + 2;
            $data = array_combine($headers, array_slice(array_pad($row, count($headers), ''), 0, count($headers)));
            $weekday = $this->weekday($data['day'] ?? '');
            $start = $this->time($data['in time'] ?? ''); $end = $this->time($data['out time'] ?? '');
            if ($weekday === null || !$start || !$end || $start >= $end) throw new \RuntimeException("Row {$line}: provide a valid day and start/end time.");
            $subjectCode = trim((string) ($data['subject code'] ?? '')); $teacherCode = trim((string) ($data['teacher code'] ?? '')); $roomNumber = trim((string) ($data['room number'] ?? ''));
            $normalizedSubjectCode = strtoupper(preg_replace('/\s+/', '', ltrim($subjectCode, '*')));

            $subjectQuery = DB::table('tblSubject')->where('DepartmentID', $departmentId);
            if (ctype_digit($normalizedSubjectCode)) {
                // Excel commonly converts 04211209 to 4211209.  Compare both
                // values numerically, without changing the stored subject code.
                $normalizedSubjectCode = ltrim($normalizedSubjectCode, '0') ?: '0';
                $subjectQuery->whereRaw(
                    "TRIM(LEADING '0' FROM REPLACE(UPPER(TRIM(Code)), ' ', '')) = ?",
                    [$normalizedSubjectCode]
                );
            } else {
                $subjectQuery->whereRaw("REPLACE(UPPER(TRIM(Code)), ' ', '') = ?", [$normalizedSubjectCode]);
            }
            $subject = $subjectQuery->first();
            $teachers = DB::table('tblRosterPerson')->where('Status', 1)->where('EmployeeCode', $teacherCode)->get();
            $room = DB::table('tblRosterLocation as l')
                ->leftJoin('tblDevice as d', function ($join) {
                    $join->on('l.DeviceID', '=', 'd.DeviceID')->where('d.Status', 1);
                })
                ->where('l.Status', 1)
                ->whereRaw("REPLACE(REPLACE(REPLACE(UPPER(l.LocationName), 'ROOM', ''), '-', ''), ' ', '') = ?", [strtoupper(str_replace([' ', '-'], '', $roomNumber))])
                ->select('l.RosterLocationID', 'd.DeviceID')
                ->first();
            if (!$subject) throw new \RuntimeException("Row {$line}: subject code '{$subjectCode}' was not found in the selected department.");
            if ($teachers->isEmpty()) throw new \RuntimeException("Row {$line}: teacher code '{$teacherCode}' was not found or is inactive.");
            if ($teachers->count() > 1) throw new \RuntimeException("Row {$line}: teacher code '{$teacherCode}' matches multiple active employees.");
            $teacher = $teachers->first();
            if (!$room) throw new \RuntimeException("Row {$line}: room '{$roomNumber}' was not found or is inactive.");
            $remarks = array_filter([
                trim((string) ($data['remarks'] ?? '')),
                filled($data['level'] ?? null) ? 'Level '.trim((string) $data['level']) : null,
                filled($data['term'] ?? null) ? 'Term '.trim((string) $data['term']) : null,
                filled($data['section'] ?? null) ? 'Section '.trim((string) $data['section']) : null,
            ]);
            $result[] = ['weekday' => $weekday, 'start' => $start, 'end' => $end, 'subject' => $subject, 'teacher' => $teacher, 'room' => $room, 'remarks' => $remarks ? implode(' | ', $remarks) : null];
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
        $zip = new \ZipArchive();
        if ($zip->open($path) !== true) throw new \RuntimeException('The uploaded Excel file could not be read.');

        $namespace = 'http://schemas.openxmlformats.org/spreadsheetml/2006/main';
        $shared = [];
        if ($xml = $zip->getFromName('xl/sharedStrings.xml')) {
            $sharedXml = simplexml_load_string($xml);
            if ($sharedXml !== false) {
                foreach ($sharedXml->children($namespace)->si ?? [] as $item) {
                    $shared[] = $this->xlsxText($item, $namespace);
                }
            }
        }

        $sheetXml = $zip->getFromName('xl/worksheets/sheet1.xml');
        $zip->close();
        if (!$sheetXml) throw new \RuntimeException('The Excel file must contain data on its first worksheet.');
        $sheet = simplexml_load_string($sheetXml);
        if ($sheet === false) throw new \RuntimeException('The first worksheet in the uploaded Excel file is invalid.');

        $sheetData = $sheet->children($namespace)->sheetData;
        $rows = [];
        foreach ($sheetData->row ?? [] as $sheetRow) {
            $row = [];
            foreach ($sheetRow->c ?? [] as $cell) {
                $attributes = $cell->attributes();
                $column = preg_replace('/\d+/', '', (string) $attributes['r']);
                $index = 0;
                foreach (str_split($column) as $letter) $index = $index * 26 + (ord($letter) - 64);

                $cellData = $cell->children($namespace);
                $type = (string) $attributes['t'];
                $rawValue = (string) $cellData->v;
                $row[$index - 1] = match ($type) {
                    's' => $shared[(int) $rawValue] ?? '',
                    'inlineStr' => isset($cellData->is) ? $this->xlsxText($cellData->is, $namespace) : '',
                    default => $rawValue,
                };
            }
            $rows[] = $row ? array_values(array_replace(array_fill(0, max(array_keys($row)) + 1, ''), $row)) : [];
        }
        return $rows;
    }

    private function xlsxText(\SimpleXMLElement $node, string $namespace): string
    {
        $node->registerXPathNamespace('xlsx', $namespace);
        return implode('', array_map('strval', $node->xpath('.//xlsx:t') ?: []));
    }
}
