<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <style>
        body { font-family: sans-serif; color: #1e293b; font-size: 9px; }
        h1 { font-size: 18px; margin: 0 0 4px; }
        .subtitle { color: #64748b; margin-bottom: 16px; }
        table { width: 100%; border-collapse: collapse; }
        th, td { border: 1px solid #cbd5e1; padding: 6px; text-align: left; vertical-align: top; }
        th { background: #f1f5f9; font-size: 8px; text-transform: uppercase; }
        .muted { color: #64748b; font-size: 8px; }
        .center { text-align: center; }
    </style>
</head>
<body>
    <h1>Class Routine</h1>
    <div class="subtitle">Generated {{ now()->format('d M Y, h:i A') }} | {{ $routines->count() }} routine(s)</div>
    <table>
        <thead>
            <tr>
                <th>#</th><th>Day / Semester dates</th><th>Time</th><th>Teacher</th><th>Subject</th><th>Batch</th><th>Room / Device</th><th>Status</th>
            </tr>
        </thead>
        <tbody>
            @forelse($routines as $routine)
                <tr>
                    <td class="center">{{ $loop->iteration }}</td>
                    <td>{{ $routine->DayName }}<div class="muted">{{ \Carbon\Carbon::parse($routine->SemesterStartDate ?? $routine->RoutineDate)->format('d M Y') }} – {{ \Carbon\Carbon::parse($routine->SemesterEndDate ?? $routine->RoutineDate)->format('d M Y') }}</div></td>
                    <td>{{ \Carbon\Carbon::parse($routine->StartTime)->format('h:i A') }} - {{ \Carbon\Carbon::parse($routine->EndTime)->format('h:i A') }}<div class="muted">{{ $routine->ClassType ?: 'Class' }}</div></td>
                    <td>{{ $routine->TeacherName }}</td>
                    <td>{{ $routine->SubjectName }}</td>
                    <td>{{ $routine->BatchName }}</td>
                    <td>{{ $routine->RoomNo }}<div class="muted">{{ $routine->DeviceName }}</div></td>
                    <td>{{ $routine->Status ? 'Active' : 'Inactive' }}</td>
                </tr>
            @empty
                <tr><td colspan="8" class="center">No routines found.</td></tr>
            @endforelse
        </tbody>
    </table>
</body>
</html>
