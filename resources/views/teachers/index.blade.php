@extends('layouts.master')

@section('content')

<div class="space-y-6">

    <!-- Header -->
    <div class="flex items-center justify-between">

        <div>
            <h1 class="text-2xl font-bold text-slate-800">
                Teacher Management
            </h1>

            <p class="text-sm text-slate-500">
                Manage all teacher information
            </p>
        </div>

        <a href="{{ route('teachers.create') }}"
           class="inline-flex items-center gap-2 bg-indigo-600 hover:bg-indigo-700 text-white px-5 py-2 rounded-lg shadow">

            <span>+</span>
            <span>Add Teacher</span>

        </a>

    </div>

    <!-- Search -->
    <div class="bg-white rounded-xl shadow border border-slate-200 p-5">

        <form method="GET" action="{{ route('teachers.index') }}">

            <div class="flex gap-3">

                <input
                    type="text"
                    name="search"
                    value="{{ request('search') }}"
                    placeholder="Search Employee ID, Teacher Name, Department, Designation"
                    class="flex-1 rounded-lg border border-slate-300 px-4 py-2 focus:ring-2 focus:ring-indigo-500">

                <button
                    class="bg-indigo-600 hover:bg-indigo-700 text-white px-6 rounded-lg">

                    Search

                </button>

            </div>

        </form>

    </div>

    <!-- Table -->
    <div class="bg-white rounded-xl shadow border border-slate-200 overflow-hidden">

        <div class="overflow-x-auto">

            <table class="min-w-full divide-y divide-slate-200">

                <thead class="bg-slate-100">

                <tr>

                    <th class="px-4 py-3 text-left">SL</th>

                    <th class="px-4 py-3 text-left">
                        Employee ID
                    </th>

                    <th class="px-4 py-3 text-left">
                        Teacher Name
                    </th>

                    <th class="px-4 py-3 text-left">
                        Department
                    </th>

                    <th class="px-4 py-3 text-left">
                        Designation
                    </th>

                    <th class="px-4 py-3 text-left">
                        Mobile
                    </th>

                    <th class="px-4 py-3 text-left">
                        Email
                    </th>

                    <th class="px-4 py-3 text-center">
                        ZKT ID
                    </th>

                    <th class="px-4 py-3 text-center">
                        Action
                    </th>

                </tr>

                </thead>

                <tbody class="divide-y divide-slate-200">

                @forelse($teachers as $teacher)

                    <tr class="hover:bg-slate-50">

                        <td class="px-4 py-3">
                            {{ $teachers->firstItem() + $loop->index }}
                        </td>

                        <td class="px-4 py-3 font-semibold">
                            {{ $teacher->EmployeeID }}
                        </td>

                        <td class="px-4 py-3">
                            {{ $teacher->TeacherName }}
                        </td>

                        <td class="px-4 py-3">
                            {{ $teacher->DepartmentName }}
                        </td>

                        <td class="px-4 py-3">
                            {{ $teacher->DesignationName }}
                        </td>

                        <td class="px-4 py-3">
                            {{ $teacher->Mobile }}
                        </td>

                        <td class="px-4 py-3">
                            {{ $teacher->Email }}
                        </td>

                        <td class="px-4 py-3 text-center">
                            {{ $teacher->ZKUserID ?? '-' }}
                        </td>

                        <td class="px-4 py-3">

                            <div class="flex justify-center gap-2">

                                <a href="{{ route('teachers.edit',$teacher->TeacherID) }}"
                                   class="bg-blue-600 hover:bg-blue-700 text-white px-3 py-1 rounded text-sm">

                                    Edit

                                </a>

                                <form
                                    action="{{ route('teachers.destroy',$teacher->TeacherID) }}"
                                    method="POST"
                                    onsubmit="return confirm('Delete this teacher?')">

                                    @csrf
                                    @method('DELETE')

                                    <button
                                        class="bg-red-600 hover:bg-red-700 text-white px-3 py-1 rounded text-sm">

                                        Delete

                                    </button>

                                </form>

                            </div>

                        </td>

                    </tr>

                @empty

                    <tr>

                        <td colspan="9" class="text-center py-10 text-slate-500">

                            No teachers found.

                        </td>

                    </tr>

                @endforelse

                </tbody>

            </table>

        </div>

    </div>

    @if($teachers->hasPages())

        <div class="bg-white rounded-xl shadow border border-slate-200 p-4">

            {{ $teachers->withQueryString()->links() }}

        </div>

    @endif

</div>

@endsection