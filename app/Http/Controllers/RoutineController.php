<?php

namespace App\Http\Controllers;

use Carbon\Carbon;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Exception;

class RoutineController extends Controller
{
    /**
     * Display Routine List
     */
    public function index(Request $request)
    {
        $query = DB::table('tblRoutine as ro')
            ->join('tblTeacher as t', 'ro.TeacherID', '=', 't.TeacherID')
            ->join('tblSubject as s', 'ro.SubjectID', '=', 's.SubjectID')
            ->join('tblBatch as b', 'ro.BatchID', '=', 'b.BatchID')
            ->join('tblRoom as r', 'ro.RoomID', '=', 'r.RoomID')
            ->join('tblDevice as d', 'ro.DeviceID', '=', 'd.DeviceID')
            ->select(
                'ro.*',
                't.TeacherName',
                's.SubjectName',
                'b.BatchName',
                'r.RoomNo',
                'd.DeviceName'
            );

        if ($request->filled('search')) {

            $query->where(function ($q) use ($request) {

                $q->where('t.TeacherName', 'like', "%{$request->search}%")
                    ->orWhere('s.SubjectName', 'like', "%{$request->search}%")
                    ->orWhere('b.BatchName', 'like', "%{$request->search}%")
                    ->orWhere('r.RoomNo', 'like', "%{$request->search}%")
                    ->orWhere('ro.DayName', 'like', "%{$request->search}%")
                    ->orWhere('ro.ClassType', 'like', "%{$request->search}%");
            });
        }

        if ($request->filled('date')) {
            $query->whereDate('ro.RoutineDate', $request->date);
        }

        $routines = $query
            ->orderByDesc('ro.RoutineDate')
            ->orderBy('ro.StartTime')
            ->paginate(20);

        return view('routines.index', compact('routines'));
    }

    /**
     * Show Create Form
     */
    public function create()
    {
        $teachers = DB::table('tblTeacher')->orderBy('TeacherName')->get();
        $subjects = DB::table('tblSubject')->orderBy('SubjectName')->get();
        $batches  = DB::table('tblBatch')->orderBy('BatchName')->get();
        $rooms    = DB::table('tblRoom')->orderBy('RoomNo')->get();
        $devices  = DB::table('tblDevice')->orderBy('DeviceName')->get();

        return view('routines.create', compact(
            'teachers',
            'subjects',
            'batches',
            'rooms',
            'devices'
        ));
    }

    /**
     * Store Routine
     */
    public function store(Request $request)
    {
        $request->validate([

            'RoutineDate' => 'required|date',

            'TeacherID' => 'required|exists:tblTeacher,TeacherID',

            'SubjectID' => 'required|exists:tblSubject,SubjectID',

            'BatchID' => 'required|exists:tblBatch,BatchID',

            'RoomID' => 'required|exists:tblRoom,RoomID',

            'DeviceID' => 'required|exists:tblDevice,DeviceID',

            'StartTime' => 'required|date_format:H:i',

            'EndTime' => 'required|date_format:H:i|after:StartTime',

            'GraceMinute' => 'nullable|integer|min:0',

            'DayName' => 'required|string|max:20',

            'ClassType' => 'nullable|string|max:30',

            'Remarks' => 'nullable|string',

            'Status' => 'required|boolean',

        ]);

        $conflict = $this->hasConflict($request);

        if ($conflict) {
            return back()
                ->withInput()
                ->with('error', 'Schedule conflict: Room or Teacher or Device is already booked at this time.');
        }

        try {

            DB::table('tblRoutine')->insert([

                'RoutineDate' => $request->RoutineDate,

                'TeacherID' => $request->TeacherID,

                'SubjectID' => $request->SubjectID,

                'BatchID' => $request->BatchID,

                'RoomID' => $request->RoomID,

                'DeviceID' => $request->DeviceID,

                'StartTime' => $request->StartTime,

                'EndTime' => $request->EndTime,

                'GraceMinute' => $request->GraceMinute ?? 0,

                'DayName' => $request->DayName,

                'ClassType' => $request->ClassType,

                'Remarks' => $request->Remarks,

                'Status' => $request->Status,

                'created_at' => now(),

                'updated_at' => now(),

            ]);

            return redirect()
                ->route('routines.index')
                ->with('success', 'Routine Added Successfully');
        } catch (Exception $e) {

            return back()
                ->withInput()
                ->with('error', $e->getMessage());
        }
    }

