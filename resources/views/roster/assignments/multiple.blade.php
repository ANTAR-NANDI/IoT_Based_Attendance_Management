@extends('layouts.master')
@push('styles')
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/select2@4.1.0-rc.0/dist/css/select2.min.css">
<style>.select2-container { width: 100% !important; }.select2-container--default .select2-selection--single { min-height: 42px; border-color: #cbd5e1; border-radius: .375rem; padding: 6px; }.select2-container--default .select2-selection__arrow { height: 40px; }</style>
@endpush
@section('content')
@php($rows = old('RoutineRows', [[]]))
<div class="mx-auto max-w-7xl space-y-6">
    <div class="flex justify-between"><div><h1 class="text-2xl font-bold">Add multiple class routines</h1><p class="text-sm text-slate-500">Add every room, subject, teacher, proxy teacher, and time slot in one save.</p></div><a href="{{ route('roster.assignments.index') }}" class="rounded-lg bg-slate-700 px-4 py-2 text-white">Back</a></div>
    @if($errors->any())<div class="rounded border border-red-200 bg-red-50 p-4 text-red-700"><ul class="list-disc pl-5">@foreach($errors->all() as $error)<li>{{ $error }}</li>@endforeach</ul></div>@endif
    <form method="POST" action="{{ route('roster.assignments.store-multiple') }}" class="overflow-hidden rounded-xl border bg-white">@csrf
        <div class="bg-slate-800 px-6 py-4 font-semibold text-white">Settings shared by every class row in this time slot</div>
        <div class="grid gap-5 p-6 md:grid-cols-2 lg:grid-cols-4">
            <div><label>Start date *</label><input required type="date" name="RosterDate" value="{{ old('RosterDate',now()->toDateString()) }}" class="mt-1 w-full rounded border p-2"></div>
            <div><label>Repeat</label><select name="RepeatMode" class="mt-1 w-full rounded border p-2">@foreach(['Once' => 'Once only', 'Daily' => 'Every day in date range', 'Weekly' => 'Selected weekdays in date range'] as $value => $label)<option value="{{ $value }}" @selected(old('RepeatMode','Once') === $value)>{{ $label }}</option>@endforeach</select></div>
            <div><label>End date</label><input type="date" name="EndDate" value="{{ old('EndDate') }}" class="mt-1 w-full rounded border p-2"></div>
            <div><label>Status</label><select name="Status" class="mt-1 w-full rounded border p-2"><option value="Active" @selected(old('Status','Active') === 'Active')>Active</option><option value="Hold" @selected(old('Status') === 'Hold')>Hold</option><option value="Cancelled" @selected(old('Status') === 'Cancelled')>Cancelled</option></select></div>
            <div><label>Start time *</label><input required type="time" name="StartTime" value="{{ old('StartTime') }}" class="mt-1 w-full rounded border p-2"></div>
            <div><label>End time *</label><input required type="time" name="EndTime" value="{{ old('EndTime') }}" class="mt-1 w-full rounded border p-2"></div>
            <div class="lg:col-span-4"><label>Weekly weekdays</label><div class="mt-2 flex flex-wrap gap-3">@foreach(['Sun','Mon','Tue','Wed','Thu','Fri','Sat'] as $i => $day)<label class="rounded border px-3 py-2"><input type="checkbox" name="Weekdays[]" value="{{ $i }}" @checked(in_array($i, old('Weekdays', [])))> {{ $day }}</label>@endforeach</div></div>
        </div>
        <div class="flex items-center justify-between border-y bg-slate-50 px-6 py-4"><div><h2 class="font-semibold">Class entries</h2><p class="text-sm text-slate-500">Add each room running in the shared time slot as a separate row.</p></div><button id="add-row" type="button" class="rounded bg-indigo-600 px-4 py-2 text-white">+ Add class row</button></div>
        <div id="routine-rows" class="space-y-5 p-6">@foreach($rows as $index => $row)@include('roster.assignments.multiple-row', ['index' => $index, 'row' => $row])@endforeach</div>
        <div class="border-t p-5 text-right"><button class="rounded-lg bg-green-600 px-5 py-2 text-white">Save all class routines</button></div>
    </form>
</div>
<template id="row-template">@include('roster.assignments.multiple-row', ['index' => '__INDEX__', 'row' => []])</template>
<script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/select2@4.1.0-rc.0/dist/js/select2.min.js"></script>
<script>
const container = document.getElementById('routine-rows'), template = document.getElementById('row-template'); let nextIndex = {{ count($rows) }};
function initialiseSearchFields(scope = document) { $(scope).find('.select2-subject').select2({ placeholder: 'Search subject by code or name', width: '100%' }); $(scope).find('.select2-teacher').select2({ placeholder: 'Search teacher by name', width: '100%' }); }
function filterRow(row) { const department = row.querySelector('.department').value; row.querySelectorAll('.filtered-option').forEach(option => { const matches = option.dataset.departmentId === department; option.hidden = !matches; option.disabled = !matches; }); row.querySelectorAll('.batch, .subject').forEach(select => { if (select.selectedOptions[0]?.dataset.departmentId !== department) select.value = ''; select.disabled = !department; if (select.classList.contains('select2-subject')) $(select).trigger('change.select2'); }); }
document.getElementById('add-row').addEventListener('click', () => { container.insertAdjacentHTML('beforeend', template.innerHTML.replaceAll('__INDEX__', nextIndex++)); const row = container.lastElementChild; filterRow(row); initialiseSearchFields(row); });
container.addEventListener('change', event => { const row = event.target.closest('.routine-row'); if (row && event.target.matches('.department')) filterRow(row); });
container.addEventListener('click', event => { if (event.target.matches('.remove-row') && container.querySelectorAll('.routine-row').length > 1) { const row = event.target.closest('.routine-row'); $(row).find('.select2-subject, .select2-teacher').select2('destroy'); row.remove(); } });
container.querySelectorAll('.routine-row').forEach(row => { filterRow(row); });
initialiseSearchFields();
</script>
@endsection
