<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;

class AttendanceSettingController extends Controller
{
    public function edit()
    {
        $settings = DB::table('tblAttendanceSetting')->where('id', 1)->first();

        return view('attendance-settings.edit', compact('settings'));
    }

    public function update(Request $request)
    {
        $values = $request->validate([
            'EntryEarlyMinutes' => 'required|integer|min:0|max:120',
            'EntryLateMinutes' => 'required|integer|min:0|max:120',
            'ExitEarlyMinutes' => 'required|integer|min:0|max:120',
            'ExitLateMinutes' => 'required|integer|min:0|max:120',
        ]);

        DB::table('tblAttendanceSetting')->updateOrInsert(
            ['id' => 1],
            [...$values, 'updated_at' => now(), 'created_at' => now()]
        );

        return back()->with('success', 'Global attendance grace settings updated.');
    }
}
