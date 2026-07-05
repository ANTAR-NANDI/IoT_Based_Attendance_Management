<?php

namespace App\Http\Controllers;

use App\Models\AttendanceLog;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Exception;
use Carbon\Carbon;
use Illuminate\Pagination\LengthAwarePaginator;

class AttendanceLogController extends Controller
{
    private const EARLY_PUNCH_BUFFER_MIN = 15;
    private const LATE_PUNCH_BUFFER_MIN = 20;
    // /**
    //  * Attendance Log List
    //  */
    // public function index(Request $request)
    // {
    //     $query = DB::table('tblAttendanceLog as a')
    //         ->leftJoin('tblEmployee as e', 'a.EmployeeID', '=', 'e.User_id')
    //         ->leftJoin('tblDevice as d', 'a.DeviceID', '=', 'd.DeviceID')
    //         ->select(
    //             'a.*',
    //             'e.strName',
    //             'd.DeviceName'
    //         );

    //     if ($request->filled('search')) {

    //         $search = $request->search;

    //         $query->where(function ($q) use ($search) {

    //             $q->where('e.strName', 'like', "%{$search}%")
    //                 ->orWhere('a.EmployeeID', 'like', "%{$search}%")
    //                 ->orWhere('d.DeviceName', 'like', "%{$search}%")
    //                 ->orWhere('a.DeviceSerialNo', 'like', "%{$search}%");
    //         });
    //     }

    //     $attendanceLogs = $query
    //         ->orderByDesc('PunchTime')
    //         ->paginate(30);

    //     return view('attendance_logs.index', compact('attendanceLogs'));
    // }

    // /**
    //  * Sync Attendance From ZKT API
    //  */
    // public function sync()
    // {
    //     try {

    //         $baseUrl  = config('services.zk.url');
    //         $endpoint = config('services.zk.endpoint');

    //         $username = config('services.zk.username');
    //         $password = config('services.zk.password');

    //         /*
    //         -----------------------------------------------------
    //         Login (if required)
    //         -----------------------------------------------------
    //         */

    //         // Example
    //         //
    //         // $token = Http::post($baseUrl.'/login',[
    //         //     'username'=>$username,
    //         //     'password'=>$password
    //         // ])->json('token');

    //         /*
    //         -----------------------------------------------------
    //         Attendance API
    //         -----------------------------------------------------
    //         */

    //         $response = Http::timeout(60)

    //             // ->withToken($token)

    //             ->get($baseUrl . $endpoint);

    //         if (!$response->successful()) {

    //             throw new Exception('Unable to connect to ZKT API');
    //         }

    //         $logs = $response->json();

    //         /*
    //         -----------------------------------------------------
    //         Save Data
    //         -----------------------------------------------------
    //         */

    //         foreach ($logs as $log) {

    //             AttendanceLog::updateOrCreate(

    //                 [
    //                     'EmployeeID'     => $log['employee_id'],
    //                     'PunchTime'      => $log['punch_time'],
    //                     'DeviceSerialNo' => $log['serial_no'],
    //                 ],

    //                 [

    //                     'DeviceID'       => $log['device_id'] ?? null,

    //                     'PunchState'     => $log['punch_state'] ?? null,

    //                     'VerifyMode'     => $log['verify_mode'] ?? null,

    //                     'WorkCode'       => $log['work_code'] ?? null,

    //                     'Temperature'    => $log['temperature'] ?? null,

    //                     'Mask'           => $log['mask'] ?? null,

    //                     'UploadSource'   => 'ZKTeco',

    //                     'SyncTime'       => now(),

    //                 ]

    //             );
    //         }

    //         return redirect()
    //             ->route('attendance-logs.index')
    //             ->with('success', 'Attendance synchronized successfully.');
    //     } catch (Exception $e) {

    //         return redirect()
    //             ->route('attendance-logs.index')
    //             ->with('error', $e->getMessage());
    //     }
    // }

