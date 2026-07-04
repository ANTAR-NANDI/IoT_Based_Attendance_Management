@extends('layouts.master')

@section('content')

<div class="max-w-5xl mx-auto">

    <!-- Header -->
    <div class="flex items-center justify-between mb-6">

        <div>
            <h1 class="text-3xl font-bold text-slate-800">
                Add Routine
            </h1>

            <p class="text-slate-500 mt-1">
                Schedule a new class routine
            </p>
        </div>

        <a href="{{ route('routines.index') }}"
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

    <form action="{{ route('routines.store') }}" method="POST">

        @csrf

        <div class="bg-white rounded-xl shadow-lg overflow-hidden">

            <div class="bg-slate-800 text-white px-6 py-4">

                <h2 class="text-lg font-semibold">
                    Routine Information
                </h2>

            </div>

            <div class="p-8">

                <div class="grid grid-cols-1 md:grid-cols-2 gap-6">

                    <!-- Routine Date -->
                    <div>

                        <label class="block font-semibold mb-2">
                            Routine Date
                        </label>

                        <input
                            type="date"
                            name="RoutineDate"
                            value="{{ old('RoutineDate') }}"
                            required
                            class="w-full rounded-lg border px-4 py-2 focus:ring-2 focus:ring-indigo-500">

                    </div>

                    <!-- Day Name -->
                    <div>

                        <label class="block font-semibold mb-2">
                            Day
                        </label>

                        <select
                            name="DayName"
                            required
                            class="w-full rounded-lg border px-4 py-2 focus:ring-2 focus:ring-indigo-500">

                            <option value="">
                                Select Day
                            </option>

                            @foreach (['Saturday', 'Sunday', 'Monday', 'Tuesday', 'Wednesday', 'Thursday', 'Friday'] as $day)

                                <option
                                    value="{{ $day }}"
                                    {{ old('DayName') == $day ? 'selected' : '' }}>

                                    {{ $day }}

                                </option>

                            @endforeach

                        </select>

                    </div>

                    <!-- Teacher -->
                    <div>

                        <label class="block font-semibold mb-2">
                            Teacher
                        </label>

                        <select
                            name="TeacherID"
                            required
                            class="w-full rounded-lg border px-4 py-2 focus:ring-2 focus:ring-indigo-500">

                            <option value="">
                                Select Teacher
                            </option>

                            @foreach($teachers as $teacher)

                                <option
                                    value="{{ $teacher->TeacherID }}"
                                    {{ old('TeacherID') == $teacher->TeacherID ? 'selected' : '' }}>

                                    {{ $teacher->TeacherName }}

                                </option>

                            @endforeach

                        </select>

                    </div>

                    <!-- Subject -->
                    <div>

                        <label class="block font-semibold mb-2">
                            Subject
                        </label>

                        <select
                            name="SubjectID"
                            required
                            class="w-full rounded-lg border px-4 py-2 focus:ring-2 focus:ring-indigo-500">

                            <option value="">
                                Select Subject
                            </option>

                            @foreach($subjects as $subject)

                                <option
                                    value="{{ $subject->SubjectID }}"
                                    {{ old('SubjectID') == $subject->SubjectID ? 'selected' : '' }}>

                                    {{ $subject->SubjectName }}

                                </option>

                            @endforeach

                        </select>

                    </div>

                    <!-- Batch -->
                    <div>

                        <label class="block font-semibold mb-2">
                            Batch
                        </label>

                        <select
                            name="BatchID"
                            required
                            class="w-full rounded-lg border px-4 py-2 focus:ring-2 focus:ring-indigo-500">

                            <option value="">
                                Select Batch
                            </option>

                            @foreach($batches as $batch)

                                <option
                                    value="{{ $batch->BatchID }}"
                                    {{ old('BatchID') == $batch->BatchID ? 'selected' : '' }}>

                                    {{ $batch->BatchName }}

                                </option>

                            @endforeach

                        </select>

                    </div>

                    <!-- Room -->
                    <div>

                        <label class="block font-semibold mb-2">
                            Room
                        </label>

                        <select
                            name="RoomID"
                            required
                            class="w-full rounded-lg border px-4 py-2 focus:ring-2 focus:ring-indigo-500">

                            <option value="">
                                Select Room
                            </option>

                            @foreach($rooms as $room)

                                <option
                                    value="{{ $room->RoomID }}"
                                    {{ old('RoomID') == $room->RoomID ? 'selected' : '' }}>

                                    {{ $room->RoomNo }}

                                </option>

                            @endforeach

                        </select>

                    </div>

                    <!-- Device -->
                    <div>

                        <label class="block font-semibold mb-2">
                            Device
                        </label>

                        <select
                            name="DeviceID"
                            required
                            class="w-full rounded-lg border px-4 py-2 focus:ring-2 focus:ring-indigo-500">

                            <option value="">
                                Select Device
                            </option>

                            @foreach($devices as $device)

                                <option
                                    value="{{ $device->DeviceID }}"
                                    {{ old('DeviceID') == $device->DeviceID ? 'selected' : '' }}>

                                    {{ $device->DeviceName }}

                                </option>

                            @endforeach

                        </select>

                    </div>

                    <!-- Class Type -->
                    <div>

                        <label class="block font-semibold mb-2">
                            Class Type
                        </label>

                        <select
                            name="ClassType"
                            class="w-full rounded-lg border px-4 py-2 focus:ring-2 focus:ring-indigo-500">

                            <option value="">
                                Select Type
                            </option>

                            @foreach (['Theory', 'Lab', 'Viva'] as $type)

                                <option
                                    value="{{ $type }}"
                                    {{ old('ClassType') == $type ? 'selected' : '' }}>

                                    {{ $type }}

                                </option>

                            @endforeach

                        </select>

                    </div>

                    <!-- Start Time -->
                    <div>

                        <label class="block font-semibold mb-2">
                            Start Time
                        </label>

                        <input
                            type="time"
                            name="StartTime"
                            value="{{ old('StartTime') }}"
                            required
                            class="w-full rounded-lg border px-4 py-2 focus:ring-2 focus:ring-indigo-500">

                    </div>

                    <!-- End Time -->
                    <div>

                        <label class="block font-semibold mb-2">
                            End Time
                        </label>

                        <input
                            type="time"
                            name="EndTime"
                            value="{{ old('EndTime') }}"
                            required
                            class="w-full rounded-lg border px-4 py-2 focus:ring-2 focus:ring-indigo-500">

                    </div>

                    <!-- Grace Minute -->
                    <div>

                        <label class="block font-semibold mb-2">
                            Grace Minutes
                        </label>

                        <input
                            type="number"
                            name="GraceMinute"
                            value="{{ old('GraceMinute', 0) }}"
                            min="0"
                            class="w-full rounded-lg border px-4 py-2 focus:ring-2 focus:ring-indigo-500">

                    </div>

                    <!-- Status -->
                    <div>

                        <label class="block font-semibold mb-2">
                            Status
                        </label>

                        <select
                            name="Status"
                            class="w-full rounded-lg border px-4 py-2 focus:ring-2 focus:ring-indigo-500">

                            <option value="1" selected>
                                Active
                            </option>

                            <option value="0">
                                Inactive
                            </option>

                        </select>

                    </div>

                    <!-- Remarks -->
                    <div class="md:col-span-2">

                        <label class="block font-semibold mb-2">
                            Remarks
                        </label>

                        <textarea
                            name="Remarks"
                            rows="3"
                            placeholder="Optional"
                            class="w-full rounded-lg border px-4 py-2 focus:ring-2 focus:ring-indigo-500">{{ old('Remarks') }}</textarea>

                    </div>

                </div>

            </div>

        </div>

        <!-- Buttons -->
        <div class="flex justify-end gap-3 mt-8">

            <a href="{{ route('routines.index') }}"
               class="px-6 py-2 rounded-lg bg-gray-500 text-white hover:bg-gray-600">

                Cancel

            </a>

            <button
                type="reset"
                class="px-6 py-2 rounded-lg bg-yellow-500 text-white hover:bg-yellow-600">

                Reset

            </button>

            <button
                type="submit"
                class="px-6 py-2 rounded-lg bg-green-600 text-white hover:bg-green-700">

                Save Routine

            </button>

        </div>

    </form>

</div>

@endsection