<?php

namespace Database\Seeders;

use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\DB;

class ShiftSeeder extends Seeder
{
    public function run(): void
    {
        DB::table('tblShift')->delete();

        $shifts = [

            [
                'shiftName'    => 'Morning Shift',
                'startTime'    => '08:00:00',
                'workinghour'  => 8.00,
                'ysnActive'    => 1,
                'daystart'     => '08:00:00',
                'dayhour'      => 8.00,
                'created_at'   => now(),
                'updated_at'   => now(),
            ],

            [
                'shiftName'    => 'Day Shift',
                'startTime'    => '09:00:00',
                'workinghour'  => 8.00,
                'ysnActive'    => 1,
                'daystart'     => '09:00:00',
                'dayhour'      => 8.00,
                'created_at'   => now(),
                'updated_at'   => now(),
            ],

            [
                'shiftName'    => 'Academic Shift',
                'startTime'    => '10:00:00',
                'workinghour'  => 7.00,
                'ysnActive'    => 1,
                'daystart'     => '10:00:00',
                'dayhour'      => 7.00,
                'created_at'   => now(),
                'updated_at'   => now(),
            ],

            [
                'shiftName'    => 'Evening Shift',
                'startTime'    => '14:00:00',
                'workinghour'  => 6.00,
                'ysnActive'    => 1,
                'daystart'     => '14:00:00',
                'dayhour'      => 6.00,
                'created_at'   => now(),
                'updated_at'   => now(),
            ],

            [
                'shiftName'    => 'Weekend Program',
                'startTime'    => '09:00:00',
                'workinghour'  => 5.00,
                'ysnActive'    => 1,
                'daystart'     => '09:00:00',
                'dayhour'      => 5.00,
                'created_at'   => now(),
                'updated_at'   => now(),
            ],

        ];

        DB::table('tblShift')->insert($shifts);
    }
}
