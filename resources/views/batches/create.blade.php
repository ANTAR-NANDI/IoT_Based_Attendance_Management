@extends('layouts.master')

@section('content')

<div class="max-w-5xl mx-auto">

    <!-- Header -->
    <div class="flex items-center justify-between mb-6">

        <div>
            <h1 class="text-3xl font-bold text-slate-800">
                Add Batch
            </h1>

            <p class="text-slate-500 mt-1">
                Create a new batch
            </p>
        </div>

        <a href="{{ route('batches.index') }}"
           class="px-5 py-2 rounded-lg bg-slate-700 text-white hover:bg-slate-800">

            ← Back

        </a>

    </div>

    <!-- Validation -->
    @if ($errors->any())

        <div class="mb-6 rounded-lg border border-red-300 bg-red-50 p-4">

            <ul class="list-disc ml-5 text-red-600">

                @foreach ($errors->all() as $error)

                    <li>{{ $error }}</li>

                @endforeach

            </ul>

        </div>

    @endif

    <form action="{{ route('batches.store') }}" method="POST">

        @csrf

        <div class="bg-white rounded-xl shadow-lg overflow-hidden">

            <div class="bg-slate-800 text-white px-6 py-4">

                <h2 class="text-lg font-semibold">
                    Batch Information
                </h2>

            </div>

            <div class="p-8">

                <div class="grid grid-cols-1 md:grid-cols-2 gap-6">

                    <!-- Batch Name -->
                    <div>

                        <label class="block font-semibold mb-2">
                            Batch Name
                        </label>

                        <input
                            type="text"
                            name="BatchName"
                            value="{{ old('BatchName') }}"
                            required
                            class="w-full border rounded-lg px-4 py-2 focus:ring-2 focus:ring-indigo-500">

                    </div>

                    <!-- Session -->
                    <div>

                        <label class="block font-semibold mb-2">
                            Session
                        </label>

                        <input
                            type="text"
                            name="Session"
                            value="{{ old('Session') }}"
                            placeholder="2025-2026"
                            required
                            class="w-full border rounded-lg px-4 py-2 focus:ring-2 focus:ring-indigo-500">

                    </div>

                    <!-- Semester -->
                    <div>

                        <label class="block font-semibold mb-2">
                            Semester
                        </label>

                        <select
                            name="Semester"
                            required
                            class="w-full border rounded-lg px-4 py-2 focus:ring-2 focus:ring-indigo-500">

                            <option value="">Select Semester</option>

                            @for($i=1;$i<=12;$i++)
                                <option value="{{ $i }}" {{ old('Semester')==$i ? 'selected' : '' }}>
                                    Semester {{ $i }}
                                </option>
                            @endfor

                        </select>

                    </div>

                    <!-- Status -->
                    <div>

                        <label class="block font-semibold mb-2">
                            Status
                        </label>

                        <select
                            name="Status"
                            class="w-full border rounded-lg px-4 py-2 focus:ring-2 focus:ring-indigo-500">

                            <option value="1" selected>
                                Active
                            </option>

                            <option value="0">
                                Inactive
                            </option>

                        </select>

                    </div>
                </div>

            </div>

        </div>

        <!-- Buttons -->
        <div class="flex justify-end gap-3 mt-8">

            <a href="{{ route('batches.index') }}"
               class="px-6 py-2 bg-gray-500 text-white rounded-lg hover:bg-gray-600">

                Cancel

            </a>

            <button
                type="reset"
                class="px-6 py-2 bg-yellow-500 text-white rounded-lg hover:bg-yellow-600">

                Reset

            </button>

            <button
                type="submit"
                class="px-6 py-2 bg-green-600 text-white rounded-lg hover:bg-green-700">

                Save Batch

            </button>

        </div>

    </form>

</div>

@endsection