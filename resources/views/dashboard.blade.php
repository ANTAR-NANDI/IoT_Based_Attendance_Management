@extends('layouts.master')

@section('content')

<div class="space-y-8">

    <!-- Header -->
    <div>
        <h1 class="text-3xl font-bold text-slate-800">
            HRM Dashboard
        </h1>

        <p class="text-slate-500 mt-1">
            Welcome back! Here's today's overview.
        </p>
    </div>

    <!-- Cards -->
    <div class="grid grid-cols-1 md:grid-cols-2 xl:grid-cols-4 gap-6">

        <!-- Employee -->
        <div class="bg-gradient-to-r from-blue-600 to-indigo-600 rounded-2xl p-6 text-white shadow-lg hover:scale-105 transition">

            <div class="flex justify-between">

                <div>

                    <p class="text-blue-100">
                        Teachers
                    </p>

                    <h2 class="text-4xl font-bold mt-2">
                        {{ $totalTeachers }}
                    </h2>

                </div>

                <div class="text-5xl">
                    👨‍🏫
                </div>

            </div>

        </div>

        <!-- Department -->

        <div class="bg-gradient-to-r from-green-500 to-emerald-600 rounded-2xl p-6 text-white shadow-lg hover:scale-105 transition">

            <div class="flex justify-between">

                <div>

                    <p class="text-green-100">
                        Departments
                    </p>

                    <h2 class="text-4xl font-bold mt-2">
                        {{ $totalDepartments }}
                    </h2>

                </div>

                <div class="text-5xl">
                    🏢
                </div>

            </div>

        </div>

        <!-- Leave Type -->

        <div class="bg-gradient-to-r from-purple-500 to-fuchsia-600 rounded-2xl p-6 text-white shadow-lg hover:scale-105 transition">

            <div class="flex justify-between">

                <div>

                    <p class="text-purple-100">
                        Leave Types
                    </p>

                    <h2 class="text-4xl font-bold mt-2">
                        {{ $totalLeaveTypes }}
                    </h2>

                </div>

                <div class="text-5xl">
                    📑
                </div>

            </div>

        </div>

        <!-- Pending -->

        <div class="bg-gradient-to-r from-red-500 to-orange-600 rounded-2xl p-6 text-white shadow-lg hover:scale-105 transition">

            <div class="flex justify-between">

                <div>

                    <p class="text-red-100">
                        Pending Leave
                    </p>

                    <h2 class="text-4xl font-bold mt-2">
                        {{ $pendingLeaves }}
                    </h2>

                </div>

                <div class="text-5xl">
                    ⏳
                </div>

            </div>

        </div>

    </div>


    <!-- Charts -->

    <div class="grid grid-cols-1 xl:grid-cols-3 gap-6">

        <!-- Area Chart -->

        <div class="xl:col-span-2 bg-white rounded-2xl shadow p-6">

            <h2 class="text-lg font-bold mb-6">
                HR Overview
            </h2>

            <canvas id="areaChart" height="120"></canvas>

        </div>

        <!-- Doughnut -->

        <div class="bg-white rounded-2xl shadow p-6">

            <h2 class="text-lg font-bold mb-6">
                Summary
            </h2>

            <canvas id="pieChart"></canvas>

        </div>

    </div>


    <!-- Bottom -->

    <div class="grid grid-cols-1 lg:grid-cols-2 gap-6">

        <!-- Quick Summary -->

        <div class="bg-white rounded-2xl shadow p-6">

            <h2 class="text-lg font-bold mb-5">
                Quick Summary
            </h2>

            <div class="space-y-5">

                <div class="flex justify-between">

                    <span>Total Teachers</span>

                    <span class="font-bold text-blue-600">
                        {{ $totalTeachers }}
                    </span>

                </div>

                <div class="flex justify-between">

                    <span>Departments</span>

                    <span class="font-bold text-green-600">
                        {{ $totalDepartments }}
                    </span>

                </div>

                <div class="flex justify-between">

                    <span>Leave Types</span>

                    <span class="font-bold text-purple-600">
                        {{ $totalLeaveTypes }}
                    </span>

                </div>

                <div class="flex justify-between">

                    <span>Pending Leave</span>

                    <span class="font-bold text-red-600">
                        {{ $pendingLeaves }}
                    </span>

                </div>

            </div>

        </div>

        <!-- Activity -->

        <div class="bg-white rounded-2xl shadow p-6">

            <h2 class="text-lg font-bold mb-5">
                Recent Activity
            </h2>

            <div class="text-center py-20 text-slate-400">

                No recent activity.

            </div>

        </div>

    </div>

</div>

@endsection


@push('scripts')

<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>

<script>

new Chart(document.getElementById('areaChart'),{

    type:'line',

    data:{

        labels:[
            'Teachers',
            'Departments',
            'Leave Types',
            'Pending'
        ],

        datasets:[{

            data:[
                {{ $totalTeachers }},
                {{ $totalDepartments }},
                {{ $totalLeaveTypes }},
                {{ $pendingLeaves }}
            ],

            tension:.4,

            fill:true,

            borderColor:'#4f46e5',

            backgroundColor:'rgba(99,102,241,.15)',

            pointRadius:5

        }]

    },

    options:{

        plugins:{
            legend:{
                display:false
            }
        }

    }

});


new Chart(document.getElementById('pieChart'),{

    type:'doughnut',

    data:{

        labels:[
            'Teachers',
            'Departments',
            'Leave Types',
            'Pending'
        ],

        datasets:[{

            data:[
                {{ $totalTeachers }},
                {{ $totalDepartments }},
                {{ $totalLeaveTypes }},
                {{ $pendingLeaves }}
            ]

        }]

    },

    options:{

        plugins:{
            legend:{
                position:'bottom'
            }
        }

    }

});

</script>

@endpush