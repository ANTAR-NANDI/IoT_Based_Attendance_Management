<?php

namespace App\Http\Controllers;

use Barryvdh\DomPDF\Facade\Pdf;
use Carbon\Carbon;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;

class RoutineController extends Controller
{
    private const CLASS_DAYS = ['Sunday', 'Monday', 'Tuesday', 'Wednesday', 'Thursday'];

    public function index(Request $request)
    {
        $routines = $this->query($request)->orderBy('b.BatchName')->orderBy('ro.DayName')->orderBy('ro.StartTime')->paginate(30);
        return view('routines.index', compact('routines'));
    }

    public function exportPdf(Request $request)
    {
        $routines = $this->query($request)->orderBy('b.BatchName')->orderBy('ro.DayName')->orderBy('ro.StartTime')->get();
        return Pdf::loadView('routines.pdf', compact('routines'))->setPaper('a4', 'landscape')->download('semester-routine-'.now()->format('Y-m-d-His').'.pdf');
    }

    public function create() { return view('routines.create', $this->formData()); }

    public function store(Request $request)
    {
        $data = $this->validated($request);
        if ($this->hasConflict($data)) return back()->withInput()->with('error', 'Schedule conflict: this teacher, batch, room, or device already has an overlapping class during this semester.');
        DB::table('tblRoutine')->insert([...$data, 'RoutineDate' => $data['SemesterStartDate'], 'GraceMinute' => 0, 'created_at' => now(), 'updated_at' => now()]);
        return redirect()->route('routines.index')->with('success', 'Semester routine slot added. It repeats weekly on the selected day until the semester ends.');
    }

    public function edit(string $id)
    {
        $routine = DB::table('tblRoutine')->where('RoutineID', $id)->first();
        abort_unless($routine, 404);
        return view('routines.edit', [...$this->formData(), 'routine' => $routine]);
    }

    public function update(Request $request, string $id)
    {
        $data = $this->validated($request);
        if ($this->hasConflict($data, $id)) return back()->withInput()->with('error', 'Schedule conflict: this teacher, batch, room, or device already has an overlapping class during this semester.');
        DB::table('tblRoutine')->where('RoutineID', $id)->update([...$data, 'RoutineDate' => $data['SemesterStartDate'], 'GraceMinute' => 0, 'updated_at' => now()]);
        return redirect()->route('routines.index')->with('success', 'Semester routine slot updated.');
    }

    public function destroy(string $id)
    {
        DB::table('tblRoutine')->where('RoutineID', $id)->delete();
        return redirect()->route('routines.index')->with('success', 'Routine slot deleted.');
    }

    private function query(Request $request)
    {
        return DB::table('tblRoutine as ro')->join('tblTeacher as t', 'ro.TeacherID', '=', 't.TeacherID')->join('tblSubject as s', 'ro.SubjectID', '=', 's.SubjectID')->join('tblBatch as b', 'ro.BatchID', '=', 'b.BatchID')->join('tblRoom as r', 'ro.RoomID', '=', 'r.RoomID')->join('tblDevice as d', 'ro.DeviceID', '=', 'd.DeviceID')->select('ro.*', 't.TeacherName', 's.SubjectName', 'b.BatchName', 'b.Semester', 'r.RoomNo', 'd.DeviceName')
            ->when($request->filled('search'), function ($query) use ($request) { $term = $request->search; $query->where(fn ($q) => $q->where('t.TeacherName','like',"%{$term}%")->orWhere('s.SubjectName','like',"%{$term}%")->orWhere('b.BatchName','like',"%{$term}%")->orWhere('ro.DayName','like',"%{$term}%")); })
            ->when($request->filled('BatchID'), fn ($q) => $q->where('ro.BatchID', $request->BatchID));
    }

    private function formData(): array
    {
        return ['teachers' => DB::table('tblTeacher')->orderBy('TeacherName')->get(), 'subjects' => DB::table('tblSubject')->orderBy('SubjectName')->get(), 'batches' => DB::table('tblBatch')->where('Status', 1)->orderBy('BatchName')->get(), 'rooms' => DB::table('tblRoom')->orderBy('RoomNo')->get(), 'devices' => DB::table('tblDevice')->where('Status', 1)->orderBy('DeviceName')->get(), 'classDays' => self::CLASS_DAYS];
    }

    private function validated(Request $request): array
    {
        $data = $request->validate(['SemesterStartDate' => 'required|date', 'SemesterEndDate' => 'required|date|after:SemesterStartDate', 'DayName' => 'required|in:Sunday,Monday,Tuesday,Wednesday,Thursday', 'TeacherID' => 'required|exists:tblTeacher,TeacherID', 'ProxyTeacherID' => 'nullable|exists:tblTeacher,TeacherID|different:TeacherID', 'SubjectID' => 'required|exists:tblSubject,SubjectID', 'BatchID' => 'required|exists:tblBatch,BatchID', 'RoomID' => 'required|exists:tblRoom,RoomID', 'DeviceID' => 'required|exists:tblDevice,DeviceID', 'StartTime' => 'required|date_format:H:i', 'EndTime' => 'required|date_format:H:i|after:StartTime', 'ClassType' => 'nullable|string|max:30', 'Remarks' => 'nullable|string', 'Status' => 'required|boolean']);
        if (Carbon::parse($data['SemesterStartDate'])->diffInMonths(Carbon::parse($data['SemesterEndDate'])) > 6) abort(422, 'A semester routine may not exceed six months.');
        return $data;
    }

    private function hasConflict(array $data, ?string $ignoreId = null): bool
    {
        $query = DB::table('tblRoutine')->where('Status', 1)->where('DayName', $data['DayName'])->where('SemesterStartDate', '<=', $data['SemesterEndDate'])->where('SemesterEndDate', '>=', $data['SemesterStartDate'])->where(fn ($q) => $q->where('TeacherID', $data['TeacherID'])->orWhere('BatchID', $data['BatchID'])->orWhere('RoomID', $data['RoomID'])->orWhere('DeviceID', $data['DeviceID']))->where('StartTime', '<', $data['EndTime'])->where('EndTime', '>', $data['StartTime']);
        return ($ignoreId ? $query->where('RoutineID', '!=', $ignoreId) : $query)->exists();
    }
}
