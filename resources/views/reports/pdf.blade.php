<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <style>
        body { font-family: sans-serif; font-size: 10px; color: #1e293b; }
        h1 { font-size: 16px; margin-bottom: 2px; }
        .subtitle { font-size: 10px; color: #64748b; margin-bottom: 16px; }

        table { width: 100%; border-collapse: collapse; margin-bottom: 24px; }
        th, td { border: 1px solid #cbd5e1; padding: 5px 7px; text-align: left; }
        th { background-color: #f1f5f9; font-weight: bold; text-transform: uppercase; font-size: 8px; }

        .text-center { text-align: center; }
        .text-right { text-align: right; }
        .muted { color: #94a3b8; font-size: 8px; }

        .badge { padding: 2px 6px; border-radius: 8px; font-size: 8px; font-weight: bold; }
        .badge-present { background-color: #dcfce7; color: #15803d; }
        .badge-proxy { background-color: #fef3c7; color: #b45309; }
        .badge-incomplete { background-color: #e2e8f0; color: #475569; }
        .badge-absent { background-color: #fee2e2; color: #b91c1c; }

        .section-title { font-size: 11px; font-weight: bold; text-transform: uppercase; color: #475569; margin-bottom: 6px; }
    </style>
</head>
<body>

    <h1>Class Attendance Report</h1>
    <div class="subtitle">
        {{ \Carbon\Carbon::parse($fromDate)->format('d M Y') }}
        &ndash;
        {{ \Carbon\Carbon::parse($toDate)->format('d M Y') }}
        &nbsp;|&nbsp; Generated {{ now()->format('d M Y, h:i A') }}
    </div>

    <div class="section-title">Teacher Summary</div>
    <table>
        <thead>
            <tr>
                <th>Teacher</th>
                <th class="text-center">Classes</th>
                <th class="text-center">Present</th>
                <th class="text-center">Proxy</th>
                <th class="text-center">Absent</th>
                <th class="text-right">Scheduled (min)</th>
                <th class="text-right">Actual (min)</th>
            </tr>
        </thead>
        <tbody>
            @forelse($summary as $row)
                <tr>
                    <td>{{ $row['TeacherName'] }}</td>
                    <td class="text-center">{{ $row['TotalClasses'] }}</td>
                    <td class="text-center">{{ $row['Present'] }}</td>
                    <td class="text-center">{{ $row['Proxy'] }}</td>
                    <td class="text-center">{{ $row['Absent'] }}</td>
                    <td class="text-right">{{ $row['ScheduledMinutes'] }}</td>
                    <td class="text-right">{{ $row['ActualMinutes'] ?? '-' }}</td>
                </tr>
            @empty
                <tr><td colspan="7" class="text-center">No data for this range</td></tr>
            @endforelse
        </tbody>
    </table>

    <div class="section-title">Class Detail</div>
    <table>
        <thead>
            <tr>
                <th>Date / Day</th>
                <th>Subject / Batch</th>
                <th>Room</th>
                <th>Assigned</th>
                <th>Actual</th>
                <th>Scheduled In / Out</th>
                <th>Actual In / Out</th>
                <th class="text-center">Status</th>
            </tr>
        </thead>
        <tbody>
            @forelse($report as $row)
                <tr>
                    <td>
                        {{ \Carbon\Carbon::parse($row['RoutineDate'])->format('d M Y') }}
                        <div class="muted">{{ $row['DayName'] }}</div>
                    </td>
                    <td>
                        {{ $row['SubjectName'] }}
                        <div class="muted">{{ $row['BatchName'] }}</div>
                    </td>
                    <td>{{ $row['RoomNo'] }}</td>
                    <td>{{ $row['AssignedTeacher'] }}</td>
                    <td>{{ $row['ActualTeacher'] ?? '-' }}</td>
                    <td>
                        {{ \Carbon\Carbon::parse($row['StartTime'])->format('h:i A') }}
                        &ndash;
                        {{ \Carbon\Carbon::parse($row['EndTime'])->format('h:i A') }}
                        <div class="muted">{{ $row['ScheduledMinutes'] }} min</div>
                    </td>
                    <td>
                        @if($row['CheckIn'])
                            {{ $row['CheckIn'] }} &ndash; {{ $row['CheckOut'] ?? 'no punch-out' }}
                            @if($row['ActualMinutes'])
                                <div class="muted">{{ $row['ActualMinutes'] }} min</div>
                            @endif
                        @else
                            -
                        @endif
                        @if($row['LateByMinutes'])
                            <div style="color:#b91c1c;">Late {{ $row['LateByMinutes'] }}m</div>
                        @endif
                        @if($row['LeftEarlyByMinutes'])
                            <div style="color:#b91c1c;">Left early {{ $row['LeftEarlyByMinutes'] }}m</div>
                        @endif
                    </td>
                    <td class="text-center">
                        @php
                            $badgeClass = match($row['Status']) {
                                'Present' => 'badge-present',
                                'Proxy' => 'badge-proxy',
                                'Incomplete Punch' => 'badge-incomplete',
                                default => 'badge-absent',
                            };
                        @endphp
                        <span class="badge {{ $badgeClass }}">{{ $row['Status'] }}</span>
                    </td>
                </tr>
            @empty
                <tr><td colspan="8" class="text-center">No classes scheduled in this range</td></tr>
            @endforelse
        </tbody>
    </table>

</body>
</html>