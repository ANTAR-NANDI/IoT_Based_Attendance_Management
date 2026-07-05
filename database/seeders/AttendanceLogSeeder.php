<?php

namespace Database\Seeders;

use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\DB;

class AttendanceLogSeeder extends Seeder
{
    /**
     * Run the database seeds.
     */
    public function run(): void
    {
        DB::table('tblAttendanceLog')->truncate();

        $logs = [];

        // Employees 1-10
        for ($employee = 1; $employee <= 10; $employee++) {

            // 30 Days Attendance
            for ($day = 7; $day <= 30; $day++) {

                $date = "2026-06-" . str_pad($day, 2, '0', STR_PAD_LEFT);

                // Check In
                $logs[] = [
                    'EmployeeID'     => $employee,
                    'DeviceID'       => rand(1, 3),
                    'DeviceSerialNo' => 'ZKT-00' . rand(1, 3),
                    'PunchTime'      => $date . ' 08:' . rand(45, 59) . ':' . rand(10, 59),
                    'PunchState'     => 0,
                    'VerifyMode'     => 15,
                    'WorkCode'       => null,
                    'Temperature'    => 32.32,
                    'Mask'           => rand(0, 1),
                    'UploadSource'   => 'Seeder',
                    'SyncTime'       => now(),
                    'IsProcessed'    => 0,
                    'created_at'     => now(),
                    'updated_at'     => now(),
                ];

                // Check Out
                $logs[] = [
                    'EmployeeID'     => $employee,
                    'DeviceID'       => rand(1, 3),
                    'DeviceSerialNo' => 'ZKT-00' . rand(1, 3),
                    'PunchTime'      => $date . ' 17:' . rand(0, 25) . ':' . rand(10, 59),
                    'PunchState'     => 1,
                    'VerifyMode'     => 15,
                    'WorkCode'       => null,
                    'Temperature'    => 32.32,
                    'Mask'           => rand(0, 1),
                    'UploadSource'   => 'Seeder',
                    'SyncTime'       => now(),
                    'IsProcessed'    => 0,
                    'created_at'     => now(),
                    'updated_at'     => now(),
                ];
            }
        }

        collect($logs)
            ->chunk(50)
            ->each(function ($chunk) {
                DB::table('tblAttendanceLog')->insert($chunk->toArray());
            });
    }
}
