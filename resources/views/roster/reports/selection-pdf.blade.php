<!doctype html>
<html><head><meta charset="utf-8"><style>
body { font-family: DejaVu Sans, sans-serif; font-size: 10px; color: #172033; } h1 { font-size: 18px; margin: 0 0 4px; } p { color: #475569; margin: 0 0 14px; } table { width: 100%; border-collapse: collapse; } th, td { border: 1px solid #94a3b8; padding: 6px; vertical-align: top; } th { background: #e2e8f0; text-align: left; } .small { font-size: 8px; color: #475569; }
</style></head><body>
<h1>Army University - {{ $title }}</h1><p>{{ $subtitle }}</p>
<table><thead><tr><th>Scheduled teacher</th><th>Class / duty</th><th>Room</th><th>Scheduled time</th><th>Actual / proxy teacher</th><th>Actual in / out</th><th>Status</th><th>Short time</th></tr></thead><tbody>
@forelse($rows as $row)
<tr><td><strong>{{ $row['PersonName'] }}</strong><br><span class="small">{{ $row['RoleName'] }}</span></td><td>{{ $row['AssignmentType'] }}@if(!empty($row['SubjectName']))<br><span class="small">{{ $row['SubjectCode'] }} - {{ $row['SubjectName'] }}</span>@endif</td><td>{{ $row['LocationName'] ?? '-' }}</td><td>{{ $row['Start'] }} - {{ $row['End'] }}</td><td>@if($row['ActualPerson'])@if($row['Status'] === 'Proxy') Proxy teacher: {{ $row['ActualPerson'] }} @else Actual teacher: {{ $row['ActualPerson'] }} @endif @else - @endif</td><td>{{ $row['CheckIn'] ?? '-' }} - {{ $row['CheckOut'] ?? '-' }}</td><td>{{ $row['Status'] }}@if($row['LateMinutes'] !== null)<br><span class="small">Late {{ $row['LateMinutes'] }} min</span>@endif@if($row['EarlyOutMinutes'] !== null)<br><span class="small">Early out {{ $row['EarlyOutMinutes'] }} min</span>@endif</td><td>{{ $row['ShortMinutes'] }} min</td></tr>
@empty
<tr><td colspan="8">No duties found.</td></tr>
@endforelse
</tbody></table><p class="small" style="margin-top:16px">Generated: {{ now()->format('d M Y h:i A') }}</p>
</body></html>
