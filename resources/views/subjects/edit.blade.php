@extends('layouts.master')

@section('content')

<div class="max-w-5xl mx-auto">

    <div class="bg-white rounded-xl shadow-lg overflow-hidden">

        <!-- Header -->
        <div class="bg-slate-800 text-white px-6 py-4 flex items-center justify-between">

            <h2 class="text-xl font-semibold">
                Edit Subject
            </h2>

            <a href="{{ route('subjects.index') }}"
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

        <form action="{{ route('subjects.update',$subject->SubjectID) }}"
              method="POST">

            @csrf
            @method('PUT')

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
                            value="{{ old('Code',$subject->Code) }}"
                            required
                            class="w-full border rounded-lg px-4 py-2">

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
                                    {{ old('DepartmentID',$subject->DepartmentID)==$department->DepartmentID ? 'selected' : '' }}>

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
                            value="{{ old('SubjectName',$subject->SubjectName) }}"
                            required
                            class="w-full border rounded-lg px-4 py-2">

                    </div>

                </div>

                <!-- Buttons -->
                <div class="flex justify-end gap-3 mt-8 border-t pt-6">

                    <a
                        href="{{ route('subjects.index') }}"
                        class="px-6 py-2 bg-gray-500 text-white rounded-lg hover:bg-gray-600">

                        Cancel

                    </a>

                    <button
                        type="submit"
                        class="px-6 py-2 bg-blue-600 text-white rounded-lg hover:bg-blue-700">

                        Update Subject

                    </button>

                </div>

            </div>

        </form>

    </div>

</div>

@endsection