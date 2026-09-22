<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Illuminate\Validation\Rule;

class RosterLocationController extends Controller
{
    public function index()
    {
        $locations = DB::table('tblRosterLocation')->orderBy('LocationName')->paginate(20);
        return view('roster.locations.index', compact('locations'));
    }
    public function create() { return view('roster.locations.form', ['location' => null]); }
    public function store(Request $request) { DB::table('tblRosterLocation')->insert($this->validated($request) + ['created_at' => now(), 'updated_at' => now()]); return redirect()->route('roster.locations.index')->with('success', 'Roster location added.'); }
    public function edit(int $id) { $location = DB::table('tblRosterLocation')->where('RosterLocationID', $id)->firstOrFail(); return view('roster.locations.form', compact('location')); }
    public function update(Request $request, int $id) { DB::table('tblRosterLocation')->where('RosterLocationID', $id)->update($this->validated($request, $id) + ['updated_at' => now()]); return redirect()->route('roster.locations.index')->with('success', 'Roster location updated.'); }
    private function validated(Request $request, $id = null): array { return $request->validate(['LocationName' => ['required', 'max:120', Rule::unique('tblRosterLocation', 'LocationName')->ignore($id, 'RosterLocationID')], 'LocationType' => ['nullable', 'max:50'], 'Description' => ['nullable', 'max:255'], 'Status' => ['required', 'boolean']]); }
}
