<?php

namespace Database\Seeders;

use App\Models\AttendanceLog;
use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\DB;

class AttendanceLogSeeder extends Seeder
{
    /**
     * Run the database seeds.
     */
    public function run(): void
    {
        // DB::table('tblAttendanceLog')->truncate();

        // $logs = [];

        // // Employees 1-10
        // for ($employee = 1; $employee <= 10; $employee++) {

        //     // 30 Days Attendance
        //     for ($day = 7; $day <= 30; $day++) {

        //         $date = "2026-06-" . str_pad($day, 2, '0', STR_PAD_LEFT);

        //         // Check In
        //         $logs[] = [
        //             'EmployeeID'     => $employee,
        //             'DeviceID'       => rand(1, 3),
        //             'DeviceSerialNo' => 'ZKT-00' . rand(1, 3),
        //             'PunchTime'      => $date . ' 08:' . rand(45, 59) . ':' . rand(10, 59),
        //             'PunchState'     => 0,
        //             'VerifyMode'     => 15,
        //             'WorkCode'       => null,
        //             'Temperature'    => 32.32,
        //             'Mask'           => rand(0, 1),
        //             'UploadSource'   => 'Seeder',
        //             'SyncTime'       => now(),
        //             'IsProcessed'    => 0,
        //             'created_at'     => now(),
        //             'updated_at'     => now(),
        //         ];

        //         // Check Out
        //         $logs[] = [
        //             'EmployeeID'     => $employee,
        //             'DeviceID'       => rand(1, 3),
        //             'DeviceSerialNo' => 'ZKT-00' . rand(1, 3),
        //             'PunchTime'      => $date . ' 17:' . rand(0, 25) . ':' . rand(10, 59),
        //             'PunchState'     => 1,
        //             'VerifyMode'     => 15,
        //             'WorkCode'       => null,
        //             'Temperature'    => 32.32,
        //             'Mask'           => rand(0, 1),
        //             'UploadSource'   => 'Seeder',
        //             'SyncTime'       => now(),
        //             'IsProcessed'    => 0,
        //             'created_at'     => now(),
        //             'updated_at'     => now(),
        //         ];
        //     }
        // }

        // collect($logs)
        //     ->chunk(50)
        //     ->each(function ($chunk) {
        //         DB::table('tblAttendanceLog')->insert($chunk->toArray());
        //     });


        // Teacher 1/ Class 1
        AttendanceLog::create([
            'EmployeeID'     => 1,
            'DeviceID'       => 1,
            'DeviceSerialNo' => 'ZKT-001',
            'PunchTime'      => '2026-07-06 ' . '10:03:00',
            'PunchState'     => 1,
            'VerifyMode'     => 0,
            'WorkCode'       => null,
            'Temperature'    => 36.5,
            'Mask'           => 0,
            'UploadSource'   => 'Seeder',
            'SyncTime'       => now(),
            'IsProcessed'    => 0,
        ]);
        AttendanceLog::create([
            'EmployeeID'     => 1,
            'DeviceID'       => 1,
            'DeviceSerialNo' => 'ZKT-001',
            'PunchTime'      => '2026-07-06 ' . '11:29:00',
            'PunchState'     => 1,
            'VerifyMode'     => 0,
            'WorkCode'       => null,
            'Temperature'    => 36.5,
            'Mask'           => 0,
            'UploadSource'   => 'Seeder',
            'SyncTime'       => now(),
            'IsProcessed'    => 0,
        ]);
        // Teacher 2 / Class 1
        AttendanceLog::create([
            'EmployeeID'     => 2,
            'DeviceID'       => 2,
            'DeviceSerialNo' => 'ZKT-002',
            'PunchTime'      => '2026-07-06 ' . '12:03:00',
            'PunchState'     => 1,
            'VerifyMode'     => 0,
            'WorkCode'       => null,
            'Temperature'    => 36.5,
            'Mask'           => 0,
            'UploadSource'   => 'Seeder',
            'SyncTime'       => now(),
            'IsProcessed'    => 0,
        ]);
        AttendanceLog::create([
            'EmployeeID'     => 2,
            'DeviceID'       => 2,
            'DeviceSerialNo' => 'ZKT-002',
            'PunchTime'      => '2026-07-06 ' . '14:29:00',
            'PunchState'     => 1,
            'VerifyMode'     => 0,
            'WorkCode'       => null,
            'Temperature'    => 36.5,
            'Mask'           => 0,
            'UploadSource'   => 'Seeder',
            'SyncTime'       => now(),
            'IsProcessed'    => 0,
        ]);
        // Teacher 1 / Class 2
        AttendanceLog::create([
            'EmployeeID'     => 1,
            'DeviceID'       => 6,
            'DeviceSerialNo' => 'ZKT-006',
            'PunchTime'      => '2026-07-06 ' . '12:03:00',
            'PunchState'     => 1,
            'VerifyMode'     => 0,
            'WorkCode'       => null,
            'Temperature'    => 36.5,
            'Mask'           => 0,
            'UploadSource'   => 'Seeder',
            'SyncTime'       => now(),
            'IsProcessed'    => 0,
        ]);
        AttendanceLog::create([
            'EmployeeID'     => 1,
            'DeviceID'       => 6,
            'DeviceSerialNo' => 'ZKT-006',
            'PunchTime'      => '2026-07-06 ' . '13:25:00',
            'PunchState'     => 1,
            'VerifyMode'     => 0,
            'WorkCode'       => null,
            'Temperature'    => 36.5,
            'Mask'           => 0,
            'UploadSource'   => 'Seeder',
            'SyncTime'       => now(),
            'IsProcessed'    => 0,
        ]);
        // Teacher 1 / Class 3
        AttendanceLog::create([
            'EmployeeID'     => 1,
            'DeviceID'       => 2,
            'DeviceSerialNo' => 'ZKT-002',
            'PunchTime'      => '2026-07-06 ' . '14:34:00',
            'PunchState'     => 1,
            'VerifyMode'     => 0,
            'WorkCode'       => null,
            'Temperature'    => 36.5,
            'Mask'           => 0,
            'UploadSource'   => 'Seeder',
            'SyncTime'       => now(),
            'IsProcessed'    => 0,
        ]);
        AttendanceLog::create([
            'EmployeeID'     => 1,
            'DeviceID'       => 2,
            'DeviceSerialNo' => 'ZKT-002',
            'PunchTime'      => '2026-07-06 ' . '16:28:00',
            'PunchState'     => 1,
            'VerifyMode'     => 0,
            'WorkCode'       => null,
            'Temperature'    => 36.5,
            'Mask'           => 0,
            'UploadSource'   => 'Seeder',
            'SyncTime'       => now(),
            'IsProcessed'    => 0,
        ]);
    }
}
