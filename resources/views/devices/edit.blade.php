@extends('layouts.master')

@section('content')

<div class="max-w-5xl mx-auto">

    <div class="bg-white rounded-xl shadow-lg overflow-hidden">

        <!-- Header -->
        <div class="bg-slate-800 text-white px-6 py-4 flex items-center justify-between">

            <h2 class="text-xl font-semibold">
                Edit Device
            </h2>

            <a href="{{ route('devices.index') }}"
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

        <form action="{{ route('devices.update', $device->DeviceID) }}"
              method="POST">

            @csrf
            @method('PUT')

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
                            value="{{ old('DeviceName', $device->DeviceName) }}"
                            required
                            class="w-full border rounded-lg px-4 py-2">

                    </div>

                    <!-- Room -->
                    <div>

                        <label class="block font-semibold mb-2">
                            Room
                        </label>

                        <select
                            name="RoomID"
                            required
                            class="w-full border rounded-lg px-4 py-2">

                            <option value="">
                                Select Room
                            </option>

                            @foreach($rooms as $room)

                                <option
                                    value="{{ $room->RoomID }}"
                                    {{ old('RoomID', $device->RoomID) == $room->RoomID ? 'selected' : '' }}>

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
                            value="{{ old('IPAddress', $device->IPAddress) }}"
                            placeholder="192.168.1.201"
                            required
                            class="w-full border rounded-lg px-4 py-2">

                    </div>

                    <!-- Serial Number -->
                    <div>

                        <label class="block font-semibold mb-2">
                            Serial Number
                        </label>

                        <input
                            type="text"
                            name="SerialNo"
                            value="{{ old('SerialNo', $device->SerialNo) }}"
                            required
                            class="w-full border rounded-lg px-4 py-2">

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
                                {{ old('Status', $device->Status) == 1 ? 'selected' : '' }}>
                                Active
                            </option>

                            <option value="0"
                                {{ old('Status', $device->Status) == 0 ? 'selected' : '' }}>
                                Inactive
                            </option>

                        </select>

                    </div>

                </div>

                <!-- Buttons -->
                <div class="flex justify-end gap-3 mt-8 border-t pt-6">

                    <a href="{{ route('devices.index') }}"
                       class="px-6 py-2 bg-gray-500 text-white rounded-lg hover:bg-gray-600">

                        Cancel

                    </a>

                    <button
                        type="submit"
                        class="px-6 py-2 bg-blue-600 text-white rounded-lg hover:bg-blue-700">

                        Update Device

                    </button>

                </div>

            </div>

        </form>

    </div>

</div>

@endsection