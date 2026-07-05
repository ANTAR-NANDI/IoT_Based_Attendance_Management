@extends('layouts.master')

@section('content')

<div class="space-y-6">

    <!-- Header -->
    <div class="flex items-center justify-between">

        <div>
            <h1 class="text-2xl font-bold text-slate-800">
                Shift Management
            </h1>

            <p class="text-sm text-slate-500">
                Manage all shift information
            </p>
        </div>

        <a href="{{ route('shifts.create') }}"
           class="inline-flex items-center gap-2 rounded-lg bg-indigo-600 px-5 py-2 text-white shadow hover:bg-indigo-700">

            <span>+</span>
            <span>Add Shift</span>

        </a>

    </div>

    <!-- Search -->
    <div class="rounded-xl border border-slate-200 bg-white p-5 shadow">

        <form method="GET" action="{{ route('shifts.index') }}">

            <div class="flex flex-col gap-3 lg:flex-row">

                <input
                    type="text"
                    name="search"
                    value="{{ request('search') }}"
                    placeholder="Search by Shift Name"
                    class="flex-1 rounded-lg border border-slate-300 px-4 py-2 focus:outline-none focus:ring-2 focus:ring-indigo-500">

                <button
                    type="submit"
                    class="rounded-lg bg-indigo-600 px-6 py-2 text-white hover:bg-indigo-700">

                    Search

                </button>

            </div>

        </form>

    </div>

    <!-- Table -->
    <div class="overflow-hidden rounded-xl border border-slate-200 bg-white shadow">

        <div class="overflow-x-auto">

            <table class="min-w-full divide-y divide-slate-200">

                <thead class="bg-slate-100">

                    <tr>

                        <th class="px-4 py-3 text-left text-xs font-bold uppercase">
                            SL
                        </th>

                        <th class="px-4 py-3 text-left text-xs font-bold uppercase">
                            Shift Name
                        </th>

                        <th class="px-4 py-3 text-center text-xs font-bold uppercase">
                            Start Time
                        </th>

                        <th class="px-4 py-3 text-center text-xs font-bold uppercase">
                            Working Hour
                        </th>

                        <th class="px-4 py-3 text-center text-xs font-bold uppercase">
                            Day Start
                        </th>

                        <th class="px-4 py-3 text-center text-xs font-bold uppercase">
                            Day Hour
                        </th>

                        <th class="px-4 py-3 text-center text-xs font-bold uppercase">
                            Status
                        </th>

                        <th class="px-4 py-3 text-center text-xs font-bold uppercase">
                            Action
                        </th>

                    </tr>

                </thead>

                <tbody class="divide-y divide-slate-200">

                @forelse($shifts as $shift)

                    <tr class="hover:bg-slate-50">

                        <td class="px-4 py-3">
                            {{ $shifts->firstItem() + $loop->index }}
                        </td>

                        <td class="px-4 py-3 font-semibold">
                            {{ $shift->shiftName }}
                        </td>

                        <td class="px-4 py-3 text-center">
                            {{ \Carbon\Carbon::parse($shift->startTime)->format('h:i A') }}
                        </td>

                        <td class="px-4 py-3 text-center">
                            {{ $shift->workinghour }} Hours
                        </td>

                        <td class="px-4 py-3 text-center">
                            {{ $shift->daystart ? \Carbon\Carbon::parse($shift->daystart)->format('h:i A') : '-' }}
                        </td>

                        <td class="px-4 py-3 text-center">
                            {{ $shift->dayhour ?? '-' }} Hours
                        </td>

                        <td class="px-4 py-3 text-center">

                            @if($shift->ysnActive)

                                <span class="inline-flex rounded-full bg-green-100 px-3 py-1 text-xs font-semibold text-green-700">
                                    Active
                                </span>

                            @else

                                <span class="inline-flex rounded-full bg-red-100 px-3 py-1 text-xs font-semibold text-red-700">
                                    Inactive
                                </span>

                            @endif

                        </td>

                        <td class="px-4 py-3">

                            <div class="flex items-center justify-center gap-2">

                                <!-- Edit -->
                                <a href="{{ route('shifts.edit',$shift->id) }}"
                                   class="inline-flex items-center gap-2 rounded-lg bg-indigo-600 px-3 py-2 text-sm font-medium text-white shadow transition-all duration-200 hover:bg-indigo-700 hover:shadow-lg">

                                    <svg xmlns="http://www.w3.org/2000/svg"
                                         class="h-4 w-4"
                                         fill="none"
                                         viewBox="0 0 24 24"
                                         stroke="currentColor">
                                        <path stroke-linecap="round"
                                              stroke-linejoin="round"
                                              stroke-width="2"
                                              d="M11 5H6a2 2 0 00-2 2v11a2 2 0 002 2h11a2 2 0 002-2v-5M16.5 3.5a2.121 2.121 0 113 3L12 14l-4 1 1-4 7.5-7.5"/>
                                    </svg>

                                    Edit

                                </a>

                                <!-- Delete -->
                                <form method="POST"
                                      action="{{ route('shifts.destroy',$shift->id) }}"
                                      class="inline"
                                      onsubmit="return confirm('Are you sure you want to delete this shift?')">

                                    @csrf
                                    @method('DELETE')

                                    <button
                                        type="submit"
                                        class="inline-flex items-center gap-2 rounded-lg bg-red-600 px-3 py-2 text-sm font-medium text-white shadow transition-all duration-200 hover:bg-red-700 hover:shadow-lg">

                                        <svg xmlns="http://www.w3.org/2000/svg"
                                             class="h-4 w-4"
                                             fill="none"
                                             viewBox="0 0 24 24"
                                             stroke="currentColor">
                                            <path stroke-linecap="round"
                                                  stroke-linejoin="round"
                                                  stroke-width="2"
                                                  d="M19 7L18.133 19.143A2 2 0 0116.138 21H7.862a2 2 0 01-1.995-1.857L5 7m5 4v6m4-6v6M9 7V4a1 1 0 011-1h4a1 1 0 011 1v3m-7 0h8"/>
                                        </svg>

                                        Delete

                                    </button>

                                </form>

                            </div>

                        </td>

                    </tr>

                @empty

                    <tr>

                        <td colspan="8" class="py-10 text-center text-slate-500">

                            No Shifts Found

                        </td>

                    </tr>

                @endforelse

                </tbody>

            </table>

        </div>

    </div>

    <!-- Pagination -->
    @if($shifts->hasPages())

        <div class="rounded-xl border border-slate-200 bg-white p-4 shadow">

            {{ $shifts->withQueryString()->links() }}

        </div>

    @endif

</div>

@endsection