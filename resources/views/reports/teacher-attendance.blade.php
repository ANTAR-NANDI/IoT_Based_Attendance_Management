@extends('layouts.master')

@section('content')
<div class="space-y-6">
    <div>
        <h1 class="text-2xl font-bold text-slate-800">Teacher Attendance</h1>
        <p class="text-sm text-slate-500">Select a teacher to review attendance days and every scheduled class.</p>
    </div>

    <form method="GET" class="rounded-xl border border-slate-200 bg-white p-5 shadow-sm">
        <div class="grid grid-cols-1 gap-3 md:grid-cols-4">
            <input type="date" name="from_date" value="{{ $fromDate }}" class="rounded-lg border border-slate-300 px-4 py-2">
            <input type="date" name="to_date" value="{{ $toDate }}" class="rounded-lg border border-slate-300 px-4 py-2">
            <input type="search" name="search" value="{{ request('search') }}" placeholder="Teacher, employee ID, department" class="rounded-lg border border-slate-300 px-4 py-2">
            <button class="rounded-lg bg-indigo-600 px-5 py-2 font-medium text-white hover:bg-indigo-700">Show Report</button>
        </div>
    </form>

    <div class="overflow-hidden rounded-xl border border-slate-200 bg-white shadow-sm">
        <div class="overflow-x-auto">
            <table class="min-w-full divide-y divide-slate-200 text-sm">
                <thead class="bg-slate-100 text-xs uppercase text-slate-600">
                    <tr>
                        <th class="px-4 py-3 text-left">Teacher</th>
                        <th class="px-4 py-3 text-center">Scheduled days</th>
                        <th class="px-4 py-3 text-center">Attended days</th>
                        <th class="px-4 py-3 text-center">Present</th>
                        <th class="px-4 py-3 text-center">Late</th>
                        <th class="px-4 py-3 text-center">Missed</th>
                        <th class="px-4 py-3 text-center">Proxy</th>
                        <th class="px-4 py-3 text-center">Details</th>
                    </tr>
                </thead>
                <tbody class="divide-y divide-slate-200">
                    @forelse($teachers as $teacher)
                        <tr class="hover:bg-slate-50">
                            <td class="px-4 py-3">
                                <div class="font-semibold text-slate-800">{{ $teacher->TeacherName }}</div>
                                <div class="text-xs text-slate-500">{{ $teacher->EmployeeID }} · {{ $teacher->DepartmentName ?? 'No department' }} · ZKT {{ $teacher->ZKUserID ?? 'not assigned' }}</div>
                            </td>
                            <td class="px-4 py-3 text-center">{{ $teacher->metrics['ScheduledDays'] }}</td>
                            <td class="px-4 py-3 text-center font-semibold text-teal-700">{{ $teacher->metrics['AttendedDays'] }}</td>
                            <td class="px-4 py-3 text-center text-teal-700">{{ $teacher->metrics['Present'] }}</td>
                            <td class="px-4 py-3 text-center text-amber-700">{{ $teacher->metrics['Late'] }}</td>
                            <td class="px-4 py-3 text-center text-rose-700">{{ $teacher->metrics['MissedClasses'] }}</td>
                            <td class="px-4 py-3 text-center text-amber-700">{{ $teacher->metrics['Proxy'] }}</td>
                            <td class="px-4 py-3 text-center">
                                <a href="{{ route('reports.teacher-attendance.detail', array_merge(request()->query(), ['teacherId' => $teacher->TeacherID])) }}" class="inline-flex rounded-lg bg-indigo-600 px-3 py-2 font-medium text-white shadow hover:bg-indigo-700">Details</a>
                            </td>
                        </tr>
                    @empty
                        <tr><td colspan="8" class="px-4 py-10 text-center text-slate-500">No teachers found.</td></tr>
                    @endforelse
                </tbody>
            </table>
        </div>
    </div>

    @if($teachers->hasPages())
        <div>{{ $teachers->withQueryString()->links() }}</div>
    @endif
</div>
@endsection
