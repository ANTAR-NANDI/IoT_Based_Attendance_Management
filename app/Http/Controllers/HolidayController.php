<?php

namespace App\Http\Controllers;

use Exception;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;

class HolidayController extends Controller
{
    public function index()
    {
        $holidays = DB::table('tblHolidaySetup')
            ->orderBy('id', 'DESC')
            ->paginate(10);
        $weeklyHolidayDays = collect(json_decode(
            DB::table('tblHolidaySetting')->where('id', 1)->value('WeeklyHolidayDays') ?? '[]',
            true
        ))->map(fn ($day) => (int) $day)->all();

        return view('holidays.index', compact('holidays', 'weeklyHolidayDays'));
    }

    public function updateWeeklySettings(Request $request)
    {
        $data = $request->validate([
            'WeeklyHolidayDays' => ['nullable', 'array'],
            'WeeklyHolidayDays.*' => ['integer', 'between:0,6'],
        ]);

        DB::table('tblHolidaySetting')->updateOrInsert(
            ['id' => 1],
            [
                'WeeklyHolidayDays' => json_encode(array_values(array_unique($data['WeeklyHolidayDays'] ?? []))),
                'updated_at' => now(),
                'created_at' => now(),
            ]
        );

        return redirect()->route('holidays.index')->with('success', 'Weekly holiday settings updated successfully.');
    }

    public function create()
    {
        return view('holidays.create');
    }

    public function store(Request $request)
    {
        $request->validate([
            'HolidayName' => 'required',
            'holidaydate' => 'required|date',
            'type' => 'required',
        ]);

        try {
            DB::table('tblHolidaySetup')->insert([
                'HolidayName' => $request->HolidayName,
                'holidaydate' => $request->holidaydate,
                'strDescription' => $request->strDescription,
                'type' => $request->type,
                'created_at' => now(),
                'updated_at' => now(),
            ]);

            return redirect()
                ->route('holidays.index')
                ->with('success', 'Holiday Added Successfully');
        } catch (Exception $e) {
            return back()
                ->withInput()
                ->with('error', $e->getMessage());
        }
    }

    public function edit($id)
    {
        $holiday = DB::table('tblHolidaySetup')
            ->where('id', $id)
            ->first();

        if (!$holiday) {
            abort(404);
        }

        return view('holidays.edit', compact('holiday'));
    }

    public function update(Request $request, $id)
    {
        $request->validate([
            'HolidayName' => 'required',
            'holidaydate' => 'required|date',
            'type' => 'required',
        ]);

        try {
            $holiday = DB::table('tblHolidaySetup')
                ->where('id', $id)
                ->first();

            if (!$holiday) {
                return back()->with('error', 'Holiday not found');
            }

            DB::table('tblHolidaySetup')
                ->where('id', $id)
                ->update([
                    'HolidayName' => $request->HolidayName,
                    'holidaydate' => $request->holidaydate,
                    'strDescription' => $request->strDescription,
                    'type' => $request->type,
                    'updated_at' => now(),
                ]);

            return redirect()
                ->route('holidays.index')
                ->with('success', 'Holiday Updated Successfully');
        } catch (Exception $e) {
            return back()
                ->withInput()
                ->with('error', $e->getMessage());
        }
    }

    public function destroy($id)
    {
        try {
            DB::table('tblHolidaySetup')
                ->where('id', $id)
                ->delete();

            return redirect()
                ->route('holidays.index')
                ->with('success', 'Holiday Deleted Successfully');
        } catch (Exception $e) {
            return redirect()
                ->route('holidays.index')
                ->with('error', 'Unable to delete Holiday.');
        }
    }
}
