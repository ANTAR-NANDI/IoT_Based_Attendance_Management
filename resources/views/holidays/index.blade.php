@extends('layouts.master')

@section('content')

<div class="space-y-6">

    {{-- Header --}}
    <div class="flex items-center justify-between">

        <div>
            <h1 class="text-2xl font-bold text-slate-800">
                Holiday Management
            </h1>

            <p class="text-sm text-slate-500">
                Manage all Holiday information
            </p>
        </div>

        <a href="{{ route('holidays.create') }}"
           class="inline-flex items-center gap-2 bg-indigo-600 hover:bg-indigo-700 text-white px-5 py-2 rounded-lg shadow">

            <span>+</span>
            <span>Add Holiday</span>

        </a>

    </div>

    {{-- Search --}}
    <div class="bg-white rounded-xl shadow border border-slate-200 p-5">

        <form method="GET"
              action="{{ route('holidays.index') }}">

            <div class="flex flex-col lg:flex-row gap-3">

                <input
                    type="text"
                    name="search"
                    value="{{ request('search') }}"
                    placeholder="Search by Holiday Name or Type..."
                    class="flex-1 rounded-lg border border-slate-300 px-4 py-2 focus:ring-2 focus:ring-indigo-500 focus:outline-none">

                <button
                    class="bg-indigo-600 hover:bg-indigo-700 text-white px-6 py-2 rounded-lg">

                    Search

                </button>

            </div>

        </form>

    </div>

    {{-- Holiday Table --}}
    <div class="bg-white rounded-xl shadow border border-slate-200 overflow-hidden">

        <div class="overflow-x-auto">

            <table class="min-w-full divide-y divide-slate-200">

                <thead class="bg-slate-100">

                <tr>

                    <th class="px-4 py-3 text-left text-xs font-bold uppercase">
                        SL
                    </th>

                    <th class="px-4 py-3 text-left text-xs font-bold uppercase">
                        Holiday Name
                    </th>

                    <th class="px-4 py-3 text-left text-xs font-bold uppercase">
                        Date
                    </th>

                    <th class="px-4 py-3 text-left text-xs font-bold uppercase">
                        Type
                    </th>

                    <th class="px-4 py-3 text-left text-xs font-bold uppercase">
                        Description
                    </th>

                    <th class="px-4 py-3 text-center text-xs font-bold uppercase">
                        Action
                    </th>

                </tr>

                </thead>

                <tbody class="divide-y divide-slate-200">

                @forelse($holidays as $holiday)

                    <tr class="hover:bg-slate-50">

                        {{-- SL --}}
                        <td class="px-4 py-3">
                            {{ $holidays->firstItem() + $loop->index }}
                        </td>

                        {{-- Name --}}
                        <td class="px-4 py-3">
                            {{ $holiday->HolidayName }}
                        </td>

                        {{-- Date --}}
                        <td class="px-4 py-3">
                            {{ \Carbon\Carbon::parse($holiday->holidaydate)->format('d M Y') }}
                        </td>

                        {{-- Type --}}
                        <td class="px-4 py-3">
                            <span class="px-2 py-1 text-xs rounded bg-slate-200">
                                {{ ucfirst($holiday->type) }}
                            </span>
                        </td>

                        {{-- Description --}}
                        <td class="px-4 py-3">
                            {{ $holiday->strDescription }}
                        </td>

                        {{-- Action --}}
                        <td class="px-4 py-3">

                           <div class="flex items-center justify-center gap-2">

    <!-- Edit -->
    <a href="{{ route('holidays.edit', $holiday->id) }}"
       class="inline-flex items-center gap-2 rounded-lg bg-indigo-600 px-3 py-2 text-sm font-medium text-white shadow transition-all duration-200 hover:bg-indigo-700 hover:shadow-lg focus:outline-none focus:ring-2 focus:ring-indigo-500 focus:ring-offset-2">

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
          action="{{ route('holidays.destroy', $holiday->id) }}"
          class="inline"
          onsubmit="return confirm('Are you sure you want to delete this holiday?')">

        @csrf
        @method('DELETE')

        <button
            type="submit"
            class="inline-flex items-center gap-2 rounded-lg bg-red-600 px-3 py-2 text-sm font-medium text-white shadow transition-all duration-200 hover:bg-red-700 hover:shadow-lg focus:outline-none focus:ring-2 focus:ring-red-500 focus:ring-offset-2">

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

                        <td colspan="6"
                            class="text-center py-10 text-slate-500">

                            No Holidays Found

                        </td>

                    </tr>

                @endforelse

                </tbody>

            </table>

        </div>

    </div>

    {{-- Pagination --}}
    @if($holidays->hasPages())

        <div class="bg-white rounded-xl shadow border border-slate-200 p-4">

            {{ $holidays->withQueryString()->links() }}

        </div>

    @endif

</div>

@endsection