<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;

class DashboardController extends Controller
{
    public function index()
    {
        $totalTeachers     = DB::table('tblTeacher')->count();
        $totalDepartments  = DB::table('tblDepartment')->count();
        $totalSubjects     = DB::table('tblSubject')->count();
        $totalBatches      = DB::table('tblBatch')->count();
        $totalRooms        = DB::table('tblRoom')->count();
        $totalDevices      = DB::table('tblDevice')->count();
        $totalLeaveTypes   = DB::table('tblLeaveType')->count();
        $pendingLeaves     = DB::table('tblLeave')->where('status', 'Pending')->count();


        return view('dashboard', compact(
            'totalTeachers',
            'totalSubjects',
            'totalRooms',
            'totalDepartments',
            'totalLeaveTypes',
            'totalBatches',
            'totalDevices',
            'pendingLeaves'
        ));
    }
}