    /**
     * Display the specified Routine
     */
    public function show(string $id)
    {
        $routine = DB::table('tblRoutine as ro')
            ->join('tblTeacher as t', 'ro.TeacherID', '=', 't.TeacherID')
            ->join('tblSubject as s', 'ro.SubjectID', '=', 's.SubjectID')
            ->join('tblBatch as b', 'ro.BatchID', '=', 'b.BatchID')
            ->join('tblRoom as r', 'ro.RoomID', '=', 'r.RoomID')
            ->join('tblDevice as d', 'ro.DeviceID', '=', 'd.DeviceID')
            ->select(
                'ro.*',
                't.TeacherName',
                's.SubjectName',
                'b.BatchName',
                'r.RoomNo',
                'd.DeviceName'
            )
            ->where('ro.RoutineID', $id)
            ->first();

        if (!$routine) {
            abort(404);
        }

        return view('routines.show', compact('routine'));
    }

    /**
     * Show Edit Form
     */
    public function edit(string $id)
    {
        $routine = DB::table('tblRoutine')
            ->where('RoutineID', $id)
            ->first();

        if (!$routine) {
            abort(404);
        }

        $teachers = DB::table('tblTeacher')->orderBy('TeacherName')->get();
        $subjects = DB::table('tblSubject')->orderBy('SubjectName')->get();
        $batches  = DB::table('tblBatch')->orderBy('BatchName')->get();
        $rooms    = DB::table('tblRoom')->orderBy('RoomNo')->get();
        $devices  = DB::table('tblDevice')->orderBy('DeviceName')->get();
        $routine->StartTime = Carbon::parse($routine->StartTime)->format('H:i');
        $routine->EndTime = Carbon::parse($routine->EndTime)->format('H:i');
        return view('routines.edit', compact(
            'routine',
            'teachers',
            'subjects',
            'batches',
            'rooms',
            'devices'
        ));
    }

    /**
     * Update Routine
     */
    public function update(Request $request, string $id)
    {
        $request->validate([

            'RoutineDate' => 'required|date',

            'TeacherID' => 'required|exists:tblTeacher,TeacherID',

            'SubjectID' => 'required|exists:tblSubject,SubjectID',

            'BatchID' => 'required|exists:tblBatch,BatchID',

            'RoomID' => 'required|exists:tblRoom,RoomID',

            'DeviceID' => 'required|exists:tblDevice,DeviceID',

            'StartTime' => 'required|date_format:H:i',

            'EndTime' => 'required|date_format:H:i|after:StartTime',

            'GraceMinute' => 'nullable|integer|min:0',

            'DayName' => 'required|string|max:20',

            'ClassType' => 'nullable|string|max:30',

            'Remarks' => 'nullable|string',

            'Status' => 'required|boolean',

        ]);

        $conflict = $this->hasConflict($request, $id);

        if ($conflict) {
            return back()
                ->withInput()
                ->with('error', 'Schedule conflict: Room or Teacher or Device is already booked at this time.');
        }

        try {

            DB::table('tblRoutine')
                ->where('RoutineID', $id)
                ->update([

                    'RoutineDate' => $request->RoutineDate,

                    'TeacherID' => $request->TeacherID,

                    'SubjectID' => $request->SubjectID,

                    'BatchID' => $request->BatchID,

                    'RoomID' => $request->RoomID,

                    'DeviceID' => $request->DeviceID,

                    'StartTime' => $request->StartTime,

                    'EndTime' => $request->EndTime,

                    'GraceMinute' => $request->GraceMinute ?? 0,

                    'DayName' => $request->DayName,

                    'ClassType' => $request->ClassType,

                    'Remarks' => $request->Remarks,

                    'Status' => $request->Status,

                    'updated_at' => now(),

                ]);

            return redirect()
                ->route('routines.index')
                ->with('success', 'Routine Updated Successfully');
        } catch (Exception $e) {

            return back()
                ->withInput()
                ->with('error', $e->getMessage());
        }
    }

    /**
     * Delete Routine
     */
    public function destroy(string $id)
    {
        try {

            DB::table('tblRoutine')
                ->where('RoutineID', $id)
                ->delete();

            return redirect()
                ->route('routines.index')
                ->with('success', 'Routine Deleted Successfully');
        } catch (Exception $e) {

            return redirect()
                ->route('routines.index')
                ->with('error', $e->getMessage());
        }
    }

    /**
     * Check for overlapping Room / Teacher / Device bookings
     * on the same date and day, excluding the current record on update.
     */
    private function hasConflict(Request $request, $ignoreId = null)
    {
        $query = DB::table('tblRoutine')
            ->where('RoutineDate', $request->RoutineDate)
            ->where('Status', 1)
            ->where(function ($q) use ($request) {

                $q->where('RoomID', $request->RoomID)
                    ->orWhere('TeacherID', $request->TeacherID)
                    ->orWhere('DeviceID', $request->DeviceID);
            })
            ->where(function ($q) use ($request) {

                $q->where('StartTime', '<', $request->EndTime)
                    ->where('EndTime', '>', $request->StartTime);
            });

        if ($ignoreId) {
            $query->where('RoutineID', '!=', $ignoreId);
        }

        return $query->exists();
    }
}
