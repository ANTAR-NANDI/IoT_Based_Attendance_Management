<?php
namespace App\Http\Controllers;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
class RosterSettingController extends Controller {
    public function edit() { $settings = DB::table('tblRosterSetting')->where('id', 1)->firstOrFail(); return view('roster.settings.edit', compact('settings')); }
    public function update(Request $request) { $data = $request->validate(['EntryEarlyMinutes' => ['required','integer','min:0','max:240'], 'EntryLateMinutes' => ['required','integer','min:0','max:240'], 'ExitEarlyMinutes' => ['required','integer','min:0','max:240'], 'ExitLateMinutes' => ['required','integer','min:0','max:240']]); DB::table('tblRosterSetting')->where('id', 1)->update($data + ['updated_at' => now()]); return back()->with('success', 'Global roster grace time updated.'); }
}
