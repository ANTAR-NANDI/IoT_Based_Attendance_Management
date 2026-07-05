<?php

namespace Database\Seeders;

use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\DB;

class RoomSeeder extends Seeder
{
    public function run(): void
    {
        DB::table('tblRoom')->delete();

        DB::statement("DBCC CHECKIDENT ('tblRoom', RESEED, 0)");

        $rooms = [

            // Ground Floor
            ['RoomNo' => 'G-101', 'Floor' => 'Ground Floor'],
            ['RoomNo' => 'G-102', 'Floor' => 'Ground Floor'],
            ['RoomNo' => 'G-103', 'Floor' => 'Ground Floor'],
            ['RoomNo' => 'LAB-01', 'Floor' => 'Ground Floor'],
            ['RoomNo' => 'LAB-02', 'Floor' => 'Ground Floor'],

            // First Floor
            ['RoomNo' => '101', 'Floor' => '1st Floor'],
            ['RoomNo' => '102', 'Floor' => '1st Floor'],
            ['RoomNo' => '103', 'Floor' => '1st Floor'],
            ['RoomNo' => '104', 'Floor' => '1st Floor'],
            ['RoomNo' => '105', 'Floor' => '1st Floor'],

            // Second Floor
            ['RoomNo' => '201', 'Floor' => '2nd Floor'],
            ['RoomNo' => '202', 'Floor' => '2nd Floor'],
            ['RoomNo' => '203', 'Floor' => '2nd Floor'],
            ['RoomNo' => '204', 'Floor' => '2nd Floor'],
            ['RoomNo' => '205', 'Floor' => '2nd Floor'],

            // Third Floor
            ['RoomNo' => '301', 'Floor' => '3rd Floor'],
            ['RoomNo' => '302', 'Floor' => '3rd Floor'],
            ['RoomNo' => '303', 'Floor' => '3rd Floor'],
            ['RoomNo' => '304', 'Floor' => '3rd Floor'],
            ['RoomNo' => '305', 'Floor' => '3rd Floor'],

            // Special Rooms
            ['RoomNo' => 'LIB-01', 'Floor' => '2nd Floor'],
            ['RoomNo' => 'SEMINAR-01', 'Floor' => '3rd Floor'],
            ['RoomNo' => 'AUDITORIUM', 'Floor' => 'Ground Floor'],
            ['RoomNo' => 'CONF-01', 'Floor' => '1st Floor'],
            ['RoomNo' => 'SERVER-01', 'Floor' => 'Ground Floor'],

        ];

        foreach ($rooms as &$room) {
            $room['created_at'] = now();
            $room['updated_at'] = now();
        }

        DB::table('tblRoom')->insert($rooms);
    }
}
