@extends('layouts.master')

@section('content')
<div class="max-w-3xl space-y-6">
    <div>
        <h1 class="text-2xl font-bold text-slate-800">Attendance Settings</h1>
        <p class="text-sm text-slate-500">These global grace times apply to every routine and report.</p>
    </div>

    @if(session('success'))
        <div class="rounded-lg border border-green-200 bg-green-50 px-4 py-3 text-sm text-green-700">{{ session('success') }}</div>
    @endif

    <form method="POST" action="{{ route('attendance-settings.update') }}" class="rounded-xl border border-slate-200 bg-white p-6 shadow">
        @csrf
        @method('PUT')
        <div class="grid gap-5 sm:grid-cols-2">
            @foreach ([
                'EntryEarlyMinutes' => ['Entry before class', 'Minutes allowed before scheduled start'],
                'EntryLateMinutes' => ['Entry after class starts', 'Minutes allowed after scheduled start'],
                'ExitEarlyMinutes' => ['Exit before class ends', 'Minutes allowed before scheduled end'],
                'ExitLateMinutes' => ['Exit after class ends', 'Minutes allowed after scheduled end'],
            ] as $field => [$label, $help])
                <div>
                    <label class="mb-1 block font-semibold text-slate-700">{{ $label }}</label>
                    <input type="number" min="0" max="120" name="{{ $field }}" value="{{ old($field, $settings->$field) }}" class="w-full rounded-lg border border-slate-300 px-4 py-2" required>
                    <p class="mt-1 text-xs text-slate-500">{{ $help }}</p>
                    @error($field)<p class="mt-1 text-xs text-red-600">{{ $message }}</p>@enderror
                </div>
            @endforeach
        </div>
        <button class="mt-6 rounded-lg bg-indigo-600 px-5 py-2.5 font-semibold text-white hover:bg-indigo-700">Save global settings</button>
    </form>
</div>
@endsection
