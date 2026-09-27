<!doctype html>
<html>
<head>
    <meta charset="utf-8">
    <style>
        body { font-family: DejaVu Sans, sans-serif; color: #172033; font-size: 8px; }
        h1 { font-size: 16px; margin: 0 0 4px; }
        p { color: #475569; margin: 0 0 12px; }
        table { border-collapse: collapse; width: 100%; table-layout: fixed; }
        th, td { border: 1px solid #64748b; padding: 5px; vertical-align: top; }
        th { background: #173b63; color: #fff; text-align: left; }
        .time { width: 15%; background: #f1f5f9; font-weight: bold; }
        .empty { background: #e2e8f0; color: #475569; text-align: center; vertical-align: middle; }
        .present { background: #dbeafe; } .proxy { background: #fef3c7; } .absent { background: #fee2e2; }
        .small { font-size: 7px; } .status { font-weight: bold; margin-top: 5px; }
    </style>
</head>
<body>
    <h1>Army University - {{ $title }}</h1>
    <p>{{ $subtitle }}</p>
    <table>
        <thead><tr><th class="time">Time slot</th>@foreach($selectedLocations as $location)<th>{{ $location->LocationName }}</th>@endforeach</tr></thead>
        <tbody>
            @forelse($matrix as $slot)
                <tr>
                    <td class="time">{{ $slot['Start'] }} - {{ $slot['End'] }}</td>
                    @foreach($selectedLocations as $location)
                        @php($row = $slot['rooms'][$location->RosterLocationID] ?? null)
                        @if(!$row)
                            <td class="empty">Not scheduled</td>
                        @else
                            @php($color = $row['Status'] === 'Present' ? 'present' : ($row['Status'] === 'Proxy' ? 'proxy' : ($row['Status'] === 'Absent' ? 'absent' : '')))
                            <td class="{{ $color }}">
                                <strong>{{ $row['PersonName'] }}</strong><br>
                                <span class="small">{{ $row['SubjectName'] ? $row['SubjectCode'].' - '.$row['SubjectName'] : $row['AssignmentType'] }}</span><br>
                                <span class="small">{{ $row['BatchName'] ? $row['BatchName'].($row['AcademicSemester'] ? ', Sem '.$row['AcademicSemester'] : '') : '' }}</span>
                                <div class="status">{{ $row['Status'] }}{{ (float) $row['ShortMinutes'] >= 5 ? ' · '.number_format((float) $row['ShortMinutes'], 2).' min short' : '' }}</div>
                                <span class="small">In: {{ $row['CheckIn'] ?? '-' }} · Out: {{ $row['CheckOut'] ?? '-' }}</span>
                                @if($row['EarlyOutMinutes'] !== null)<br><span class="small">Early out: {{ ($row['EarlyOutSeconds'] ?? round((float) $row['EarlyOutMinutes'] * 60)) < 60 ? ($row['EarlyOutSeconds'] ?? round((float) $row['EarlyOutMinutes'] * 60)).' sec' : number_format((float) $row['EarlyOutMinutes'], 2).' min' }}</span>@endif
                                @if($row['Status'] === 'Proxy' && $row['ActualPerson'])<br><span class="small">Proxy: {{ $row['ActualPerson'] }}</span>@endif
                            </td>
                        @endif
                    @endforeach
                </tr>
            @empty
                <tr><td colspan="{{ $selectedLocations->count() + 1 }}">No classes or duties scheduled.</td></tr>
            @endforelse
        </tbody>
    </table>
    <p class="small" style="margin-top:14px">Generated: {{ now()->format('d M Y h:i A') }}</p>
</body>
</html>
