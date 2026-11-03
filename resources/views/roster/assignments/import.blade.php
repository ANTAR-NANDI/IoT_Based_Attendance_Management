@extends('layouts.master')

@section('content')
<div class="mx-auto max-w-4xl space-y-6">
    <div class="flex justify-between"><div><h1 class="text-2xl font-bold">Import class routine</h1><p class="text-sm text-slate-500">Choose the routine period, then upload the completed Excel sheet.</p></div><a href="{{ route('roster.assignments.index') }}" class="rounded bg-slate-700 px-4 py-2 text-white">Back</a></div>
    @if($errors->any())<div class="rounded border border-red-200 bg-red-50 p-4 text-red-700"><ul class="list-disc pl-5">@foreach($errors->all() as $error)<li>{{ $error }}</li>@endforeach</ul></div>@endif
    <div class="rounded-xl border bg-white p-6"><a href="{{ route('roster.assignments.import.template', ['v' => filemtime(public_path('templates/routine-import-template.xlsx'))]) }}" class="inline-flex rounded bg-indigo-600 px-4 py-2 text-white">Download Excel template</a><p class="mt-3 text-sm text-slate-600">Required Excel columns: Day, In Time, Out Time, Subject Code, Teacher Code, Room Number. Teacher Name and Teacher Short Name are for reference only. Level, Term, Section, and Remarks are optional.</p></div>
    <form method="POST" action="{{ route('roster.assignments.import.store') }}" enctype="multipart/form-data" class="rounded-xl border bg-white p-6">
        @csrf
        <div class="grid gap-5 md:grid-cols-2">
            <div><label>Department *</label><select required id="department" name="DepartmentID" class="mt-1 w-full rounded border p-2"><option value="">Select department</option>@foreach($departments as $department)<option value="{{ $department->DepartmentID }}" @selected(old('DepartmentID') == $department->DepartmentID)>{{ $department->DepartmentName }}</option>@endforeach</select></div>
            <div><label>Session *</label><select required id="session" name="SessionFilter" class="mt-1 w-full rounded border p-2"><option value="">Select session</option>@foreach($sessions as $session)<option value="{{ $session }}" @selected(old('SessionFilter') == $session)>{{ $session }}</option>@endforeach</select></div>
            <div class="md:col-span-2"><label>Batch *</label><select required id="batch" name="BatchID" class="mt-1 w-full rounded border p-2"><option value="">Select department and session first</option>@foreach($batches as $batch)<option value="{{ $batch->BatchID }}" data-department="{{ $batch->DepartmentID }}" data-session="{{ $batch->Session }}" @selected(old('BatchID') == $batch->BatchID)>{{ $batch->BatchName }} ({{ $batch->Semester }})</option>@endforeach</select></div>
            <div><label>From date *</label><input required type="date" name="StartDate" value="{{ old('StartDate') }}" class="mt-1 w-full rounded border p-2"></div>
            <div><label>To date *</label><input required type="date" name="EndDate" value="{{ old('EndDate') }}" class="mt-1 w-full rounded border p-2"></div>
            <div class="md:col-span-2"><label>Routine Excel file *</label><input required type="file" name="routine_file" accept=".xlsx,.csv" class="mt-1 w-full rounded border p-2"><p class="mt-1 text-xs text-slate-500">Maximum 5 MB. The system validates every row before adding any routine record.</p></div>
        </div>
        <div class="mt-6 text-right"><button class="rounded bg-green-600 px-5 py-2 text-white">Validate and import routine</button></div>
    </form>
</div>
<script>
const department = document.getElementById('department');
const session = document.getElementById('session');
const batch = document.getElementById('batch');
function filterBatches() {
    const departmentId = department.value;
    const sessionValue = session.value;
    [...batch.options].forEach((option, index) => {
        if (!index) return;
        const show = option.dataset.department === departmentId && option.dataset.session === sessionValue;
        option.hidden = !show;
        option.disabled = !show;
    });
    if (batch.selectedOptions[0]?.hidden) batch.value = '';
    batch.options[0].text = departmentId && sessionValue ? 'Select batch' : 'Select department and session first';
}
department.addEventListener('change', filterBatches);
session.addEventListener('change', filterBatches);
filterBatches();
</script>
@endsection
