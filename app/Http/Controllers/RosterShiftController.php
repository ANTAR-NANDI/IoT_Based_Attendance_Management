<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Illuminate\Validation\Rule;

class RosterShiftController extends Controller
{
    public function index() { $shifts = DB::table('tblRosterShift')->orderBy('StartTime')->paginate(20); return view('roster.shifts.index', compact('shifts')); }
    public function create() { return view('roster.shifts.form', ['shift' => null]); }
    public function store(Request $request) { DB::table('tblRosterShift')->insert($this->validated($request) + ['created_at' => now(), 'updated_at' => now()]); return redirect()->route('roster.shifts.index')->with('success', 'Roster shift template added.'); }
    public function edit(int $id) { $shift = DB::table('tblRosterShift')->where('RosterShiftID', $id)->firstOrFail(); return view('roster.shifts.form', compact('shift')); }
    public function update(Request $request, int $id) { DB::table('tblRosterShift')->where('RosterShiftID', $id)->update($this->validated($request, $id) + ['updated_at' => now()]); return redirect()->route('roster.shifts.index')->with('success', 'Roster shift template updated.'); }
    private function validated(Request $request, $id = null): array { $data = $request->validate(['ShiftName' => ['required', 'max:100', Rule::unique('tblRosterShift', 'ShiftName')->ignore($id, 'RosterShiftID')], 'StartTime' => ['required', 'date_format:H:i'], 'EndTime' => ['required', 'date_format:H:i'], 'CrossesMidnight' => ['required', 'boolean'], 'RequiredPeople' => ['required', 'integer', 'min:1', 'max:100'], 'Status' => ['required', 'boolean']]); $grace = DB::table('tblRosterSetting')->where('id', 1)->firstOrFail(); return $data + ['EntryEarlyMinutes' => $grace->EntryEarlyMinutes, 'EntryLateMinutes' => $grace->EntryLateMinutes, 'ExitEarlyMinutes' => $grace->ExitEarlyMinutes, 'ExitLateMinutes' => $grace->ExitLateMinutes]; }
}
