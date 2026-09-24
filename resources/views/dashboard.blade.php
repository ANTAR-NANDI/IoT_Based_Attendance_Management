@extends('layouts.master')
@section('title', 'Roster Dashboard')
@section('content')
<div class="space-y-7">
    <div><h1 class="text-3xl font-bold text-slate-800">Army University Attendance Dashboard</h1><p class="mt-1 text-slate-500">Date-range attendance analytics from ZKT face-punch data.</p></div>

    <form class="rounded-2xl border border-slate-200 bg-white p-5 shadow-sm"><div class="grid gap-4 md:grid-cols-3"><div><label class="text-sm font-semibold">From date</label><input type="date" name="from_date" value="{{ $fromDate }}" class="mt-1 w-full rounded border p-2"></div><div><label class="text-sm font-semibold">To date</label><input type="date" name="to_date" value="{{ $toDate }}" class="mt-1 w-full rounded border p-2"></div><div class="self-end"><button class="rounded-lg bg-indigo-600 px-5 py-2 text-white">Show analytics</button></div></div></form>

    <div class="grid gap-5 md:grid-cols-2 xl:grid-cols-4">
        @foreach($dashboardMetrics as $metric)
        <div class="{{ $metric['color'] }} rounded-2xl p-6 text-white shadow"><p class="text-sm text-white/80">{{ $metric['label'] }}</p><p class="mt-2 text-4xl font-bold">{{ $metric['value'] }}</p><p class="mt-2 text-xs text-white/70">{{ \Carbon\Carbon::parse($fromDate)->format('d M') }} - {{ \Carbon\Carbon::parse($toDate)->format('d M Y') }}</p></div>
        @endforeach
    </div>

    <div class="grid gap-6 xl:grid-cols-2">
        <div class="rounded-2xl border border-slate-200 bg-white p-6 shadow-sm"><div class="flex items-center justify-between"><div><h2 class="text-lg font-bold">Teacher Accuracy</h2><p class="text-sm text-slate-500">Present with no late entry and no early out.</p></div><span class="rounded-full bg-blue-100 px-3 py-1 text-xs font-semibold text-blue-700">Percent</span></div><div class="mt-5 h-80"><canvas id="accuracyChart"></canvas></div></div>
        <div class="rounded-2xl border border-slate-200 bg-white p-6 shadow-sm"><div><h2 class="text-lg font-bold">Attendance Status</h2><p class="text-sm text-slate-500">Distribution for the selected date range.</p></div><div class="mt-5 h-80"><canvas id="statusChart"></canvas></div></div>
    </div>

    <div class="rounded-2xl border border-slate-200 bg-white p-6 shadow-sm" x-data="{ type: 'teacher' }"><h2 class="text-lg font-bold">Find Attendance Report</h2><p class="mt-1 text-sm text-slate-500">Choose report type first, then select its date and teacher or room.</p><form class="mt-4 grid gap-4 md:grid-cols-4" :action="type === 'room' ? '{{ route('reports.room-attendance') }}' : '{{ route('reports.teacher-attendance') }}'"><div><label class="text-sm">Report type</label><select x-model="type" class="mt-1 w-full rounded border p-2"><option value="teacher">Teacher-wise</option><option value="room">Room-wise</option></select></div><div><label class="text-sm">Date</label><input type="date" name="report_date" value="{{ $toDate }}" class="mt-1 w-full rounded border p-2"></div><div x-show="type === 'room'"><label class="text-sm">Room / duty post</label><select name="RosterLocationID" class="mt-1 w-full rounded border p-2"><option value="">Select room</option>@foreach($reportLocations as $location)<option value="{{ $location->RosterLocationID }}">{{ $location->LocationName }}</option>@endforeach</select></div><div x-show="type === 'teacher'"><label class="text-sm">Teacher / employee</label><select name="RosterPersonID" class="mt-1 w-full rounded border p-2"><option value="">Select person</option>@foreach($reportPeople as $person)<option value="{{ $person->RosterPersonID }}">{{ $person->PersonName }} - {{ $person->RoleName }}</option>@endforeach</select></div><div class="self-end"><button class="rounded-lg bg-indigo-600 px-5 py-2 text-white">Open report</button></div></form></div>
</div>
@endsection
@push('scripts')
<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
<script>
const accuracyLabels = @json($teacherAccuracy->keys()->values());
const accuracyValues = @json($teacherAccuracy->values());
const statusLabels = @json(array_keys($statusCounts));
const statusValues = @json(array_values($statusCounts));
new Chart(document.getElementById('accuracyChart'), { type: 'bar', data: { labels: accuracyLabels, datasets: [{ label: 'Accuracy %', data: accuracyValues, backgroundColor: '#2563eb', borderRadius: 6 }] }, options: { responsive: true, maintainAspectRatio: false, scales: { y: { beginAtZero: true, max: 100, ticks: { callback: value => value + '%' } } }, plugins: { legend: { display: false } } } });
new Chart(document.getElementById('statusChart'), { type: 'pie', data: { labels: statusLabels, datasets: [{ data: statusValues, backgroundColor: ['#059669','#d97706','#64748b','#dc2626'] }] }, options: { responsive: true, maintainAspectRatio: false, plugins: { legend: { position: 'bottom' } } } });
</script>
@endpush
