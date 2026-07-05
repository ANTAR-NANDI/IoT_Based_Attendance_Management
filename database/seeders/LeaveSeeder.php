<?php

namespace Database\Seeders;

use Carbon\Carbon;
use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\DB;

class LeaveSeeder extends Seeder
{
    public function run(): void
    {
        DB::table('tblLeave')->delete();

        $teachers = DB::table('tblTeacher')->get();

        if ($teachers->isEmpty()) {
            return;
        }

        $statuses = [
            'Pending',
            'Approved',
            'Rejected'
        ];

        $records = [];

        foreach ($teachers as $teacher) {

            $leaveCount = rand(0, 3);

            for ($i = 0; $i < $leaveCount; $i++) {

                $from = Carbon::create(2026, rand(1, 12), rand(1, 24));

                $days = rand(1, 5);

                $to = (clone $from)->addDays($days - 1);

                $status = $statuses[array_rand($statuses)];

                $records[] = [

                    'empID' => $teacher->EmployeeID,

                    'empType' => 'Teacher',

                    'leave_type_id' => rand(1, 7),

                    'leave_from' => $from->toDateString(),

                    'leave_to' => $to->toDateString(),

                    'total_days' => $days,

                    'reason' => fake()->sentence(),

                    'status' => $status,

                    'approved_by' => $status == 'Pending'
                        ? null
                        : 'Admin',

                    'approved_at' => $status == 'Pending'
                        ? null
                        : now(),

                    'created_at' => now(),

                    'updated_at' => now(),

                ];
            }
        }

        DB::table('tblLeave')->insert($records);
    }
}
