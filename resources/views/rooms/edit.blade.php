```blade
@extends('layouts.master')

@section('content')

<div class="max-w-5xl mx-auto">

    <div class="bg-white rounded-xl shadow-lg overflow-hidden">

        <!-- Header -->
        <div class="bg-slate-800 text-white px-6 py-4 flex items-center justify-between">

            <h2 class="text-xl font-semibold">
                Edit Room
            </h2>

            <a href="{{ route('rooms.index') }}"
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

        <form action="{{ route('rooms.update', $room->RoomID) }}"
              method="POST">

            @csrf
            @method('PUT')

            <div class="p-8">

                <div class="grid grid-cols-1 md:grid-cols-2 gap-6">

                    <!-- Room No -->
                    <div>

                        <label class="block font-semibold mb-2">
                            Room No
                        </label>

                        <input
                            type="text"
                            name="RoomNo"
                            value="{{ old('RoomNo', $room->RoomNo) }}"
                            required
                            class="w-full border rounded-lg px-4 py-2">

                    </div>

                    <!-- Floor -->
                    <div>

                        <label class="block font-semibold mb-2">
                            Floor
                        </label>

                        <input
                            type="text"
                            name="Floor"
                            value="{{ old('Floor', $room->Floor) }}"
                            required
                            class="w-full border rounded-lg px-4 py-2">

                    </div>

                </div>

                <!-- Buttons -->
                <div class="flex justify-end gap-3 mt-8 border-t pt-6">

                    <a href="{{ route('rooms.index') }}"
                       class="px-6 py-2 bg-gray-500 text-white rounded-lg hover:bg-gray-600">

                        Cancel

                    </a>

                    <button
                        type="submit"
                        class="px-6 py-2 bg-blue-600 text-white rounded-lg hover:bg-blue-700">

                        Update Room

                    </button>

                </div>

            </div>

        </form>

    </div>

</div>

@endsection
```
