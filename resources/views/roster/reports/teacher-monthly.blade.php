@extends('layouts.master')

@section('content')
<div class="space-y-6">
    <div>
        <h1 class="text-2xl font-bold">Faculty Monthly Report</h1>
        <p class="text-sm text-slate-500">Review each faculty member’s planned classes, exams, attendance, proxy coverage, rescheduled classes, and makeup classes for a selected month. Holidays are excluded from the class totals.</p>
    </div>

    <form method="GET" class="rounded-xl border bg-white p-5">
        <div class="grid gap-4 md:grid-cols-[180px_1fr_auto]">
            <div>
                <label class="text-xs font-semibold">Month</label>
                <input required type="month" name="month" value="{{ $month }}" class="mt-1 w-full rounded border p-2">
            </div>
            <div>
                <label class="text-xs font-semibold">Faculty</label>
                <select name="RosterPersonID" class="mt-1 w-full rounded border p-2">
                    <option value="">All faculties</option>
                    @foreach($teachers as $teacher)
                        <option value="{{ $teacher->RosterPersonID }}" @selected((string) request('RosterPersonID') === (string) $teacher->RosterPersonID)>{{ $teacher->PersonName }}</option>
                    @endforeach
                </select>
            </div>
            <div class="self-end"><button class="rounded-lg bg-indigo-600 px-5 py-2 text-white">View monthly report</button></div>
        </div>
    </form>

    <div class="overflow-hidden rounded-xl border bg-white">
        <div class="border-b bg-slate-50 px-4 py-3 text-xs font-bold uppercase">Monthly faculty summary · {{ \Carbon\Carbon::parse($fromDate)->format('F Y') }}</div>
        <div class="overflow-x-auto"><table class="min-w-full text-sm"><thead class="bg-slate-100 text-left"><tr><th class="p-3">Faculty</th><th class="p-3">Regular classes</th><th class="p-3">Exams</th><th class="p-3">Attended</th><th class="p-3">Proxy</th><th class="p-3">Rescheduled</th><th class="p-3">Makeup</th><th class="p-3">Absent</th></tr></thead><tbody>
            @forelse($summary as $item)
                <tr class="border-t"><td class="p-3 font-medium">{{ $item['PersonName'] }}</td><td class="p-3">{{ $item['RegularClasses'] }}</td><td class="p-3 text-sky-700">{{ $item['ExamClasses'] }}</td><td class="p-3 text-green-700">{{ $item['Attended'] }}</td><td class="p-3 text-amber-700">{{ $item['Proxy'] }}</td><td class="p-3 text-indigo-700">{{ $item['RescheduledClasses'] }}</td><td class="p-3 text-violet-700">{{ $item['MakeupClasses'] }}</td><td class="p-3 text-red-600">{{ $item['Absent'] }}</td></tr>
            @empty
                <tr><td colspan="8" class="p-8 text-center text-slate-500">No class or exam duties are scheduled for the selected month.</td></tr>
            @endforelse
        </tbody></table></div>
    </div>

    <div class="overflow-hidden rounded-xl border bg-white">
        <div class="border-b bg-slate-50 px-4 py-3 text-xs font-bold uppercase">Class details</div>
        <div class="overflow-x-auto"><table class="min-w-full text-sm"><thead class="bg-slate-100 text-left"><tr><th class="p-3">Faculty</th><th class="p-3">Class</th><th class="p-3">Type</th><th class="p-3">Date &amp; time frame</th><th class="p-3">Room</th><th class="p-3">Attendance</th><th class="p-3">Proxy / punches</th></tr></thead><tbody>
            @forelse($rows as $row)
                <tr class="border-t align-top"><td class="p-3 font-medium">{{ $row['PersonName'] }}</td><td class="p-3">{{ $row['SubjectCode'] ? $row['SubjectCode'].' — ' : '' }}{{ $row['SubjectName'] ?? 'Class' }}<div class="text-xs text-slate-500">{{ $row['BatchName'] ?? '—' }}</div></td><td class="p-3">{{ $row['AssignmentType'] }}</td><td class="p-3">{{ \Carbon\Carbon::parse($row['RosterDate'])->format('d M Y') }}<div class="text-xs text-slate-500">{{ $row['Start'] }} – {{ $row['End'] }}</div></td><td class="p-3">{{ $row['LocationName'] ?? '—' }}</td><td class="p-3 font-medium">{{ $row['Status'] }}</td><td class="p-3">{{ $row['ActualPerson'] ?? '—' }}<div class="text-xs text-slate-500">In: {{ $row['CheckIn'] ?? '—' }} · Out: {{ $row['CheckOut'] ?? '—' }}</div></td></tr>
            @empty
                <tr><td colspan="7" class="p-8 text-center text-slate-500">No class details are available for the selected month.</td></tr>
            @endforelse
        </tbody></table></div>
    </div>
</div>
@endsection
