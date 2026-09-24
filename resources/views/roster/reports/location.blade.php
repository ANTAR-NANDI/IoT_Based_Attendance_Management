@extends('layouts.master')

@section('content')
<div class="space-y-6">
    <div><h1 class="text-2xl font-bold">Room-wise Attendance Report</h1><p class="text-sm text-slate-500">A room timetable showing scheduled classes, attendance, proxy coverage, and blank periods.</p></div>
    <form class="rounded-xl border bg-white p-5"><div class="grid gap-4 md:grid-cols-4">
        <div><label class="text-xs font-semibold">Date</label><input type="date" name="report_date" value="{{ $reportDate }}" class="mt-1 w-full rounded border p-2"></div>
        <div><label class="text-xs font-semibold">Room / duty post</label><select required name="RosterLocationID" class="mt-1 w-full rounded border p-2"><option value="">Select room</option>
            @foreach($locations as $item)
            <option value="{{ $item->RosterLocationID }}" @if((string) $locationId === (string) $item->RosterLocationID) selected @endif>{{ $item->LocationName }}</option>
            @endforeach
        </select></div>
        <div class="self-end"><button class="rounded-lg bg-indigo-600 px-5 py-2 text-white">View room report</button></div>
        @if($location)
        <div class="self-end"><a href="{{ route('reports.room-attendance.pdf', ['report_date' => $reportDate, 'RosterLocationID' => $locationId]) }}" class="inline-block rounded-lg bg-red-600 px-5 py-2 text-white">Export PDF</a></div>
        @endif
    </div></form>
    @if($location)
    <div class="overflow-hidden rounded-xl border bg-white"><div class="border-b bg-slate-50 px-5 py-4"><span class="font-semibold">{{ $location->LocationName }}</span><span class="ml-2 text-sm text-slate-500">{{ \Carbon\Carbon::parse($reportDate)->format('d M Y') }}</span></div><div class="overflow-x-auto"><table class="min-w-full text-sm"><thead class="bg-slate-100 text-left"><tr><th class="w-44 p-4">Time</th><th class="p-4">Scheduled Class / Teacher</th><th class="p-4">Attendance Detail</th><th class="w-32 p-4">Short Time</th></tr></thead><tbody>
        @forelse($timeline as $item)
            @if($item['blank'])
            <tr class="border-t bg-slate-50 text-slate-500"><td class="p-4 font-medium">{{ $item['Start'] }} - {{ $item['End'] }}</td><td colspan="3" class="p-4 italic">Blank room - no class or duty scheduled.</td></tr>
            @else
            @php($row = $item['row'])
            <tr class="border-t"><td class="p-4 font-medium">{{ $row['Start'] }} - {{ $row['End'] }}</td><td class="p-4"><div class="font-semibold">{{ $row['PersonName'] }}</div><div class="text-xs text-slate-500">{{ $row['RoleName'] }} · {{ $row['AssignmentType'] }}</div>
                @if(!empty($row['SubjectName']))
                <div class="mt-1 text-sm">{{ $row['SubjectCode'] }} - {{ $row['SubjectName'] }}</div><div class="text-xs text-slate-500">{{ $row['BatchName'] }}, Sem {{ $row['AcademicSemester'] }}</div>
                @endif
            </td><td class="p-4"><div class="font-semibold">{{ $row['Status'] }}</div>
                @if($row['ActualPerson'])
                    @if($row['Status'] === 'Proxy')
                    <div class="mt-1 text-amber-700">Proxy teacher: {{ $row['ActualPerson'] }}</div>
                    @else
                    <div class="mt-1">Actual teacher: {{ $row['ActualPerson'] }}</div>
                    @endif
                @endif
                <div class="mt-1 text-sm">In: {{ $row['CheckIn'] ?? '-' }} · Out: {{ $row['CheckOut'] ?? '-' }}</div>
                @if($row['LateMinutes'] !== null)
                <div class="text-xs text-red-600">Late in: {{ $row['LateMinutes'] }} min</div>
                @endif
                @if($row['EarlyOutMinutes'] !== null)
                <div class="text-xs text-red-600">Early out: {{ $row['EarlyOutMinutes'] }} min</div>
                @endif
            </td><td class="p-4 font-semibold">{{ $row['ShortMinutes'] }} min</td></tr>
            @endif
        @empty
        <tr><td colspan="4" class="p-8 text-center text-slate-500">No classes or duties are scheduled in this room for this date.</td></tr>
        @endforelse
    </tbody></table></div></div>
    @endif
</div>
@endsection
