@extends('layouts.master')

@section('title', 'My Attendance | ZKT Attendance System')

@section('content')
<div class="space-y-6">
    <section class="overflow-hidden rounded-2xl bg-gradient-to-r from-slate-900 via-blue-900 to-indigo-800 px-6 py-7 text-white shadow-lg">
        <div class="flex flex-col justify-between gap-5 lg:flex-row lg:items-center">
            <div>
                <p class="text-xs font-bold uppercase tracking-[0.18em] text-blue-200">Faculty portal</p>
                <h1 class="mt-2 text-3xl font-bold">Welcome back, {{ $person->PersonName }}</h1>
                <p class="mt-2 text-sm text-blue-100">{{ $person->RoleName }}@if($person->SelectedDepartment) · {{ $person->SelectedDepartment }}@endif</p>
                <p class="mt-4 max-w-2xl text-sm text-blue-100">Review your scheduled duties, biometric attendance, holidays, and personal attendance report in one place.</p>
            </div>
            <div class="rounded-xl border border-white/20 bg-white/10 px-5 py-4 text-center backdrop-blur-sm">
                <p class="text-xs font-semibold uppercase tracking-wide text-blue-200">Attendance score</p>
                <p class="mt-1 text-4xl font-bold">{{ number_format($attendanceRate, 1) }}%</p>
                <p class="mt-1 text-xs text-blue-100">for the selected period</p>
            </div>
        </div>
    </section>

    <form class="grid gap-4 rounded-2xl border border-slate-200 bg-white p-5 shadow-sm md:grid-cols-[1fr_1fr_9rem_auto_auto]" method="GET">
        <div><label class="text-xs font-bold uppercase tracking-wide text-slate-600">From date</label><input type="date" name="from_date" value="{{ $fromDate }}" class="mt-1 w-full rounded-lg border border-slate-300 p-2.5"></div>
        <div><label class="text-xs font-bold uppercase tracking-wide text-slate-600">To date</label><input type="date" name="to_date" value="{{ $toDate }}" class="mt-1 w-full rounded-lg border border-slate-300 p-2.5"></div>
        <div><label class="text-xs font-bold uppercase tracking-wide text-slate-600">Rows per page</label><select name="per_page" class="mt-1 w-full rounded-lg border border-slate-300 p-2.5 text-sm">@foreach([25, 50, 100] as $size)<option value="{{ $size }}" @selected($perPage === $size)>{{ $size }}</option>@endforeach</select></div>
        <div class="self-end"><button class="w-full rounded-lg bg-indigo-600 px-5 py-2.5 font-semibold text-white shadow-sm hover:bg-indigo-700">View attendance</button></div>
        <div class="self-end"><a href="{{ route('employee.attendance.pdf', request()->only('from_date', 'to_date')) }}" class="block w-full rounded-lg border border-indigo-200 bg-indigo-50 px-5 py-2.5 text-center font-semibold text-indigo-700 hover:bg-indigo-100">Download PDF</a></div>
    </form>

    <section class="grid gap-4 sm:grid-cols-2 xl:grid-cols-5">
        <div class="rounded-2xl border border-slate-200 bg-white p-5 shadow-sm"><p class="text-xs font-bold uppercase tracking-wide text-slate-500">Scheduled duties</p><p class="mt-2 text-3xl font-bold text-slate-800">{{ $summary['Scheduled'] }}</p><p class="mt-2 text-xs text-slate-500">Excludes holidays</p></div>
        <div class="rounded-2xl border border-emerald-100 bg-emerald-50 p-5 shadow-sm"><p class="text-xs font-bold uppercase tracking-wide text-emerald-700">Present</p><p class="mt-2 text-3xl font-bold text-emerald-700">{{ $summary['Present'] }}</p><p class="mt-2 text-xs text-emerald-700/80">Biometric attendance</p></div>
        <div class="rounded-2xl border border-rose-100 bg-rose-50 p-5 shadow-sm"><p class="text-xs font-bold uppercase tracking-wide text-rose-700">Absent</p><p class="mt-2 text-3xl font-bold text-rose-700">{{ $summary['Absent'] }}</p><p class="mt-2 text-xs text-rose-700/80">Missed scheduled duties</p></div>
        <div class="rounded-2xl border border-violet-100 bg-violet-50 p-5 shadow-sm"><p class="text-xs font-bold uppercase tracking-wide text-violet-700">Holidays</p><p class="mt-2 text-3xl font-bold text-violet-700">{{ $holidayCount }}</p><p class="mt-2 text-xs text-violet-700/80">Not counted as absent</p></div>
        <div class="rounded-2xl border border-blue-100 bg-blue-50 p-5 shadow-sm"><p class="text-xs font-bold uppercase tracking-wide text-blue-700">Actual work</p><p class="mt-2 text-3xl font-bold text-blue-700">{{ number_format((float) $summary['ActualMinutes'], 0) }} <span class="text-base">min</span></p><p class="mt-2 text-xs text-blue-700/80">Recorded working time</p></div>
    </section>

    <section class="overflow-hidden rounded-2xl border border-slate-200 bg-white shadow-sm">
        <div class="flex flex-col justify-between gap-2 border-b border-slate-200 bg-slate-50 px-5 py-4 sm:flex-row sm:items-center"><div><h2 class="font-bold text-slate-800">My Attendance Details</h2><p class="mt-1 text-xs text-slate-500">{{ \Carbon\Carbon::parse($fromDate)->format('d M Y') }} to {{ \Carbon\Carbon::parse($toDate)->format('d M Y') }}</p></div><span class="rounded-full bg-slate-200 px-3 py-1 text-xs font-semibold text-slate-600">{{ $rows->total() }} records</span></div>
        <div class="overflow-x-auto">
            <table class="min-w-full text-sm">
                <thead class="bg-slate-100 text-left text-xs uppercase tracking-wide text-slate-600"><tr><th class="p-4">Date</th><th class="p-4">Duty / subject</th><th class="p-4">Location</th><th class="p-4">Scheduled time</th><th class="p-4">Check-in / out</th><th class="p-4">Status</th></tr></thead>
                <tbody class="divide-y divide-slate-100">
                    @forelse($rows as $row)
                        @php
                            $statusClasses = match($row['Status']) {
                                'Present' => 'bg-emerald-100 text-emerald-800',
                                'Absent' => 'bg-rose-100 text-rose-800',
                                'Proxy' => 'bg-amber-100 text-amber-800',
                                'Holiday' => 'bg-violet-100 text-violet-800',
                                'No Punch-out' => 'bg-orange-100 text-orange-800',
                                default => 'bg-slate-100 text-slate-700',
                            };
                        @endphp
                        <tr class="hover:bg-slate-50">
                            <td class="p-4 font-medium text-slate-800">{{ \Carbon\Carbon::parse($row['RosterDate'])->format('d M Y') }}</td>
                            <td class="p-4">
                                <div class="font-medium text-slate-800">{{ $row['AssignmentType'] }}</div>
                                @if($row['SubjectName'])
                                    <div class="mt-1 text-xs text-slate-500">{{ $row['SubjectCode'] }} — {{ $row['SubjectName'] }}</div>
                                @endif
                                @if($row['HolidayName'])
                                    <div class="mt-1 text-xs font-semibold text-violet-700">{{ $row['HolidayName'] }}</div>
                                @endif
                            </td>
                            <td class="p-4 text-slate-600">{{ $row['LocationName'] ?? '—' }}</td><td class="p-4 text-slate-600">{{ $row['Start'] }} – {{ $row['End'] }}</td><td class="p-4 text-slate-600">{{ $row['CheckIn'] ?? '—' }} – {{ $row['CheckOut'] ?? '—' }}</td><td class="p-4"><span class="rounded-full px-3 py-1 text-xs font-bold {{ $statusClasses }}">{{ $row['Status'] }}</span></td>
                        </tr>
                    @empty
                        <tr><td colspan="6" class="p-10 text-center text-slate-500">No attendance records were found for this period.</td></tr>
                    @endforelse
                </tbody>
            </table>
        </div>
        @if($rows->hasPages())<div class="border-t border-slate-200 px-5 py-4">{{ $rows->withQueryString()->links() }}</div>@endif
    </section>
</div>
@endsection
