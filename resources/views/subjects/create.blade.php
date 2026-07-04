@extends('layouts.master')

@section('content')

<div class="max-w-5xl mx-auto">

    <!-- Header -->
    <div class="flex items-center justify-between mb-6">

        <div>
            <h1 class="text-3xl font-bold text-slate-800">
                Add Subject
            </h1>

            <p class="text-slate-500 mt-1">
                Create a new subject
            </p>
        </div>

        <a href="{{ route('subjects.index') }}"
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

    <form action="{{ route('subjects.store') }}" method="POST">

        @csrf

        <div class="bg-white rounded-xl shadow-lg overflow-hidden">

            <div class="bg-slate-800 text-white px-6 py-4">

                <h2 class="text-lg font-semibold">
                    Subject Information
                </h2>

            </div>

            <div class="p-8">

                <div class="grid grid-cols-1 md:grid-cols-2 gap-6">

                    <!-- Subject Code -->
                    <div>

                        <label class="block font-semibold mb-2">
                            Subject Code
                        </label>

                        <input
                            type="text"
                            name="Code"
                            value="{{ old('Code') }}"
                            required
                            class="w-full border rounded-lg px-4 py-2 focus:ring-2 focus:ring-indigo-500">

                    </div>

                    <!-- Department -->
                    <div>

                        <label class="block font-semibold mb-2">
                            Department
                        </label>

                        <select
                            name="DepartmentID"
                            required
                            class="w-full border rounded-lg px-4 py-2 focus:ring-2 focus:ring-indigo-500">

                            <option value="">
                                Select Department
                            </option>

                            @foreach($departments as $department)

                                <option
                                    value="{{ $department->DepartmentID }}"
                                    {{ old('DepartmentID') == $department->DepartmentID ? 'selected' : '' }}>

                                    {{ $department->DepartmentName }}

                                </option>

                            @endforeach

                        </select>

                    </div>

                    <!-- Subject Name -->
                    <div class="md:col-span-2">

                        <label class="block font-semibold mb-2">
                            Subject Name
                        </label>

                        <input
                            type="text"
                            name="SubjectName"
                            value="{{ old('SubjectName') }}"
                            required
                            class="w-full border rounded-lg px-4 py-2 focus:ring-2 focus:ring-indigo-500">

                    </div>

                </div>

            </div>

        </div>

        <!-- Buttons -->
        <div class="flex justify-end gap-3 mt-8">

            <a href="{{ route('subjects.index') }}"
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

                Save Subject

            </button>

        </div>

    </form>

</div>

@endsection