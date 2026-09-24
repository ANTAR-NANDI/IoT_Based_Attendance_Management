@extends('layouts.master')
@section('content')
<div class="max-w-4xl space-y-6">
    <div class="flex justify-between"><div><h1 class="text-2xl font-bold">{{ $assignment ? 'Edit' : 'Add' }} Roster Duty</h1><p class="text-sm text-slate-500">Class Duty uses an exact timetable time. General and security duties use a shift template.</p></div><a href="{{ route('roster.assignments.index') }}" class="rounded-lg bg-slate-700 px-4 py-2 text-white">Back</a></div>
    @if($errors->any())<div class="rounded border border-red-200 bg-red-50 p-4 text-red-700"><ul class="list-disc pl-5">@foreach($errors->all() as $error)<li>{{ $error }}</li>@endforeach</ul></div>@endif
    <form method="POST" action="{{ $assignment ? route('roster.assignments.update',$assignment->RosterAssignmentID) : route('roster.assignments.store') }}" class="rounded-xl border bg-white p-6">
        @csrf @if($assignment) @method('PUT') @endif
        <div class="grid gap-5 md:grid-cols-2">
            <div><label>Start date *</label><input required type="date" name="RosterDate" value="{{ old('RosterDate',$assignment?->RosterDate ?? now()->toDateString()) }}" class="mt-1 w-full rounded border p-2"></div>
            <div><label>Duty type *</label><select id="assignment-type" name="AssignmentType" class="mt-1 w-full rounded border p-2">@foreach(['General Duty','Class Duty','Exam Duty','Other'] as $type)<option value="{{ $type }}" @selected(old('AssignmentType',$assignment?->AssignmentType ?? 'General Duty') === $type)>{{ $type }}</option>@endforeach</select></div>
            @if(!$assignment)
            <div><label>Repeat</label><select name="RepeatMode" class="mt-1 w-full rounded border p-2"><option value="Once">Once only</option><option value="Daily">Every day in date range</option><option value="Weekly">Selected weekdays in date range</option></select></div>
            <div><label>End date</label><input type="date" name="EndDate" value="{{ old('EndDate') }}" class="mt-1 w-full rounded border p-2"></div>
            <div class="md:col-span-2"><label>Weekly weekdays</label><div class="mt-2 flex flex-wrap gap-3">@foreach(['Sun','Mon','Tue','Wed','Thu','Fri','Sat'] as $i => $day)<label class="rounded border px-3 py-2"><input type="checkbox" name="Weekdays[]" value="{{ $i }}" @checked(in_array($i, old('Weekdays', [])))> {{ $day }}</label>@endforeach</div></div>
            @endif
            <div id="academic-section" class="md:col-span-2 rounded-lg border border-indigo-100 bg-indigo-50 p-4"><div class="mb-3 text-sm font-semibold text-indigo-900">Academic details — required for Class Duty; optional for Exam Duty</div><div class="grid gap-5 md:grid-cols-3"><div><label>Department</label><select name="DepartmentID" class="mt-1 w-full rounded border p-2"><option value="">Select department</option>@foreach($departments as $department)<option value="{{ $department->DepartmentID }}" @selected(old('DepartmentID',$assignment?->DepartmentID) == $department->DepartmentID)>{{ $department->DepartmentName }}</option>@endforeach</select></div><div><label>Batch / session / semester</label><select name="BatchID" class="mt-1 w-full rounded border p-2"><option value="">Select batch</option>@foreach($batches as $batch)<option value="{{ $batch->BatchID }}" @selected(old('BatchID',$assignment?->BatchID) == $batch->BatchID)>{{ $batch->BatchName }} — {{ $batch->Session }}, Sem {{ $batch->Semester }}</option>@endforeach</select></div><div><label>Subject</label><select name="SubjectID" class="mt-1 w-full rounded border p-2"><option value="">Select subject</option>@foreach($subjects as $subject)<option value="{{ $subject->SubjectID }}" @selected(old('SubjectID',$assignment?->SubjectID) == $subject->SubjectID)>{{ $subject->Code }} — {{ $subject->SubjectName }}</option>@endforeach</select></div></div></div>
            <div id="exact-time-section" class="md:col-span-2 rounded-lg border border-emerald-100 bg-emerald-50 p-4"><div class="mb-3 text-sm font-semibold text-emerald-900">Exact class / exam time — required for Class and Exam Duty</div><div class="grid gap-5 md:grid-cols-2"><div><label>Start time</label><input type="time" name="CustomStartTime" value="{{ old('CustomStartTime',$assignment ? \Carbon\Carbon::parse($assignment->StartTime)->format('H:i') : '') }}" class="mt-1 w-full rounded border p-2"></div><div><label>End time</label><input type="time" name="CustomEndTime" value="{{ old('CustomEndTime',$assignment ? \Carbon\Carbon::parse($assignment->EndTime)->format('H:i') : '') }}" class="mt-1 w-full rounded border p-2"></div></div></div>
            <div><label>Employee *</label><select required name="RosterPersonID" class="mt-1 w-full rounded border p-2"><option value="">Select employee</option>@foreach($people as $person)<option value="{{ $person->RosterPersonID }}" @selected(old('RosterPersonID',$assignment?->RosterPersonID) == $person->RosterPersonID)>{{ $person->PersonName }} — {{ $person->RoleName }}</option>@endforeach</select></div>
            <div><label>Planned proxy</label><select name="ProxyPersonID" class="mt-1 w-full rounded border p-2"><option value="">No planned proxy</option>@foreach($people as $person)<option value="{{ $person->RosterPersonID }}" @selected(old('ProxyPersonID',$assignment?->ProxyPersonID) == $person->RosterPersonID)>{{ $person->PersonName }}</option>@endforeach</select></div>
            <div id="shift-section"><label>Shift template (General / Other / Security)</label><select name="RosterShiftID" class="mt-1 w-full rounded border p-2"><option value="">Select a shift template</option>@foreach($shifts as $shift)<option value="{{ $shift->RosterShiftID }}" @selected(old('RosterShiftID',$assignment?->RosterShiftID) == $shift->RosterShiftID)>{{ $shift->ShiftName }}</option>@endforeach</select></div>
            <div><label>Duty post</label><select name="RosterLocationID" class="mt-1 w-full rounded border p-2"><option value="">No duty post</option>@foreach($locations as $location)<option value="{{ $location->RosterLocationID }}" @selected(old('RosterLocationID',$assignment?->RosterLocationID) == $location->RosterLocationID)>{{ $location->LocationName }}</option>@endforeach</select></div>
            <div><label>ZKT device</label><select name="DeviceID" class="mt-1 w-full rounded border p-2"><option value="">No device</option>@foreach($devices as $device)<option value="{{ $device->DeviceID }}" @selected(old('DeviceID',$assignment?->DeviceID) == $device->DeviceID)>{{ $device->DeviceName }}</option>@endforeach</select></div>
            <div><label>Status</label><select name="Status" class="mt-1 w-full rounded border p-2"><option value="Active" @selected(old('Status',$assignment?->Status ?? 'Active') === 'Active')>Active</option><option value="Cancelled" @selected(old('Status',$assignment?->Status) === 'Cancelled')>Cancelled</option></select></div>
            <div class="md:col-span-2"><label>Remarks</label><input name="Remarks" value="{{ old('Remarks',$assignment?->Remarks) }}" class="mt-1 w-full rounded border p-2"></div>
        </div><div class="mt-6 text-right"><button class="rounded-lg bg-green-600 px-5 py-2 text-white">Save roster duty</button></div>
    </form>
</div>
<script>
    const assignmentType = document.getElementById('assignment-type');
    const academicSection = document.getElementById('academic-section');
    const exactTimeSection = document.getElementById('exact-time-section');
    const shiftSection = document.getElementById('shift-section');
    function updateDutyFields() {
        const academic = ['Class Duty', 'Exam Duty'].includes(assignmentType.value);
        academicSection.classList.toggle('hidden', !academic);
        exactTimeSection.classList.toggle('hidden', !academic);
        shiftSection.classList.toggle('hidden', academic);
    }
    assignmentType.addEventListener('change', updateDutyFields);
    updateDutyFields();
</script>
@endsection
