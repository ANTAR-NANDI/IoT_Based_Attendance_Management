<!doctype html>
<html>
<head><meta charset="utf-8"><style>
body { font-family: DejaVu Sans, sans-serif; font-size: 9px; color: #172033; }
h1 { margin: 0 0 4px; font-size: 18px; } h3 { margin: 16px 0 5px; } p { margin: 0 0 14px; color: #475569; }
table { width: 100%; border-collapse: collapse; margin: 10px 0 18px; } th, td { border: 1px solid #94a3b8; padding: 5px; vertical-align: top; } th { background: #e2e8f0; text-align: left; } .small { font-size: 8px; color: #475569; }
</style></head>
<body>
<h1>Army University - Roster Attendance Report</h1>
<p>Period: {{ \Carbon\Carbon::parse($fromDate)->format('d M Y') }} to {{ \Carbon\Carbon::parse($toDate)->format('d M Y') }} | Role: {{ $role ?: 'All roles' }}</p>

<h3>Employee Summary</h3>
<table><thead><tr><th>Person / Role</th><th>Duties</th><th>Present</th><th>Proxy</th><th>Late</th><th>Early Out</th><th>No Out</th><th>Absent</th><th>Scheduled</th><th>Actual</th><th>Short</th></tr></thead><tbody>
@forelse($summary as $item)
<tr><td><strong>{{ $item['PersonName'] }}</strong><br><span class="small">{{ $item['RoleName'] }}</span></td><td>{{ $item['Scheduled'] }}</td><td>{{ $item['Present'] }}</td><td>{{ $item['Proxy'] }}</td><td>{{ $item['Late'] }}</td><td>{{ $item['EarlyOut'] }}</td><td>{{ $item['NoPunchOut'] }}</td><td>{{ $item['Absent'] }}</td><td>{{ number_format((float) $item['ScheduledMinutes'], 2) }} min</td><td>{{ number_format((float) $item['ActualMinutes'], 2) }} min</td><td>{{ number_format((float) $item['ShortMinutes'], 2) }} min</td></tr>
@empty
<tr><td colspan="11">No duties found.</td></tr>
@endforelse
</tbody></table>

<h3>Duty Details</h3>
<table><thead><tr><th>Date</th><th>Scheduled</th><th>Duty / Class</th><th>Room</th><th>Time</th><th>Actual / Proxy</th><th>Actual In / Out</th><th>Status</th><th>Short</th></tr></thead><tbody>
@forelse($rows as $row)
<tr>
<td>{{ \Carbon\Carbon::parse($row['RosterDate'])->format('d M Y') }}</td>
<td><strong>{{ $row['PersonName'] }}</strong><br><span class="small">{{ $row['RoleName'] }}</span></td>
<td>{{ $row['AssignmentType'] }}
@if(!empty($row['SubjectName']))
<br><span class="small">{{ $row['SubjectCode'] }} - {{ $row['SubjectName'] }}</span>
@endif
</td>
<td>{{ $row['LocationName'] ?? '-' }}</td>
<td>{{ $row['Start'] }} - {{ $row['End'] }}</td>
<td>
@if($row['ActualPerson'])
@if($row['Status'] === 'Proxy') Proxy teacher: {{ $row['ActualPerson'] }} @else Actual teacher: {{ $row['ActualPerson'] }} @endif
@else -
@endif
</td>
<td>{{ $row['CheckIn'] ?? '-' }} - {{ $row['CheckOut'] ?? '-' }}</td>
<td>{{ $row['Status'] }}
@if($row['LateMinutes'] !== null)
<br><span class="small">Late {{ $row['LateMinutes'] }} min</span>
@endif
@if($row['EarlyOutMinutes'] !== null)
<br><span class="small">Early out {{ ($row['EarlyOutSeconds'] ?? round((float) $row['EarlyOutMinutes'] * 60)) < 60 ? ($row['EarlyOutSeconds'] ?? round((float) $row['EarlyOutMinutes'] * 60)).' sec' : number_format((float) $row['EarlyOutMinutes'], 2).' min' }}</span>
@endif
</td>
<td>{{ number_format((float) $row['ShortMinutes'], 2) }} min</td>
</tr>
@empty
<tr><td colspan="9">No duties found.</td></tr>
@endforelse
</tbody></table>
<p class="small">Generated: {{ now()->format('d M Y h:i A') }}</p>
</body></html>
