@extends('layouts.master')

@section('content')

<div class="max-w-5xl mx-auto">

    <div class="bg-white rounded-xl shadow-lg overflow-hidden">

        <!-- Header -->
        <div class="bg-slate-800 text-white px-6 py-4 flex items-center justify-between">

            <h2 class="text-xl font-semibold">
                Edit Batch
            </h2>

            <a href="{{ route('batches.index') }}"
               class="px-5 py-2 bg-red-500 rounded-lg hover:bg-red-600">
                Back
            </a>

        </div>

        @if ($errors->any())

            <div class="m-6 rounded-lg border border-red-300 bg-red-50 p-4">

                <ul class="list-disc ml-5 text-red-600">

                    @foreach ($errors->all() as $error)

                        <li>{{ $error }}</li>

                    @endforeach

                </ul>

            </div>

        @endif

        <form action="{{ route('batches.update', $batch->BatchID) }}"
              method="POST">

            @csrf
            @method('PUT')

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
                            value="{{ old('BatchName', $batch->BatchName) }}"
                            required
                            class="w-full border rounded-lg px-4 py-2">

                    </div>

                    <!-- Session -->
                    <div>

                        <label class="block font-semibold mb-2">
                            Session
                        </label>

                        <input
                            type="text"
                            name="Session"
                            value="{{ old('Session', $batch->Session) }}"
                            required
                            class="w-full border rounded-lg px-4 py-2">

                    </div>

                    <!-- Semester -->
                    <div>

                        <label class="block font-semibold mb-2">
                            Semester
                        </label>

                        <select
                            name="Semester"
                            required
                            class="w-full border rounded-lg px-4 py-2">

                            <option value="">Select Semester</option>

                            @for($i = 1; $i <= 12; $i++)

                                <option
                                    value="{{ $i }}"
                                    {{ old('Semester', $batch->Semester) == $i ? 'selected' : '' }}>

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
                            class="w-full border rounded-lg px-4 py-2">

                            <option value="1"
                                {{ old('Status', $batch->Status) == 1 ? 'selected' : '' }}>
                                Active
                            </option>

                            <option value="0"
                                {{ old('Status', $batch->Status) == 0 ? 'selected' : '' }}>
                                Inactive
                            </option>

                        </select>

                    </div>
                    </div>

                </div>

                <!-- Buttons -->
                <div class="flex justify-end gap-3 mt-8 border-t pt-6">

                    <a href="{{ route('batches.index') }}"
                       class="px-6 py-2 bg-gray-500 text-white rounded-lg hover:bg-gray-600">

                        Cancel

                    </a>

                    <button
                        type="submit"
                        class="px-6 py-2 bg-blue-600 text-white rounded-lg hover:bg-blue-700">

                        Update Batch

                    </button>

                </div>

            </div>

        </form>

    </div>

</div>

@endsection