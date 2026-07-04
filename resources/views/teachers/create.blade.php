@extends('layouts.master')

@section('content')

<div class="max-w-6xl mx-auto">

    <!-- Header -->
    <div class="flex items-center justify-between mb-6">

        <div>
            <h1 class="text-3xl font-bold text-slate-800">
                Add Teacher
            </h1>

            <p class="text-slate-500">
                Create a new teacher profile
            </p>
        </div>

        <a href="{{ route('teachers.index') }}"
           class="px-5 py-2 rounded-lg bg-slate-700 text-white hover:bg-slate-800">
            ← Back
        </a>

    </div>

    @if ($errors->any())
        <div class="mb-6 rounded-lg border border-red-300 bg-red-50 p-4">
            <ul class="list-disc ml-5 text-red-600">
                @foreach ($errors->all() as $error)
                    <li>{{ $error }}</li>
                @endforeach
            </ul>
        </div>
    @endif

    <form action="{{ route('teachers.store') }}" method="POST">

        @csrf

        <div class="bg-white rounded-xl shadow-lg overflow-hidden">

            <div class="bg-slate-800 px-6 py-4 text-white">
                <h2 class="text-lg font-semibold">
                    Teacher Information
                </h2>
            </div>

            <div class="p-8">

                <div class="grid grid-cols-1 md:grid-cols-2 gap-6">

                    <!-- Employee ID -->
                    <div>
                        <label class="block mb-2 font-semibold">
                            Employee ID
                        </label>

                        <input
                            type="text"
                            name="EmployeeID"
                            value="{{ old('EmployeeID') }}"
                            required
                            class="w-full border rounded-lg px-4 py-2 focus:ring-2 focus:ring-indigo-500">
                    </div>

                    <!-- ZKT User ID -->
                    <div>
                        <label class="block mb-2 font-semibold">
                            ZKT User ID
                        </label>

                        <input
                            type="number"
                            name="ZKUserID"
                            value="{{ old('ZKUserID') }}"
                            class="w-full border rounded-lg px-4 py-2 focus:ring-2 focus:ring-indigo-500">
                    </div>

                    <!-- Teacher Name -->
                    <div class="md:col-span-2">
                        <label class="block mb-2 font-semibold">
                            Teacher Name
                        </label>

                        <input
                            type="text"
                            name="TeacherName"
                            value="{{ old('TeacherName') }}"
                            required
                            class="w-full border rounded-lg px-4 py-2 focus:ring-2 focus:ring-indigo-500">
                    </div>

                    <!-- Department -->
                    <div>
                        <label class="block mb-2 font-semibold">
                            Department
                        </label>

                        <select
                            name="DepartmentID"
                            required
                            class="w-full border rounded-lg px-4 py-2">

                            <option value="">Select Department</option>

                            @foreach($departments as $department)

                                <option
                                    value="{{ $department->DepartmentID }}"
                                    {{ old('DepartmentID') == $department->DepartmentID ? 'selected' : '' }}>

                                    {{ $department->DepartmentName }}

                                </option>

                            @endforeach

                        </select>
                    </div>

                    <!-- Designation -->
                    <div>

                        <label class="block mb-2 font-semibold">
                            Designation
                        </label>

                        <select
                            name="DesignationID"
                            required
                            class="w-full border rounded-lg px-4 py-2">

                            <option value="">Select Designation</option>

                            @foreach($designations as $designation)

                                <option
                                    value="{{ $designation->DesignationID }}"
                                    {{ old('DesignationID') == $designation->DesignationID ? 'selected' : '' }}>

                                    {{ $designation->DesignationName }}

                                </option>

                            @endforeach

                        </select>

                    </div>

                    <!-- Mobile -->
                    <div>

                        <label class="block mb-2 font-semibold">
                            Mobile
                        </label>

                        <input
                            type="text"
                            name="Mobile"
                            value="{{ old('Mobile') }}"
                            class="w-full border rounded-lg px-4 py-2">

                    </div>

                    <!-- Email -->
                    <div>

                        <label class="block mb-2 font-semibold">
                            Email
                        </label>

                        <input
                            type="email"
                            name="Email"
                            value="{{ old('Email') }}"
                            class="w-full border rounded-lg px-4 py-2">

                    </div>

                </div>

            </div>

        </div>

        <div class="flex justify-end gap-3 mt-6">

            <a href="{{ route('teachers.index') }}"
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
                Save Teacher
            </button>

        </div>

    </form>

</div>

@endsection