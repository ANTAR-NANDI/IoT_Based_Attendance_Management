@extends('layouts.master')

@section('title', 'Roster Dashboard')

@section('content')
<div class="space-y-7">
    <div>
        <h1 class="text-3xl font-bold text-slate-800">Army University Roster Dashboard</h1>
        <p class="mt-1 text-slate-500">Manage 24-hour duty rosters and attendance from ZKT face-punch data.</p>
    </div>
    <div class="grid gap-5 md:grid-cols-2 xl:grid-cols-4">
        @foreach ([
            ['Roster People', $totalRosterPeople, 'bg-blue-600'],
            ['Active ZKT Devices', $totalDevices, 'bg-emerald-600'],
            ['Roster Shift Templates', $totalRosterShifts, 'bg-violet-600'],
            ["Today's Duties", $todayAssignments, 'bg-amber-600'],
        ] as [$label, $value, $color])
            <div class="{{ $color }} rounded-2xl p-6 text-white shadow"><p class="text-sm text-white/80">{{ $label }}</p><p class="mt-2 text-4xl font-bold">{{ $value }}</p></div>
        @endforeach
    </div>
    <div class="grid gap-5 lg:grid-cols-2">
        <div class="rounded-2xl border border-slate-200 bg-white p-6 shadow-sm"><h2 class="text-lg font-bold">First-time setup</h2><ol class="mt-4 space-y-3 text-sm text-slate-600"><li>1. Add every ZKT device and its exact terminal serial number.</li><li>2. Add roster people with their exact ZKT User ID.</li><li>3. Add duty posts and reusable roster shifts.</li><li>4. Create date-based duties in Roster Calendar.</li><li>5. Check the Roster Attendance Report after face scans sync.</li></ol></div>
        <div class="rounded-2xl border border-slate-200 bg-white p-6 shadow-sm"><h2 class="text-lg font-bold">Quick actions</h2><div class="mt-4 flex flex-wrap gap-3"><a class="rounded-lg bg-indigo-600 px-4 py-2 text-sm text-white" href="{{ route('devices.index') }}">Add ZKT Device</a><a class="rounded-lg bg-indigo-600 px-4 py-2 text-sm text-white" href="{{ route('roster.people.create') }}">Add Roster Person</a><a class="rounded-lg bg-indigo-600 px-4 py-2 text-sm text-white" href="{{ route('roster.assignments.create') }}">Create Duty</a><a class="rounded-lg bg-slate-700 px-4 py-2 text-sm text-white" href="{{ route('reports.roster-attendance') }}">Open Report</a></div></div>
    </div>
</div>
@endsection
