@extends('layouts.master')

@section('content')
<div class="space-y-6">
    <div class="flex flex-col justify-between gap-4 sm:flex-row sm:items-start">
        <div>
            <h1 class="text-2xl font-bold text-slate-800">{{ $teacher->TeacherName }} - Attendance Detail</h1>
            <p class="text-sm text-slate-500">{{ $teacher->EmployeeID }} · {{ $teacher->DepartmentName ?? 'No department' }} · {{ $fromDate }} to {{ $toDate }}</p>
        </div>
        <a href="{{ route('reports.teacher-attendance', request()->only('from_date', 'to_date', 'search')) }}" class="rounded-lg bg-slate-700 px-4 py-2 text-sm font-medium text-white hover:bg-slate-800">← Teacher List</a>
    </div>

    <form method="GET" class="rounded-xl border border-slate-200 bg-white p-5 shadow-sm">
        <div class="flex flex-col gap-3 sm:flex-row">
            <input type="date" name="from_date" value="{{ $fromDate }}" class="rounded-lg border border-slate-300 px-4 py-2">
            <input type="date" name="to_date" value="{{ $toDate }}" class="rounded-lg border border-slate-300 px-4 py-2">
            <button class="rounded-lg bg-indigo-600 px-5 py-2 font-medium text-white hover:bg-indigo-700">Update Period</button>
        </div>
    </form>

    <div class="grid grid-cols-2 gap-4 md:grid-cols-4 xl:grid-cols-6">
        @foreach ([
            ['Scheduled days', $metrics['ScheduledDays'], 'text-slate-700'], ['Attended days', $metrics['AttendedDays'], 'text-teal-700'],
            ['Present classes', $metrics['Present'], 'text-teal-700'], ['Late entries', $metrics['Late'], 'text-amber-700'],
            ['Missed classes', $metrics['MissedClasses'], 'text-rose-700'], ['Proxy classes', $metrics['Proxy'], 'text-amber-700'],
            ['Incomplete punch', $metrics['Incomplete'], 'text-slate-700'], ['Left early', $metrics['LeftEarly'], 'text-rose-700'],
        ] as [$label, $value, $colour])
            <div class="rounded-xl border border-slate-200 bg-white p-4 shadow-sm">
                <p class="text-xs font-medium uppercase tracking-wide text-slate-500">{{ $label }}</p>
                <p class="mt-2 text-2xl font-bold {{ $colour }}">{{ $value }}</p>
            </div>
        @endforeach
    </div>

    <div class="overflow-hidden rounded-xl border border-slate-200 bg-white shadow-sm">
        <div class="border-b border-slate-200 bg-slate-100 px-4 py-3 text-xs font-bold uppercase text-slate-600">Class-by-class record</div>
        <div class="overflow-x-auto">
            <table class="min-w-full divide-y divide-slate-200 text-sm">
                <thead class="bg-slate-50 text-xs uppercase text-slate-600">
                    <tr>
                        <th class="px-4 py-3 text-left">Date / class</th>
                        <th class="px-4 py-3 text-left">Subject / batch</th>
                        <th class="px-4 py-3 text-left">Room</th>
                        <th class="px-4 py-3 text-left">Check-in / out</th>
                        <th class="px-4 py-3 text-center">Late</th>
                        <th class="px-4 py-3 text-center">Status</th>
                    </tr>
                </thead>
                <tbody class="divide-y divide-slate-200">
                    @forelse($report as $row)
                        <tr class="hover:bg-slate-50">
                            <td class="px-4 py-3"><div class="font-medium">{{ \Carbon\Carbon::parse($row['RoutineDate'])->format('d M Y') }}</div><div class="text-xs text-slate-500">{{ $row['StartTime'] }} - {{ $row['EndTime'] }}</div></td>
                            <td class="px-4 py-3"><div>{{ $row['SubjectName'] }}</div><div class="text-xs text-slate-500">{{ $row['BatchName'] }}</div></td>
                            <td class="px-4 py-3">{{ $row['RoomNo'] }}</td>
                            <td class="px-4 py-3">{{ $row['CheckIn'] ?? '—' }} - {{ $row['CheckOut'] ?? '—' }}</td>
                            <td class="px-4 py-3 text-center">{{ $row['LateByMinutes'] ? $row['LateByMinutes'].' min' : '—' }}</td>
                            <td class="px-4 py-3 text-center"><span class="rounded-full px-3 py-1 text-xs font-semibold {{ match($row['Status']) { 'Present' => 'bg-green-100 text-green-700', 'Proxy' => 'bg-amber-100 text-amber-700', 'Incomplete Punch' => 'bg-slate-200 text-slate-700', default => 'bg-red-100 text-red-700' } }}">{{ $row['Status'] }}</span></td>
                        </tr>
                    @empty
                        <tr><td colspan="6" class="px-4 py-10 text-center text-slate-500">No classes scheduled for this period.</td></tr>
                    @endforelse
                </tbody>
            </table>
        </div>
    </div>
</div>
@endsection
