@extends('layouts.master')

@section('content')

<div class="max-w-6xl mx-auto">

    <div class="bg-white rounded-xl shadow-lg overflow-hidden">

        <!-- Header -->
        <div class="bg-slate-800 text-white px-6 py-4 flex items-center justify-between">

            <h2 class="text-xl font-semibold">
                Edit Teacher
            </h2>

            <a href="{{ route('teachers.index') }}"
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

        <form action="{{ route('teachers.update',$teacher->TeacherID) }}"
              method="POST">

            @csrf
            @method('PUT')

            <div class="p-8">

                <div class="grid grid-cols-1 md:grid-cols-2 gap-6">

                    <!-- Employee ID -->
                    <div>

                        <label class="block font-semibold mb-2">
                            Employee ID
                        </label>

                        <input
                            type="text"
                            name="EmployeeID"
                            value="{{ old('EmployeeID',$teacher->EmployeeID) }}"
                            class="w-full border rounded-lg px-4 py-2"
                            readonly>

                    </div>

                    <!-- ZKT User -->
                    <div>

                        <label class="block font-semibold mb-2">
                            ZKT User ID
                        </label>

                        <input
                            type="number"
                            name="ZKUserID"
                            value="{{ old('ZKUserID',$teacher->ZKUserID) }}"
                            class="w-full border rounded-lg px-4 py-2">

                    </div>

                    <!-- Teacher Name -->
                    <div class="md:col-span-2">

                        <label class="block font-semibold mb-2">
                            Teacher Name
                        </label>

                        <input
                            type="text"
                            name="TeacherName"
                            value="{{ old('TeacherName',$teacher->TeacherName) }}"
                            class="w-full border rounded-lg px-4 py-2"
                            required>

                    </div>

                    <!-- Department -->
                    <div>

                        <label class="block font-semibold mb-2">
                            Department
                        </label>

                        <select
                            name="DepartmentID"
                            required
                            class="w-full border rounded-lg px-4 py-2">

                            @foreach($departments as $department)

                                <option
                                    value="{{ $department->DepartmentID }}"
                                    {{ old('DepartmentID',$teacher->DepartmentID)==$department->DepartmentID ? 'selected' : '' }}>

                                    {{ $department->DepartmentName }}

                                </option>

                            @endforeach

                        </select>

                    </div>

                    <!-- Designation -->
                    <div>

                        <label class="block font-semibold mb-2">
                            Designation
                        </label>

                        <select
                            name="DesignationID"
                            required
                            class="w-full border rounded-lg px-4 py-2">

                            @foreach($designations as $designation)

                                <option
                                    value="{{ $designation->DesignationID }}"
                                    {{ old('DesignationID',$teacher->DesignationID)==$designation->DesignationID ? 'selected' : '' }}>

                                    {{ $designation->DesignationName }}

                                </option>

                            @endforeach

                        </select>

                    </div>

                    <!-- Mobile -->
                    <div>

                        <label class="block font-semibold mb-2">
                            Mobile
                        </label>

                        <input
                            type="text"
                            name="Mobile"
                            value="{{ old('Mobile',$teacher->Mobile) }}"
                            class="w-full border rounded-lg px-4 py-2">

                    </div>

                    <!-- Email -->
                    <div>

                        <label class="block font-semibold mb-2">
                            Email
                        </label>

                        <input
                            type="email"
                            name="Email"
                            value="{{ old('Email',$teacher->Email) }}"
                            class="w-full border rounded-lg px-4 py-2">

                    </div>

                </div>

                <div class="flex justify-end gap-3 mt-8 border-t pt-6">

                    <a
                        href="{{ route('teachers.index') }}"
                        class="px-6 py-2 bg-gray-500 text-white rounded-lg hover:bg-gray-600">

                        Cancel

                    </a>

                    <button
                        type="submit"
                        class="px-6 py-2 bg-blue-600 text-white rounded-lg hover:bg-blue-700">

                        Update Teacher

                    </button>

                </div>

            </div>

        </form>

    </div>

</div>

@endsection