@extends('layouts.master')

@push('styles')
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/select2@4.1.0-rc.0/dist/css/select2.min.css">
    <style>
        .select2-container { width: 100% !important; }
        .select2-container--default .select2-selection--multiple { min-height: 42px; border-color: #94a3b8; border-radius: 0.375rem; padding: 4px; }
        .select2-container--default.select2-container--focus .select2-selection--multiple { border-color: #2563eb; }
    </style>
@endpush

@section('content')
<div class="space-y-6">
    <div>
        <h1 class="text-2xl font-bold">Room-wise Attendance Report</h1>
        <p class="text-sm text-slate-500">Select one or more rooms to compare their scheduled classes in the same time slots.</p>
    </div>

    <form class="rounded-xl border bg-white p-5" method="GET" action="{{ route('reports.room-attendance') }}">
        <div class="grid gap-4 md:grid-cols-[220px_1fr_auto]">
            <div>
                <label class="text-xs font-semibold">Date</label>
                <input type="date" name="report_date" value="{{ $reportDate }}" class="mt-1 w-full rounded border p-2">
            </div>
            <div>
                <label class="text-xs font-semibold">Rooms / duty posts</label>
                <select required id="room-selector" name="RosterLocationIDs[]" multiple class="mt-1 w-full rounded border p-2">
                    @foreach($locations as $item)
                        <option value="{{ $item->RosterLocationID }}" {{ $locationIds->contains((int) $item->RosterLocationID) ? 'selected' : '' }}>{{ $item->LocationName }}</option>
                    @endforeach
                </select>
                <p class="mt-1 text-xs text-slate-500">Search and select one or more rooms.</p>
            </div>
            <div class="self-end">
                <button class="rounded-lg bg-indigo-600 px-5 py-2 text-white">View room report</button>
            </div>
        </div>
    </form>

    @if($selectedLocations->isNotEmpty())
        <div class="overflow-x-auto rounded-xl border bg-white">
            <table class="w-auto border-collapse text-sm">
                <thead class="bg-slate-800 text-white">
                    <tr>
                        <th style="width: 150px" class="border-r border-slate-500 px-3 py-3 text-left">Time slot</th>
                        @foreach($selectedLocations as $location)
                            <th style="width: 220px" class="border-r border-slate-500 px-3 py-3 text-left">{{ $location->LocationName }}</th>
                        @endforeach
                    </tr>
                </thead>
                <tbody>
                    @forelse($matrix as $slot)
                        <tr class="border-t align-top">
                            <td class="border-r bg-slate-100 px-3 py-4 font-bold text-slate-800">{{ $slot['Start'] }} - {{ $slot['End'] }}</td>
                            @foreach($selectedLocations as $location)
                                @php($row = $slot['rooms'][$location->RosterLocationID] ?? null)
                                <td class="border-r p-1">
                                    @if(!$row)
                                        <div style="max-width: 220px" class="rounded-md bg-slate-200 p-3 text-center text-xs font-semibold text-slate-600">Not scheduled</div>
                                    @else
                                        @php($colors = match($row['Status']) { 'Present' => 'border-blue-700 bg-blue-200', 'Absent' => 'border-red-700 bg-red-200', 'Proxy' => 'border-amber-700 bg-amber-200', 'No Punch-out' => 'border-orange-700 bg-orange-200', 'Upcoming' => 'border-violet-700 bg-violet-200', 'Running' => 'border-emerald-700 bg-emerald-200', default => 'border-slate-600 bg-slate-200' })
                                        <div style="max-width: 220px" class="inline-block rounded-lg border-2 {{ $colors }} p-3 text-slate-900">
                                            <div class="font-bold">{{ $row['PersonName'] }}</div>
                                            <div class="mt-1 text-sm font-medium">{{ $row['SubjectName'] ? $row['SubjectCode'].' - '.$row['SubjectName'] : $row['AssignmentType'] }}</div>
                                            <div class="text-xs">{{ $row['BatchName'] ? $row['BatchName'].($row['AcademicSemester'] ? ', Sem '.$row['AcademicSemester'] : '') : '' }}</div>
                                            <div class="mt-3 border-t border-slate-700/30 pt-2 text-sm"><strong>{{ $row['Status'] }}</strong> · {{ number_format((float) $row['ShortMinutes'], 2) }} min short</div>
                                            <div class="text-xs">In: {{ $row['CheckIn'] ?? '-' }} · Out: {{ $row['CheckOut'] ?? '-' }}</div>
                                            @if($row['Status'] === 'Proxy' && $row['ActualPerson'])
                                                <div class="mt-1 text-xs font-semibold text-amber-900">Proxy: {{ $row['ActualPerson'] }}</div>
                                            @endif
                                            @if($row['LateMinutes'] !== null || $row['EarlyOutMinutes'] !== null)
                                                <div class="mt-1 text-xs text-red-800">{{ $row['LateMinutes'] !== null ? 'Late '.number_format((float) $row['LateMinutes'], 2).' min' : '' }}{{ $row['LateMinutes'] !== null && $row['EarlyOutMinutes'] !== null ? ' · ' : '' }}{{ $row['EarlyOutMinutes'] !== null ? 'Early out '.number_format((float) $row['EarlyOutMinutes'], 2).' min' : '' }}</div>
                                            @endif
                                        </div>
                                    @endif
                                </td>
                            @endforeach
                        </tr>
                    @empty
                        <tr><td colspan="{{ $selectedLocations->count() + 1 }}" class="p-10 text-center text-slate-500">No classes or duties are scheduled in the selected rooms for this date.</td></tr>
                    @endforelse
                </tbody>
            </table>
        </div>
    @endif
</div>
@endsection

@push('scripts')
    <script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/select2@4.1.0-rc.0/dist/js/select2.min.js"></script>
    <script>
        $(function () {
            $('#room-selector').select2({
                placeholder: 'Select rooms',
                width: '100%',
                closeOnSelect: false
            });
        });
    </script>
@endpush
