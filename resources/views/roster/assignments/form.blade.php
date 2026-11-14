@extends('layouts.master')
@push('styles')
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/select2@4.1.0-rc.0/dist/css/select2.min.css">
<style>.select2-container { width: 100% !important; }.select2-container--default .select2-selection--single { min-height: 42px; border-color: #cbd5e1; border-radius: .375rem; padding: 6px; }.select2-container--default .select2-selection__arrow { height: 40px; }</style>
@endpush
@section('content')
<div class="max-w-4xl space-y-6">
    <div class="flex justify-between"><div><h1 class="text-2xl font-bold">{{ $assignment ? 'Edit' : 'Add' }} Roster Duty</h1><p class="text-sm text-slate-500">Class Duty uses an exact timetable time. General and security duties use a shift template.</p></div><a href="{{ route('roster.assignments.index') }}" class="rounded-lg bg-slate-700 px-4 py-2 text-white">Back</a></div>
    @if($errors->any())<div class="rounded border border-red-200 bg-red-50 p-4 text-red-700"><ul class="list-disc pl-5">@foreach($errors->all() as $error)<li>{{ $error }}</li>@endforeach</ul></div>@endif
    @php($savedWeekdays = old('Weekdays', $assignment?->Weekdays ? json_decode($assignment->Weekdays, true) : []))
    <form method="POST" action="{{ $assignment ? route('roster.assignments.update',$assignment->RosterAssignmentID) : route('roster.assignments.store') }}" class="rounded-xl border bg-white p-6">
        @csrf @if($assignment) @method('PUT') @endif
        <div class="grid gap-5 md:grid-cols-2">
            <div><label>Start date *</label><input required type="date" name="RosterDate" value="{{ old('RosterDate',$assignment?->SeriesStartDate ?? $assignment?->RosterDate ?? now()->toDateString()) }}" class="mt-1 w-full rounded border p-2"></div>
            <div><label>Duty type *</label><select id="assignment-type" name="AssignmentType" class="mt-1 w-full rounded border p-2">@foreach(['General Duty','Class Duty','Makeup Class','Rescheduled Class','Exam Duty','Other'] as $type)<option value="{{ $type }}" @selected(old('AssignmentType',$assignment?->AssignmentType ?? 'General Duty') === $type)>{{ $type }}</option>@endforeach</select></div>
            <div><label>Repeat</label><select name="RepeatMode" class="mt-1 w-full rounded border p-2">@foreach(['Once' => 'Once only', 'Daily' => 'Every day in date range', 'Weekly' => 'Selected weekdays in date range'] as $value => $label)<option value="{{ $value }}" @selected(old('RepeatMode',$assignment?->RepeatMode ?? 'Once') === $value)>{{ $label }}</option>@endforeach</select></div>
            <div><label>End date</label><input type="date" name="EndDate" value="{{ old('EndDate',$assignment?->SeriesEndDate ?? $assignment?->RosterDate) }}" class="mt-1 w-full rounded border p-2"></div>
            <div class="md:col-span-2"><label>Weekly weekdays</label><div class="mt-2 flex flex-wrap gap-3">@foreach(['Sun','Mon','Tue','Wed','Thu','Fri','Sat'] as $i => $day)<label class="rounded border px-3 py-2"><input type="checkbox" name="Weekdays[]" value="{{ $i }}" @checked(in_array($i, $savedWeekdays))> {{ $day }}</label>@endforeach</div>@if($assignment)<p class="mt-2 text-xs text-slate-500">Saving a repeated routine updates every date in that routine. Older one-day duties are shown as “Once only”.</p>@endif</div>
            <div id="academic-section" class="md:col-span-2 rounded-lg border border-indigo-100 bg-indigo-50 p-4">
                <div class="mb-3 text-sm font-semibold text-indigo-900">Academic details — required for Class, Makeup, and Rescheduled Class</div>
                <div class="grid gap-5 md:grid-cols-3">
                    <div>
                        <label>Department</label>
                        <select id="department-id" name="DepartmentID" class="mt-1 w-full rounded border p-2">
                            <option value="">Select department</option>
                            @foreach($departments as $department)<option value="{{ $department->DepartmentID }}" @selected(old('DepartmentID',$assignment?->DepartmentID) == $department->DepartmentID)>{{ $department->DepartmentName }}</option>@endforeach
                        </select>
                    </div>
                    <div>
                        <label>Batch / session / semester</label>
                        <select id="batch-id" name="BatchID" class="mt-1 w-full rounded border p-2" disabled>
                            <option value="">Select department first</option>
                            @foreach($batches as $batch)<option value="{{ $batch->BatchID }}" data-department-id="{{ $batch->DepartmentID }}" @selected(old('BatchID',$assignment?->BatchID) == $batch->BatchID)>{{ $batch->BatchName }} — {{ $batch->Session }}, Sem {{ $batch->Semester }}</option>@endforeach
                        </select>
                    </div>
                    <div>
                        <label>Subject</label>
                        <select id="subject-id" name="SubjectID" class="select2-subject mt-1 w-full rounded border p-2" disabled>
                            <option value="">Search subject by code or name</option>
                            @foreach($subjects as $subject)<option value="{{ $subject->SubjectID }}" data-department-id="{{ $subject->DepartmentID }}" @selected(old('SubjectID',$assignment?->SubjectID) == $subject->SubjectID)>{{ $subject->Code }} — {{ $subject->SubjectName }}</option>@endforeach
                        </select>
                    </div>
                </div>
                <p class="mt-3 text-xs text-indigo-700">Select a department first. Only its batches and subjects will be shown.</p>
            </div>
            <div id="exact-time-section" class="md:col-span-2 rounded-lg border border-emerald-100 bg-emerald-50 p-4"><div class="mb-3 text-sm font-semibold text-emerald-900">Exact class / exam time — required for Class, Makeup, Rescheduled, and Exam Duty</div><div class="grid gap-5 md:grid-cols-2"><div><label>Start time</label><input type="time" name="CustomStartTime" value="{{ old('CustomStartTime',$assignment ? \Carbon\Carbon::parse($assignment->StartTime)->format('H:i') : '') }}" class="mt-1 w-full rounded border p-2"></div><div><label>End time</label><input type="time" name="CustomEndTime" value="{{ old('CustomEndTime',$assignment ? \Carbon\Carbon::parse($assignment->EndTime)->format('H:i') : '') }}" class="mt-1 w-full rounded border p-2"></div></div></div>
            <div><label>Faculty *</label><select required name="RosterPersonID" class="select2-teacher mt-1 w-full rounded border p-2"><option value="">Search faculty by name</option>@foreach($people as $person)<option value="{{ $person->RosterPersonID }}" @selected(old('RosterPersonID',$assignment?->RosterPersonID) == $person->RosterPersonID)>{{ $person->PersonName }} — {{ $person->RoleName }}</option>@endforeach</select></div>
            <div><label>Planned proxy faculty</label><select name="ProxyPersonID" class="select2-teacher mt-1 w-full rounded border p-2"><option value="">Search proxy faculty by name</option>@foreach($people as $person)<option value="{{ $person->RosterPersonID }}" @selected(old('ProxyPersonID',$assignment?->ProxyPersonID) == $person->RosterPersonID)>{{ $person->PersonName }}</option>@endforeach</select></div>
            <div id="shift-section"><label>Shift template (General / Other / Security)</label><select name="RosterShiftID" class="mt-1 w-full rounded border p-2"><option value="">Select a shift template</option>@foreach($shifts as $shift)<option value="{{ $shift->RosterShiftID }}" @selected(old('RosterShiftID',$assignment?->RosterShiftID) == $shift->RosterShiftID)>{{ $shift->ShiftName }}</option>@endforeach</select></div>
            <div><label>Room No.</label><select name="RosterLocationID" class="mt-1 w-full rounded border p-2"><option value="">Select room</option>@foreach($locations as $location)<option value="{{ $location->RosterLocationID }}" @selected(old('RosterLocationID',$assignment?->RosterLocationID) == $location->RosterLocationID)>{{ $location->LocationName }}{{ $location->DeviceName ? ' — '.$location->DeviceName : ' — no ZKT device' }}</option>@endforeach</select><p class="mt-1 text-xs text-slate-500">The room’s active ZKT device is assigned automatically. A room is required for classes and exams.</p></div>
            <div><label>Status</label><select name="Status" class="mt-1 w-full rounded border p-2"><option value="Active" @selected(old('Status',$assignment?->Status ?? 'Active') === 'Active')>Active</option><option value="Cancelled" @selected(old('Status',$assignment?->Status) === 'Cancelled')>Cancelled</option><option value="Hold" @selected(old('Status',$assignment?->Status) === 'Hold')>Hold</option></select></div>
            <div class="md:col-span-2"><label>Remarks</label><input name="Remarks" value="{{ old('Remarks',$assignment?->Remarks) }}" class="mt-1 w-full rounded border p-2"></div>
        </div><div class="mt-6 text-right"><button class="rounded-lg bg-green-600 px-5 py-2 text-white">Save roster duty</button></div>
    </form>
</div>
<script>
    const assignmentType = document.getElementById('assignment-type');
    const academicSection = document.getElementById('academic-section');
    const exactTimeSection = document.getElementById('exact-time-section');
    const shiftSection = document.getElementById('shift-section');
    const departmentSelect = document.getElementById('department-id');
    const batchSelect = document.getElementById('batch-id');
    const subjectSelect = document.getElementById('subject-id');

    function filterAcademicOptions(select, placeholder) {
        const departmentId = departmentSelect.value;
        const selectedOption = select.options[select.selectedIndex];
        const selectedDepartment = selectedOption?.dataset?.departmentId;
        select.disabled = !departmentId;
        [...select.options].forEach((option, index) => {
            if (index === 0) return;
            option.hidden = option.dataset.departmentId !== departmentId;
            option.disabled = option.dataset.departmentId !== departmentId;
        });
        select.options[0].text = departmentId ? placeholder : 'Select department first';
        if (!departmentId || selectedDepartment !== departmentId) select.value = '';
        if (window.jQuery && select.classList.contains('select2-subject')) window.jQuery(select).trigger('change.select2');
    }

    function updateAcademicFields() {
        filterAcademicOptions(batchSelect, 'Select batch');
        filterAcademicOptions(subjectSelect, 'Select subject');
    }
    function updateDutyFields() {
        const academic = ['Class Duty', 'Makeup Class', 'Rescheduled Class', 'Exam Duty'].includes(assignmentType.value);
        academicSection.classList.toggle('hidden', !academic);
        exactTimeSection.classList.toggle('hidden', !academic);
        shiftSection.classList.toggle('hidden', academic);
    }
    assignmentType.addEventListener('change', updateDutyFields);
    departmentSelect.addEventListener('change', updateAcademicFields);
    updateDutyFields();
    updateAcademicFields();
</script>
@endsection
@push('scripts')
<script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/select2@4.1.0-rc.0/dist/js/select2.min.js"></script>
<script>$(function () { $('#subject-id').select2({ placeholder: 'Search subject by code or name', width: '100%' }); $('.select2-teacher').select2({ placeholder: 'Search faculty by name', width: '100%' }); });</script>
@endpush
