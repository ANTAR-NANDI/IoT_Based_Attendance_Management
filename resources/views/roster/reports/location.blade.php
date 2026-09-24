@extends('layouts.master')
@section('content')
<div class="space-y-6"><div><h1 class="text-2xl font-bold">Room-wise Attendance Report</h1><p class="text-sm text-slate-500">Each scheduled period is shown as a separate status card.</p></div>
<form class="rounded-xl border bg-white p-5"><div class="grid gap-4 md:grid-cols-4"><div><label class="text-xs font-semibold">Date</label><input type="date" name="report_date" value="{{ $reportDate }}" class="mt-1 w-full rounded border p-2"></div><div><label class="text-xs font-semibold">Room / duty post</label><select required name="RosterLocationID" class="mt-1 w-full rounded border p-2"><option value="">Select room</option>@foreach($locations as $item)<option value="{{ $item->RosterLocationID }}" @if((string) $locationId === (string) $item->RosterLocationID) selected @endif>{{ $item->LocationName }}</option>@endforeach</select></div><div class="self-end"><button class="rounded-lg bg-indigo-600 px-5 py-2 text-white">View room report</button></div>@if($location)<div class="self-end"><a href="{{ route('reports.room-attendance.pdf', ['report_date' => $reportDate, 'RosterLocationID' => $locationId]) }}" class="inline-block rounded-lg bg-red-600 px-5 py-2 text-white">Export PDF</a></div>@endif</div></form>
@if($location)<div class="rounded-xl border bg-white p-5"><div class="mb-4 border-b pb-4"><span class="font-semibold">{{ $location->LocationName }}</span><span class="ml-2 text-sm text-slate-500">{{ \Carbon\Carbon::parse($reportDate)->format('d M Y') }}</span></div><div class="space-y-4">
@forelse($timeline as $item)
@if($item['blank'])
<div class="rounded-xl border-2 border-slate-500 bg-slate-300 p-5"><div class="grid items-center gap-3 md:grid-cols-[180px_1fr]"><div class="font-bold text-slate-800">{{ $item['Start'] }} - {{ $item['End'] }}</div><div class="font-semibold italic text-slate-700">Blank room - no class or duty scheduled.</div></div></div>
@else
@php($row = $item['row'])
@php($boxColor = match($row['Status']) { 'Present' => 'border-blue-700 bg-blue-200', 'Absent' => 'border-red-700 bg-red-200', 'Proxy' => 'border-amber-700 bg-amber-200', 'No Punch-out' => 'border-orange-700 bg-orange-200', 'Upcoming' => 'border-violet-700 bg-violet-200', 'Running' => 'border-emerald-700 bg-emerald-200', default => 'border-slate-600 bg-slate-200' })
<div class="rounded-xl border-2 {{ $boxColor }} shadow-sm"><div class="grid divide-y divide-slate-700/50 md:grid-cols-2 md:divide-x md:divide-y-0">
<div class="p-4"><div class="text-xs font-bold uppercase text-slate-600">Schedule</div><div class="mt-1 font-bold text-slate-900">{{ $row['Start'] }} - {{ $row['End'] }}</div><div class="mt-2 font-semibold">{{ $row['PersonName'] }}</div><div class="text-sm">{{ $row['SubjectName'] ? $row['SubjectCode'].' - '.$row['SubjectName'] : $row['AssignmentType'] }}</div></div>
<div class="p-4"><div class="text-xs font-bold uppercase text-slate-600">Attendance</div><div class="mt-1 font-bold">{{ $row['Status'] }} · {{ number_format((float) $row['ShortMinutes'], 2) }} min short</div><div class="mt-1 text-sm">In: {{ $row['CheckIn'] ?? '-' }} · Out: {{ $row['CheckOut'] ?? '-' }}</div><div class="text-sm {{ $row['Status'] === 'Proxy' ? 'text-amber-800' : '' }}">{{ $row['Status'] === 'Proxy' && $row['ActualPerson'] ? 'Proxy: '.$row['ActualPerson'] : '' }}</div><div class="text-xs text-red-700">{{ $row['LateMinutes'] !== null ? 'Late '.number_format((float) $row['LateMinutes'], 2).' min' : '' }} {{ $row['EarlyOutMinutes'] !== null ? ' · Early out '.number_format((float) $row['EarlyOutMinutes'], 2).' min' : '' }}</div></div>
</div></div>
@endif
@empty
<div class="rounded-xl border bg-slate-50 p-8 text-center text-slate-500">No classes or duties are scheduled in this room for this date.</div>
@endforelse
</div></div>@endif</div>
@endsection
