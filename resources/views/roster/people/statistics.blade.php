@extends('layouts.master')

@section('title', 'Faculty Statistics')

@section('content')
<div class="space-y-6">
    <div class="flex flex-wrap items-start justify-between gap-4">
        <div><h1 class="text-2xl font-bold text-slate-800">{{ $faculty->PersonName }} — Faculty Statistics</h1><p class="mt-1 text-sm text-slate-500">{{ $faculty->SelectedDesignation ?? $faculty->RoleName }}{{ $faculty->SelectedDepartment ? ' · '.$faculty->SelectedDepartment : '' }}</p></div>
        <a href="{{ route('roster.people.index') }}" class="rounded-lg bg-slate-700 px-4 py-2 text-sm font-semibold text-white hover:bg-slate-800">Back to Faculties</a>
    </div>

    <form method="GET" class="rounded-xl border border-slate-200 bg-white p-5 shadow-sm"><div class="grid gap-4 sm:grid-cols-2 lg:grid-cols-[180px_180px_auto]"><div><label class="text-xs font-semibold">From date</label><input type="date" name="from_date" value="{{ $fromDate }}" class="mt-1 w-full rounded border p-2"></div><div><label class="text-xs font-semibold">To date</label><input type="date" name="to_date" value="{{ $toDate }}" class="mt-1 w-full rounded border p-2"></div><div class="self-end"><button class="rounded-lg bg-indigo-600 px-5 py-2 text-white">Update statistics</button></div></div></form>

    <div class="grid gap-4 sm:grid-cols-2 xl:grid-cols-3">
        @foreach($statistics as $stat)
            <div class="{{ $stat['color'] }} rounded-2xl p-5 text-white shadow"><p class="text-sm text-white/80">{{ $stat['label'] }}</p><div class="mt-2 flex items-end justify-between"><p class="text-4xl font-bold">{{ $stat['value'] }}</p><p class="text-lg font-semibold">{{ number_format($stat['percent'], 1) }}%</p></div><p class="mt-2 text-xs text-white/75">{{ $stat['description'] }}</p></div>
        @endforeach
    </div>

    <div class="overflow-hidden rounded-xl border border-slate-200 bg-white shadow-sm"><div class="border-b bg-slate-50 px-5 py-4"><h2 class="font-bold text-slate-800">Class-by-class attendance</h2><p class="mt-1 text-sm text-slate-500">{{ $totalClasses }} non-holiday class{{ $totalClasses === 1 ? '' : 'es' }} in the selected period.</p></div><div class="overflow-x-auto"><table class="min-w-full text-sm"><thead class="bg-slate-100 text-left text-xs uppercase text-slate-600"><tr><th class="p-4">Class</th><th class="p-4">Type</th><th class="p-4">Date &amp; time</th><th class="p-4">Room</th><th class="p-4">Status</th><th class="p-4">Proxy / punches</th></tr></thead><tbody class="divide-y divide-slate-100">@forelse($rows as $row)<tr class="hover:bg-slate-50"><td class="p-4 font-medium">{{ $row['SubjectCode'] ? $row['SubjectCode'].' — ' : '' }}{{ $row['SubjectName'] ?? 'Class' }}<div class="mt-1 text-xs text-slate-500">{{ $row['BatchName'] ?? '—' }}</div></td><td class="p-4">{{ $row['AssignmentType'] }}</td><td class="p-4">{{ \Carbon\Carbon::parse($row['RosterDate'])->format('d M Y') }}<div class="mt-1 text-xs text-slate-500">{{ $row['Start'] }} – {{ $row['End'] }}</div></td><td class="p-4">{{ $row['LocationName'] ?? '—' }}</td><td class="p-4">@php($statusColor = match($row['Status']) { 'Present' => 'bg-emerald-100 text-emerald-700', 'Proxy' => 'bg-amber-100 text-amber-700', 'Absent', 'Late - Absent' => 'bg-rose-100 text-rose-700', 'Holiday' => 'bg-violet-100 text-violet-700', default => 'bg-slate-100 text-slate-700' })<span class="rounded-full px-3 py-1 text-xs font-semibold {{ $statusColor }}">{{ $row['Status'] }}</span></td><td class="p-4">{{ $row['ActualPerson'] ?? $row['ProxyPersonName'] ?? '—' }}<div class="mt-1 text-xs text-slate-500">In: {{ $row['CheckIn'] ?? '—' }} · Out: {{ $row['CheckOut'] ?? '—' }}</div></td></tr>@empty<tr><td colspan="6" class="p-10 text-center text-slate-500">No classes are scheduled for this faculty member in the selected period.</td></tr>@endforelse</tbody></table></div></div>
</div>
@endsection
