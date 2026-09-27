@extends('layouts.master')

@section('content')
<div class="space-y-6">
    <div>
        <h1 class="text-2xl font-bold">Roster Attendance Report</h1>
        <p class="text-sm text-slate-500">Teachers, security, technicians, electricians, proxy coverage, and total short timing.</p>
    </div>

    <form class="rounded-xl border bg-white p-5">
        <div class="grid gap-3 md:grid-cols-4">
            <div><label class="text-xs font-semibold">From date</label><input type="date" name="from_date" value="{{ $fromDate }}" class="mt-1 w-full rounded border p-2"></div>
            <div><label class="text-xs font-semibold">To date</label><input type="date" name="to_date" value="{{ $toDate }}" class="mt-1 w-full rounded border p-2"></div>
            <div><label class="text-xs font-semibold">Role</label><select name="role" class="mt-1 w-full rounded border p-2"><option value="">All roles</option>@foreach($roles as $role)<option value="{{ $role }}" @selected(request('role') === $role)>{{ $role }}</option>@endforeach</select></div>
            <div class="self-end flex gap-2"><button class="rounded-lg bg-indigo-600 px-5 py-2 text-white">Filter report</button><a href="{{ route('reports.roster-attendance.pdf', request()->query()) }}" class="rounded-lg bg-red-600 px-5 py-2 text-white">Export PDF</a></div>
        </div>
    </form>

    <div class="overflow-hidden rounded-xl border bg-white">
        <div class="border-b bg-slate-50 px-4 py-3 text-xs font-bold uppercase">Employee summary</div>
        <div class="overflow-x-auto"><table class="min-w-full text-sm"><thead class="bg-slate-100 text-left"><tr><th class="p-3">Person / role</th><th class="p-3">Duties</th><th class="p-3">Present</th><th class="p-3">Proxy</th><th class="p-3">Late</th><th class="p-3">Early out</th><th class="p-3">No out</th><th class="p-3">Absent</th><th class="p-3">Scheduled</th><th class="p-3">Actual</th><th class="p-3">Total short timing</th></tr></thead><tbody>
            @forelse($summary as $item)
            <tr class="border-t"><td class="p-3 font-medium">{{ $item['PersonName'] }}<div class="text-xs text-slate-500">{{ $item['RoleName'] }}</div></td><td class="p-3">{{ $item['Scheduled'] }}</td><td class="p-3 text-green-700">{{ $item['Present'] }}</td><td class="p-3 text-amber-700">{{ $item['Proxy'] }}</td><td class="p-3">{{ $item['Late'] }}</td><td class="p-3">{{ $item['EarlyOut'] }}</td><td class="p-3">{{ $item['NoPunchOut'] }}</td><td class="p-3 text-red-600">{{ $item['Absent'] }}</td><td class="p-3">{{ number_format((float) $item['ScheduledMinutes'], 2) }} min</td><td class="p-3">{{ number_format((float) $item['ActualMinutes'], 2) }} min</td><td class="p-3 font-semibold text-red-600">{{ number_format((float) $item['ShortMinutes'], 2) }} min</td></tr>
            @empty
            <tr><td colspan="11" class="p-8 text-center text-slate-500">No roster duties found for this period.</td></tr>
            @endforelse
        </tbody></table></div>
    </div>

    <div class="overflow-hidden rounded-xl border bg-white">
        <div class="border-b bg-slate-50 px-4 py-3 text-xs font-bold uppercase">Duty details</div>
        <div class="overflow-x-auto"><table class="min-w-full text-sm"><thead class="bg-slate-100 text-left"><tr><th class="p-3">Date</th><th class="p-3">Scheduled person</th><th class="p-3">Duty / class</th><th class="p-3">Actual / proxy</th><th class="p-3">Location / device</th><th class="p-3">Shift</th><th class="p-3">Punch in / out</th><th class="p-3">Status</th><th class="p-3">Short timing</th></tr></thead><tbody>
            @forelse($rows as $row)
            <tr class="border-t">
                <td class="p-3">{{ \Carbon\Carbon::parse($row['RosterDate'])->format('d M Y') }}</td>
                <td class="p-3 font-medium">{{ $row['PersonName'] }}<div class="text-xs text-slate-500">{{ $row['RoleName'] }}</div></td>
                <td class="p-3">{{ $row['AssignmentType'] }}
                    @if(!empty($row['SubjectName']))
                    <div class="text-xs text-slate-500">{{ $row['SubjectCode'] }} — {{ $row['SubjectName'] }}</div>
                    <div class="text-xs text-slate-500">{{ $row['AcademicDepartmentName'] }} · {{ $row['BatchName'] }} · {{ $row['AcademicSession'] }}, Sem {{ $row['AcademicSemester'] }}</div>
                    @endif
                </td>
                <td class="p-3">
                    @if($row['ActualPerson'])
                        @if($row['Status'] === 'Proxy')<span class="font-medium text-amber-700">Proxy teacher: {{ $row['ActualPerson'] }}</span>
                        @else Actual teacher: {{ $row['ActualPerson'] }}
                        @endif
                    @else —
                    @endif
                    @if(!empty($row['ProxyPersonName']))<div class="text-xs text-slate-500">Planned proxy: {{ $row['ProxyPersonName'] }}</div>@endif
                </td>
                <td class="p-3">{{ $row['LocationName'] ?? '—' }}<div class="text-xs text-slate-500">{{ $row['DeviceName'] ?? 'No device' }}</div></td>
                <td class="p-3">{{ $row['Start'] }} – {{ $row['End'] }}</td>
                <td class="p-3">{{ $row['CheckIn'] ?? '—' }} – {{ $row['CheckOut'] ?? '—' }}</td>
                <td class="p-3">{{ $row['Status'] }}
                    @if($row['LateMinutes'] !== null)<div class="text-xs text-red-600">Late {{ $row['LateMinutes'] }} min</div>@endif
                    @if($row['EarlyOutMinutes'] !== null)<div class="text-xs text-red-600">Early out {{ ($row['EarlyOutSeconds'] ?? round((float) $row['EarlyOutMinutes'] * 60)) < 60 ? ($row['EarlyOutSeconds'] ?? round((float) $row['EarlyOutMinutes'] * 60)).' sec' : number_format((float) $row['EarlyOutMinutes'], 2).' min' }}</div>@endif
                </td>
                <td class="p-3 font-semibold">{{ number_format((float) $row['ShortMinutes'], 2) }} min</td>
            </tr>
            @empty
            <tr><td colspan="9" class="p-8 text-center text-slate-500">No details for this period.</td></tr>
            @endforelse
        </tbody></table></div>
    </div>
</div>
@endsection
