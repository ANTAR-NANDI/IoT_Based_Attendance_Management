<?php

namespace App\Http\Controllers;

use App\Models\AttendanceLog;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Exception;

class AttendanceLogController extends Controller
{
    /**
     * Attendance Log List
     */
    public function index(Request $request)
    {
        $query = DB::table('tblAttendanceLog as a')
            ->leftJoin('tblEmployee as e', 'a.EmployeeID', '=', 'e.User_id')
            ->leftJoin('tblDevice as d', 'a.DeviceID', '=', 'd.DeviceID')
            ->select(
                'a.*',
                'e.strName',
                'd.DeviceName'
            );

        if ($request->filled('search')) {

            $search = $request->search;

            $query->where(function ($q) use ($search) {

                $q->where('e.strName', 'like', "%{$search}%")
                    ->orWhere('a.EmployeeID', 'like', "%{$search}%")
                    ->orWhere('d.DeviceName', 'like', "%{$search}%")
                    ->orWhere('a.DeviceSerialNo', 'like', "%{$search}%");
            });
        }

        $attendanceLogs = $query
            ->orderByDesc('PunchTime')
            ->paginate(30);

        return view('attendance_logs.index', compact('attendanceLogs'));
    }

    /**
     * Sync Attendance From ZKT API
     */
    public function sync()
    {
        try {

            $baseUrl  = config('services.zk.url');
            $endpoint = config('services.zk.endpoint');

            $username = config('services.zk.username');
            $password = config('services.zk.password');

            /*
            -----------------------------------------------------
            Login (if required)
            -----------------------------------------------------
            */

            // Example
            //
            // $token = Http::post($baseUrl.'/login',[
            //     'username'=>$username,
            //     'password'=>$password
            // ])->json('token');

            /*
            -----------------------------------------------------
            Attendance API
            -----------------------------------------------------
            */

            $response = Http::timeout(60)

                // ->withToken($token)

                ->get($baseUrl . $endpoint);

            if (!$response->successful()) {

                throw new Exception('Unable to connect to ZKT API');
            }

            $logs = $response->json();

            /*
            -----------------------------------------------------
            Save Data
            -----------------------------------------------------
            */

            foreach ($logs as $log) {

                AttendanceLog::updateOrCreate(

                    [
                        'EmployeeID'     => $log['employee_id'],
                        'PunchTime'      => $log['punch_time'],
                        'DeviceSerialNo' => $log['serial_no'],
                    ],

                    [

                        'DeviceID'       => $log['device_id'] ?? null,

                        'PunchState'     => $log['punch_state'] ?? null,

                        'VerifyMode'     => $log['verify_mode'] ?? null,

                        'WorkCode'       => $log['work_code'] ?? null,

                        'Temperature'    => $log['temperature'] ?? null,

                        'Mask'           => $log['mask'] ?? null,

                        'UploadSource'   => 'ZKTeco',

                        'SyncTime'       => now(),

                    ]

                );
            }

            return redirect()
                ->route('attendance-logs.index')
                ->with('success', 'Attendance synchronized successfully.');
        } catch (Exception $e) {

            return redirect()
                ->route('attendance-logs.index')
                ->with('error', $e->getMessage());
        }
    }
}
