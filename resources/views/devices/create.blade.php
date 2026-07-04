@extends('layouts.master')

@section('content')

<div class="max-w-5xl mx-auto">

    <!-- Header -->
    <div class="flex items-center justify-between mb-6">

        <div>
            <h1 class="text-3xl font-bold text-slate-800">
                Add Device
            </h1>

            <p class="text-slate-500 mt-1">
                Register a new attendance device
            </p>
        </div>

        <a href="{{ route('devices.index') }}"
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

    <form action="{{ route('devices.store') }}" method="POST">

        @csrf

        <div class="bg-white rounded-xl shadow-lg overflow-hidden">

            <div class="bg-slate-800 text-white px-6 py-4">

                <h2 class="text-lg font-semibold">
                    Device Information
                </h2>

            </div>

            <div class="p-8">

                <div class="grid grid-cols-1 md:grid-cols-2 gap-6">

                    <!-- Device Name -->
                    <div>

                        <label class="block font-semibold mb-2">
                            Device Name
                        </label>

                        <input
                            type="text"
                            name="DeviceName"
                            value="{{ old('DeviceName') }}"
                            placeholder="e.g. Main Gate Device"
                            required
                            class="w-full rounded-lg border px-4 py-2 focus:ring-2 focus:ring-indigo-500">

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

                                    {{ $room->RoomNo }} ({{ $room->Floor }})

                                </option>

                            @endforeach

                        </select>

                    </div>

                    <!-- IP Address -->
                    <div>

                        <label class="block font-semibold mb-2">
                            IP Address
                        </label>

                        <input
                            type="text"
                            name="IPAddress"
                            value="{{ old('IPAddress') }}"
                            placeholder="192.168.1.201"
                            required
                            class="w-full rounded-lg border px-4 py-2 focus:ring-2 focus:ring-indigo-500">

                    </div>

                    <!-- Serial Number -->
                    <div>

                        <label class="block font-semibold mb-2">
                            Serial Number
                        </label>

                        <input
                            type="text"
                            name="SerialNo"
                            value="{{ old('SerialNo') }}"
                            placeholder="Optional"
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

                </div>

            </div>

        </div>

        <!-- Buttons -->
        <div class="flex justify-end gap-3 mt-8">

            <a href="{{ route('devices.index') }}"
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

                Save Device

            </button>

        </div>

    </form>

</div>

@endsection