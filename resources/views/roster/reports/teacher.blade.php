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
        <h1 class="text-2xl font-bold">Teacher-wise Attendance Report</h1>
        <p class="text-sm text-slate-500">Select one or more teachers or employees to compare their scheduled duties by time slot.</p>
    </div>

    <form class="rounded-xl border bg-white p-5" method="GET" action="{{ route('reports.teacher-attendance') }}">
        <div class="grid gap-4 md:grid-cols-[220px_1fr_auto]">
            <div>
                <label class="text-xs font-semibold">Date</label>
                <input type="date" name="report_date" value="{{ $reportDate }}" class="mt-1 w-full rounded border p-2">
            </div>
            <div>
                <label class="text-xs font-semibold">Teachers / employees</label>
                <select required id="teacher-selector" name="RosterPersonIDs[]" multiple class="mt-1 w-full rounded border p-2">
                    @foreach($people as $item)
                        <option value="{{ $item->RosterPersonID }}" {{ $personIds->contains((int) $item->RosterPersonID) ? 'selected' : '' }}>{{ $item->PersonName }} — {{ $item->RoleName }}</option>
                    @endforeach
                </select>
                <p class="mt-1 text-xs text-slate-500">Search and select one or more teachers or employees.</p>
            </div>
            <div class="self-end">
                <button class="rounded-lg bg-indigo-600 px-5 py-2 text-white">View teacher report</button>
                @if($selectedPeople->isNotEmpty())
                    <button type="button" id="teacher-pdf-preview-button" class="ml-2 rounded-lg bg-red-600 px-5 py-2 text-white">Preview / Print PDF</button>
                @endif
            </div>
        </div>
    </form>

    @if($selectedPeople->isNotEmpty())
        <div class="overflow-x-auto rounded-xl border bg-white">
            <table class="w-full table-fixed border-collapse text-sm">
                <thead class="bg-slate-800 text-white">
                    <tr>
                        <th style="width: 150px" class="border-r border-slate-500 px-3 py-3 text-left">Time slot</th>
                        @foreach($selectedPeople as $person)
                            <th style="width: 220px" class="border-r border-slate-500 px-3 py-3 text-left">{{ $person->PersonName }}</th>
                        @endforeach
                    </tr>
                </thead>
                <tbody>
                    @forelse($matrix as $slot)
                        <tr class="border-t align-top">
                            <td class="border-r bg-slate-100 px-3 py-4 font-bold text-slate-800">{{ $slot['Start'] }} - {{ $slot['End'] }}</td>
                            @foreach($selectedPeople as $person)
                                @php($row = $slot['people'][$person->RosterPersonID] ?? null)
                                <td class="border-r p-1 {{ !$row ? 'bg-slate-200 text-center align-middle' : '' }}">
                                    @if(!$row)
                                        <span class="text-xs font-semibold text-slate-600">Not scheduled</span>
                                    @else
                                        @php($colors = match($row['Status']) { 'Present' => 'border-blue-700 bg-blue-200', 'Absent' => 'border-red-700 bg-red-200', 'Proxy' => 'border-amber-700 bg-amber-200', 'No Punch-out' => 'border-orange-700 bg-orange-200', 'Upcoming' => 'border-violet-700 bg-violet-200', 'Running' => 'border-emerald-700 bg-emerald-200', default => 'border-slate-600 bg-slate-200' })
                                        <div class="w-full rounded-lg border-2 {{ $colors }} p-3 text-slate-900">
                                            <div class="font-bold">{{ $row['SubjectName'] ? $row['SubjectCode'].' - '.$row['SubjectName'] : $row['AssignmentType'] }}</div>
                                            <div class="mt-1 text-sm font-medium">Room: {{ $row['LocationName'] ?? '-' }}</div>
                                            <div class="text-xs">{{ $row['BatchName'] ? $row['BatchName'].($row['AcademicSemester'] ? ', Sem '.$row['AcademicSemester'] : '') : '' }}</div>
                                            <div class="mt-3 border-t border-slate-700/30 pt-2 text-sm"><strong>{{ $row['Status'] }}</strong>{{ (float) $row['ShortMinutes'] >= 5 ? ' · '.number_format((float) $row['ShortMinutes'], 2).' min short' : '' }}</div>
                                            <div class="text-xs">In: {{ $row['CheckIn'] ?? '-' }} · Out: {{ $row['CheckOut'] ?? '-' }}</div>
                                            @if($row['Status'] === 'Proxy' && $row['ActualPerson'])
                                                <div class="mt-1 text-xs font-semibold text-amber-900">Proxy: {{ $row['ActualPerson'] }}</div>
                                            @endif
                                            @if((float) ($row['LateMinutes'] ?? 0) >= 5 || (float) ($row['EarlyOutMinutes'] ?? 0) >= 5)
                                                <div class="mt-1 text-xs text-red-800">{{ (float) ($row['LateMinutes'] ?? 0) >= 5 ? 'Late '.number_format((float) $row['LateMinutes'], 2).' min' : '' }}{{ (float) ($row['LateMinutes'] ?? 0) >= 5 && (float) ($row['EarlyOutMinutes'] ?? 0) >= 5 ? ' · ' : '' }}{{ (float) ($row['EarlyOutMinutes'] ?? 0) >= 5 ? 'Early out '.number_format((float) $row['EarlyOutMinutes'], 2).' min' : '' }}</div>
                                            @endif
                                        </div>
                                    @endif
                                </td>
                            @endforeach
                        </tr>
                    @empty
                        <tr><td colspan="{{ $selectedPeople->count() + 1 }}" class="p-10 text-center text-slate-500">No classes or duties are scheduled for the selected people on this date.</td></tr>
                    @endforelse
                </tbody>
            </table>
        </div>

        <div id="teacher-pdf-preview-panel" class="mt-6 hidden overflow-hidden rounded-xl border bg-white">
            <div class="flex items-center justify-between border-b px-4 py-3">
                <h2 class="font-semibold">Teacher-wise PDF Preview</h2>
                <a id="teacher-pdf-open-tab" href="#" target="_blank" class="text-sm font-semibold text-indigo-600">Open / print in new tab</a>
            </div>
            <iframe id="teacher-pdf-preview-frame" title="Teacher-wise attendance PDF preview" class="h-[800px] w-full"></iframe>
        </div>
    @endif
</div>
@endsection

@push('scripts')
    <script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/select2@4.1.0-rc.0/dist/js/select2.min.js"></script>
    <script>
        $(function () {
            $('#teacher-selector').select2({ placeholder: 'Select teachers or employees', width: '100%', closeOnSelect: false });
            $('#teacher-pdf-preview-button').on('click', function () {
                const form = $(this).closest('form')[0];
                const query = new URLSearchParams(new FormData(form)).toString();
                const url = '{{ route('reports.teacher-attendance.pdf') }}' + '?' + query;
                $('#teacher-pdf-preview-frame').attr('src', url);
                $('#teacher-pdf-open-tab').attr('href', url);
                $('#teacher-pdf-preview-panel').removeClass('hidden')[0].scrollIntoView({ behavior: 'smooth', block: 'start' });
            });
        });
    </script>
@endpush
