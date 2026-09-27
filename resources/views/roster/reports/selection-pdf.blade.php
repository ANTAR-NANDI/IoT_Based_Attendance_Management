<!doctype html>
<html>
<head><meta charset="utf-8"><style>
body { font-family: DejaVu Sans, sans-serif; font-size: 9px; color: #172033; }
h1 { font-size: 18px; margin: 0 0 4px; } p { color: #475569; margin: 0 0 14px; }
table { width: 100%; border-collapse: collapse; } th, td { border: 1px solid #94a3b8; padding: 6px; vertical-align: top; } th { background: #e2e8f0; text-align: left; } .small { font-size: 8px; color: #475569; }
</style></head>
<body>
<h1>Army University - {{ $title }}</h1>
<p>{{ $subtitle }}</p>
<table><thead><tr><th>Schedule</th><th>Attendance</th></tr></thead><tbody>
@forelse($rows as $row)
<tr>
<td><strong>{{ $row['Start'] }} - {{ $row['End'] }}</strong><br><strong>{{ $mode === 'room' ? $row['PersonName'] : ($row['SubjectName'] ? $row['SubjectCode'].' - '.$row['SubjectName'] : $row['AssignmentType']) }}</strong><br><span class="small">{{ $mode === 'room' ? ($row['SubjectName'] ? $row['SubjectCode'].' - '.$row['SubjectName'] : $row['AssignmentType']) : 'Room: '.($row['LocationName'] ?? '-') }}</span></td>
<td><strong>{{ $row['Status'] }}{{ (float) $row['ShortMinutes'] >= 5 ? ' - '.number_format((float) $row['ShortMinutes'], 2).' min short' : '' }}</strong><br>{{ $row['CheckIn'] ?? '-' }} - {{ $row['CheckOut'] ?? '-' }}<br><span class="small">{{ $row['Status'] === 'Proxy' && $row['ActualPerson'] ? 'Proxy: '.$row['ActualPerson'] : '' }} {{ (float) ($row['LateMinutes'] ?? 0) >= 5 ? 'Late: '.number_format((float) $row['LateMinutes'], 2).' min' : '' }} {{ $row['EarlyOutMinutes'] !== null ? 'Early out: '.(($row['EarlyOutSeconds'] ?? round((float) $row['EarlyOutMinutes'] * 60)) < 60 ? ($row['EarlyOutSeconds'] ?? round((float) $row['EarlyOutMinutes'] * 60)).' sec' : number_format((float) $row['EarlyOutMinutes'], 2).' min') : '' }}</span></td>
</tr>
@empty
<tr><td colspan="2">No duties found.</td></tr>
@endforelse
</tbody></table>
<p class="small" style="margin-top:16px">Generated: {{ now()->format('d M Y h:i A') }}</p>
</body></html>
