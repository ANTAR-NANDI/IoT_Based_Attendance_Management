<?php

namespace Database\Seeders;

use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\DB;

class LeaveTypeSeeder extends Seeder
{
    public function run(): void
    {
        DB::table('tblLeaveType')->delete();

        DB::table('tblLeaveType')->insert([

            [
                'name' => 'Casual Leave',
                'days' => 10,
                'IsPaid' => 1,
                'Remarks' => 'Annual casual leave',
                'created_at' => now(),
                'updated_at' => now(),
            ],

            [
                'name' => 'Sick Leave',
                'days' => 14,
                'IsPaid' => 1,
                'Remarks' => 'Medical leave',
                'created_at' => now(),
                'updated_at' => now(),
            ],

            [
                'name' => 'Earned Leave',
                'days' => 20,
                'IsPaid' => 1,
                'Remarks' => 'Accumulated earned leave',
                'created_at' => now(),
                'updated_at' => now(),
            ],

            [
                'name' => 'Maternity Leave',
                'days' => 180,
                'IsPaid' => 1,
                'Remarks' => 'Female employees',
                'created_at' => now(),
                'updated_at' => now(),
            ],

            [
                'name' => 'Paternity Leave',
                'days' => 15,
                'IsPaid' => 1,
                'Remarks' => 'Male employees',
                'created_at' => now(),
                'updated_at' => now(),
            ],

            [
                'name' => 'Study Leave',
                'days' => 30,
                'IsPaid' => 1,
                'Remarks' => 'Research & Higher Study',
                'created_at' => now(),
                'updated_at' => now(),
            ],

            [
                'name' => 'Without Pay Leave',
                'days' => 365,
                'IsPaid' => 0,
                'Remarks' => 'Leave Without Pay',
                'created_at' => now(),
                'updated_at' => now(),
            ],

        ]);
    }
}
