@extends('layouts.master')

@section('content')

<div class="space-y-6">

    <div>
        <h1 class="text-2xl font-bold text-slate-800">Class Attendance Report</h1>
        <p class="text-sm text-slate-500">Reconciled against ZKTeco device punches</p>
    </div>

    <!-- Filters -->
    <div class="bg-white rounded-xl shadow border border-slate-200 p-5">
        <form method="GET" action="{{ route('reports.class-attendance') }}">
            <div class="flex flex-col lg:flex-row gap-3">

                <input type="date" name="from_date" value="{{ $fromDate }}"
                       class="rounded-lg border border-slate-300 px-4 py-2 focus:ring-2 focus:ring-indigo-500 focus:outline-none">

                <input type="date" name="to_date" value="{{ $toDate }}"
                       class="rounded-lg border border-slate-300 px-4 py-2 focus:ring-2 focus:ring-indigo-500 focus:outline-none">

                <button type="submit" class="rounded-lg bg-indigo-600 px-6 py-2 text-white hover:bg-indigo-700">
                    Filter
                </button>
                  <a href="{{ route('reports.class-attendance.export', request()->query()) }}"
               class="inline-flex items-center gap-2 rounded-lg bg-red-600 px-5 py-2.5 text-sm font-medium text-white shadow transition hover:bg-red-700 hover:shadow-lg">
                <svg xmlns="http://www.w3.org/2000/svg" class="h-4 w-4" fill="none" viewBox="0 0 24 24" stroke="currentColor">
                    <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2"
                          d="M12 10v6m0 0l-3-3m3 3l3-3m-9 8h12a2 2 0 002-2V8a2 2 0 00-2-2h-4l-2-2H5a2 2 0 00-2 2v12a2 2 0 002 2z" />
                </svg>
                Export PDF
            </a>
            </div>
        </form>
    </div>

    <!-- Per-teacher summary -->
    <div class="overflow-hidden rounded-xl border border-slate-200 bg-white shadow">
        <div class="px-4 py-3 bg-slate-100 font-bold text-xs uppercase text-slate-600">Teacher Summary</div>
        <div class="overflow-x-auto">
            <table class="min-w-full divide-y divide-slate-200">
                <thead class="bg-slate-50">
                    <tr>
                        <th class="px-4 py-3 text-left text-xs font-bold uppercase">Teacher</th>
                        <th class="px-4 py-3 text-center text-xs font-bold uppercase">Classes</th>
                        <th class="px-4 py-3 text-center text-xs font-bold uppercase">Present</th>
                        <th class="px-4 py-3 text-center text-xs font-bold uppercase">Proxy</th>
                        <th class="px-4 py-3 text-center text-xs font-bold uppercase">Absent</th>
                        <th class="px-4 py-3 text-right text-xs font-bold uppercase">Scheduled (min)</th>
                        <th class="px-4 py-3 text-right text-xs font-bold uppercase">Actual (min)</th>
                    </tr>
                </thead>
                <tbody class="divide-y divide-slate-200">
                    @forelse($summary as $row)
                        <tr class="hover:bg-slate-50">
                            <td class="px-4 py-3 font-semibold">{{ $row['TeacherName'] }}</td>
                            <td class="px-4 py-3 text-center">{{ $row['TotalClasses'] }}</td>
                            <td class="px-4 py-3 text-center text-green-700">{{ $row['Present'] }}</td>
                            <td class="px-4 py-3 text-center text-amber-700">{{ $row['Proxy'] }}</td>
                            <td class="px-4 py-3 text-center text-red-700">{{ $row['Absent'] }}</td>
                            <td class="px-4 py-3 text-right">{{ $row['ScheduledMinutes'] }}</td>
                            <td class="px-4 py-3 text-right">{{ $row['ActualMinutes'] ?? '—' }}</td>
                        </tr>
                    @empty
                        <tr><td colspan="7" class="py-8 text-center text-slate-500">No data for this range</td></tr>
                    @endforelse
                </tbody>
            </table>
        </div>
    </div>

    <!-- Per-class detail -->
    <div class="overflow-hidden rounded-xl border border-slate-200 bg-white shadow">
        <div class="px-4 py-3 bg-slate-100 font-bold text-xs uppercase text-slate-600">Class Detail</div>
        <div class="overflow-x-auto">
            <table class="min-w-full divide-y divide-slate-200">
                <thead class="bg-slate-50">
                    <tr>
                        <th class="px-4 py-3 text-left text-xs font-bold uppercase">Date / Day</th>
                        <th class="px-4 py-3 text-left text-xs font-bold uppercase">Subject / Batch</th>
                        <th class="px-4 py-3 text-left text-xs font-bold uppercase">Room</th>
                        <th class="px-4 py-3 text-left text-xs font-bold uppercase">Assigned</th>
                        <th class="px-4 py-3 text-left text-xs font-bold uppercase">Actual</th>
                        <th class="px-4 py-3 text-left text-xs font-bold uppercase">Scheduled In / Out</th>
                        <th class="px-4 py-3 text-left text-xs font-bold uppercase">Actual In / Out</th>
                        <th class="px-4 py-3 text-center text-xs font-bold uppercase">Status</th>
                    </tr>
                </thead>
                <tbody class="divide-y divide-slate-200">
                    @forelse($report as $row)
                        <tr class="hover:bg-slate-50">
                            <td class="px-4 py-3">
                                <div class="font-semibold">{{ \Carbon\Carbon::parse($row['RoutineDate'])->format('d M Y') }}</div>
                                <div class="text-xs text-slate-500">{{ $row['DayName'] }}</div>
                            </td>
                            <td class="px-4 py-3">
                                <div>{{ $row['SubjectName'] }}</div>
                                <div class="text-xs text-slate-500">{{ $row['BatchName'] }}</div>
                            </td>
                            <td class="px-4 py-3">{{ $row['RoomNo'] }}</td>
                            <td class="px-4 py-3 font-semibold">{{ $row['AssignedTeacher'] }}</td>
                            <td class="px-4 py-3 {{ $row['Status'] == 'Proxy' ? 'text-amber-700 font-semibold' : '' }}">
                                {{ $row['ActualTeacher'] ?? '—' }}
                            </td>
                            <td class="px-4 py-3 text-xs whitespace-nowrap">
                                {{ \Carbon\Carbon::parse($row['StartTime'])->format('h:i A') }}
                                &ndash;
                                {{ \Carbon\Carbon::parse($row['EndTime'])->format('h:i A') }}
                                <div class="text-slate-400">{{ $row['ScheduledMinutes'] }} min</div>
                            </td>
                            <td class="px-4 py-3 text-xs whitespace-nowrap">
                                @if($row['CheckIn'])
                                    {{ $row['CheckIn'] }} &ndash; {{ $row['CheckOut'] ?? 'no punch-out' }}
                                    @if($row['ActualMinutes'])
                                        <div class="text-slate-400">{{ $row['ActualMinutes'] }} min</div>
                                    @endif
                                @else
                                    —
                                @endif
                                @if($row['LateByMinutes'])
                                    <div class="text-red-600">Late {{ $row['LateByMinutes'] }}m</div>
                                @endif
                                @if($row['LeftEarlyByMinutes'])
                                    <div class="text-red-600">Left early {{ $row['LeftEarlyByMinutes'] }}m</div>
                                @endif
                            </td>
                            <td class="px-4 py-3 text-center">
                                @php
                                    $badge = match($row['Status']) {
                                        'Present' => 'bg-green-100 text-green-700',
                                        'Proxy' => 'bg-amber-100 text-amber-700',
                                        'Incomplete Punch' => 'bg-slate-200 text-slate-600',
                                        default => 'bg-red-100 text-red-700',
                                    };
                                @endphp
                                <span class="inline-flex rounded-full px-3 py-1 text-xs font-semibold {{ $badge }}">
                                    {{ $row['Status'] }}
                                </span>
                            </td>
                        </tr>
                    @empty
                        <tr><td colspan="8" class="py-10 text-center text-slate-500">No classes scheduled in this range</td></tr>
                    @endforelse
                </tbody>
            </table>
        </div>
    </div>

    <!-- Pagination -->
    @if($report->hasPages())
    <div class="mt-6">
        {{ $report->withQueryString()->links() }}
    </div>
@endif

</div>

@endsection