    public function classAttendance(Request $request)
    {
        $request->validate([
            'from_date' => 'nullable|date',
            'to_date'   => 'nullable|date',
            'TeacherID' => 'nullable|exists:tblTeacher,TeacherID',
            'BatchID'   => 'nullable|exists:tblBatch,BatchID',
        ]);

        $fromDate = $request->input('from_date', now()->toDateString());
        $toDate   = $request->input('to_date', $fromDate);

        // 1. Pull the scheduled classes in range, with names attached
        $routineQuery = DB::table('tblRoutine as ro')
            ->join('tblTeacher as t', 'ro.TeacherID', '=', 't.TeacherID')
            ->join('tblSubject as s', 'ro.SubjectID', '=', 's.SubjectID')
            ->join('tblBatch as b', 'ro.BatchID', '=', 'b.BatchID')
            ->join('tblRoom as r', 'ro.RoomID', '=', 'r.RoomID')
            ->select(
                'ro.*',
                't.TeacherName',
                't.TeacherID', // <-- adjust column name here if different
                's.SubjectName',
                'b.BatchName',
                'r.RoomNo'
            )
            // ->whereBetween('ro.RoutineDate', [$fromDate, $toDate])
            ->where('ro.Status', 1);

        if ($request->filled('TeacherID')) {
            $routineQuery->where('ro.TeacherID', $request->TeacherID);
        }

        if ($request->filled('BatchID')) {
            $routineQuery->where('ro.BatchID', $request->BatchID);
        }

        $routines = $routineQuery
            ->orderBy('ro.RoutineDate')
            ->orderBy('ro.StartTime')
            ->get();
        //dd($routines);

        if ($routines->isEmpty()) {

            $report = new LengthAwarePaginator(
                [],
                0,
                15,
                1,
                [
                    'path' => $request->url(),
                    'query' => $request->query(),
                ]
            );

            return view('reports.attendance', [
                'report' => $report,
                'summary' => collect(),
                'fromDate' => $fromDate,
                'toDate' => $toDate,
            ]);
        }

        // 2. Pull ALL punches once for the whole date range + device set,
        //    instead of querying per-routine (avoids N+1 on a busy schedule).
        $deviceIds = $routines->pluck('DeviceID')->values();

        $searchStart = Carbon::parse($fromDate)->subMinutes(self::EARLY_PUNCH_BUFFER_MIN);
        $searchEnd   = Carbon::parse($toDate)->endOfDay()->addMinutes(self::LATE_PUNCH_BUFFER_MIN);
        $logs = DB::table('tblAttendanceLog') // <-- adjust table name if different
            ->whereIn('DeviceID', $deviceIds)
            ->whereBetween('PunchTime', [$searchStart, $searchEnd])
            ->orderBy('PunchTime')
            ->get()
            ->groupBy('DeviceID');
        // dd($logs);

        // 3. Reconcile each scheduled class against the punches on its device
        $report = $routines->map(function ($routine) use ($logs) {

            $classStart = Carbon::parse($routine->RoutineDate . ' ' . $routine->StartTime);
            $classEnd   = Carbon::parse($routine->RoutineDate . ' ' . $routine->EndTime);

            $windowStart = $classStart->copy()->subMinutes(self::EARLY_PUNCH_BUFFER_MIN);
            $windowEnd   = $classEnd->copy()->addMinutes(self::LATE_PUNCH_BUFFER_MIN);
            $deviceLogs = ($logs->get($routine->DeviceID) ?? collect())
                ->filter(function ($log) use ($windowStart, $windowEnd) {
                    $t = Carbon::parse($log->PunchTime);
                    return $t->greaterThanOrEqualTo($windowStart) && $t->lessThanOrEqualTo($windowEnd);
                })
                ->values();

            $result = [
                'RoutineID'     => $routine->RoutineID,
                'RoutineDate'   => $routine->RoutineDate,
                'DayName'       => $routine->DayName,
                'StartTime'     => $routine->StartTime,
                'EndTime'       => $routine->EndTime,
                'SubjectName'   => $routine->SubjectName,
                'BatchName'     => $routine->BatchName,
                'RoomNo'        => $routine->RoomNo,
                'AssignedTeacher' => $routine->TeacherName,
                'ActualTeacher'   => null,
                'Status'        => 'Absent',
                'CheckIn'       => null,
                'CheckOut'      => null,
                'ScheduledMinutes' => $classStart->diffInMinutes($classEnd),
                'ActualMinutes'    => null,
                'LateByMinutes'    => null,
                'LeftEarlyByMinutes' => null,
            ];

            if ($deviceLogs->isEmpty()) {
                return $result; // stays "Absent" — nobody punched at all
            }

            $assignedLogs = $deviceLogs->where('EmployeeID', $routine->TeacherID)->values();
            // dd($assignedLogs[0]->EmployeeID);
            // if ($assignedLogs[0]->EmployeeID == 1 && $assignedLogs[0]->DeviceID == 2) {
            //     dd($assignedLogs);
            //     dd(Carbon::parse($assignedLogs->last()->PunchTime));
            // }

            if ($assignedLogs->isNotEmpty()) {
                // dd("IN");
                // Assigned teacher actually punched in — this is a genuine class
                $checkIn  = Carbon::parse($assignedLogs->first()->PunchTime);
                $checkOut = $assignedLogs->count() > 0
                    ? Carbon::parse($assignedLogs->last()->PunchTime)
                    : null;

                $result['ActualTeacher'] = $routine->TeacherName;
                $result['Status']        = $checkOut ? 'Present' : 'Incomplete Punch';
                $result['CheckIn']       = $checkIn->format('h:i A');
                $result['CheckOut']      = $checkOut?->format('h:i A');
                $result['ActualMinutes'] = $checkOut ? $checkIn->diffInMinutes($checkOut) : null;

                $graceDeadline = $classStart->copy()->addMinutes((int) $routine->GraceMinute);
                if ($checkIn->greaterThan($graceDeadline)) {
                    $result['LateByMinutes'] = $graceDeadline->diffInMinutes($checkIn);
                }

                if ($checkOut && $checkOut->lessThan($classEnd)) {
                    $result['LeftEarlyByMinutes'] = $checkOut->diffInMinutes($classEnd);
                }
            } else {
                // Someone punched on this device/time, but not the assigned teacher
                $otherEmployeeIds = $deviceLogs->pluck('EmployeeID')->unique()->values();

                $proxyTeacher = DB::table('tblTeacher')
                    ->whereIn('EmployeeID', $otherEmployeeIds) // <-- same column assumption as above
                    ->pluck('TeacherName')
                    ->implode(', ');

                $checkIn  = Carbon::parse($deviceLogs->first()->PunchTime);
                $checkOut = $deviceLogs->count() > 1
                    ? Carbon::parse($deviceLogs->last()->PunchTime)
                    : null;

                $result['ActualTeacher'] = $proxyTeacher ?: 'Unknown (Employee ID: ' . $otherEmployeeIds->implode(', ') . ')';
                $result['Status']        = 'Proxy';
                $result['CheckIn']       = $checkIn->format('h:i A');
                $result['CheckOut']      = $checkOut?->format('h:i A');
                $result['ActualMinutes'] = $checkOut ? $checkIn->diffInMinutes($checkOut) : null;
            }

            return $result;
        });

        // 4. Per-teacher summary rolled up from the detail report
        $summary = $report
            ->groupBy('AssignedTeacher')
            ->map(function ($rows, $teacherName) {
                return [
                    'TeacherName'       => $teacherName,
                    'TotalClasses'      => $rows->count(),
                    'Present'           => $rows->where('Status', 'Present')->count(),
                    'Absent'            => $rows->where('Status', 'Absent')->count(),
                    'Proxy'             => $rows->where('Status', 'Proxy')->count(),
                    'Incomplete'        => $rows->where('Status', 'Incomplete Punch')->count(),
                    'ScheduledMinutes'  => $rows->sum('ScheduledMinutes'),
                    'ActualMinutes'     => $rows->sum('ActualMinutes'),
                ];
            })
            ->values();
        $perPage = 15;
        $page = LengthAwarePaginator::resolveCurrentPage();

        $report = new LengthAwarePaginator(
            $report->slice(($page - 1) * $perPage, $perPage)->values(),
            $report->count(),
            $perPage,
            $page,
            [
                'path'  => $request->url(),
                'query' => $request->query(),
            ]
        );

        return view('reports.attendance', compact('report', 'summary', 'fromDate', 'toDate'));
    }
}
