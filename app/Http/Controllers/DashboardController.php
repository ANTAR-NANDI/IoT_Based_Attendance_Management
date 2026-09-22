<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;

class DashboardController extends Controller
{
    public function index()
    {
        $totalRosterPeople = DB::table('tblRosterPerson')->where('Status', 1)->count();
        $totalDevices = DB::table('tblDevice')->where('Status', 1)->count();
        $totalRosterShifts = DB::table('tblRosterShift')->where('Status', 1)->count();
        $todayAssignments = DB::table('tblRosterAssignment')
            ->whereDate('RosterDate', now()->toDateString())
            ->where('Status', 'Active')
            ->count();

        return view('dashboard', compact('totalRosterPeople', 'totalDevices', 'totalRosterShifts', 'todayAssignments'));
    }
}
