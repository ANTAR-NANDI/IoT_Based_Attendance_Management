<?php

namespace Database\Seeders;

use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\DB;

class DeviceSeeder extends Seeder
{
    public function run(): void
    {
        DB::table('tblDevice')->delete();

        DB::statement("DBCC CHECKIDENT ('tblDevice', RESEED, 0)");

        $rooms = DB::table('tblRoom')
            ->orderBy('RoomID')
            ->get();

        $devices = [];

        foreach ($rooms as $room) {

            $roomNo = strtoupper(str_replace(' ', '', $room->RoomNo));

            $devices[] = [

                'DeviceName' => 'Attendance Device - Room ' . $room->RoomNo,

                'RoomID' => $room->RoomID,

                'IPAddress' => '192.168.10.' . (100 + $room->RoomID),

                'SerialNo' => 'ZKT-' . str_pad($room->RoomID, 4, '0', STR_PAD_LEFT),

                'Status' => 1,

                'created_at' => now(),

                'updated_at' => now(),
            ];
        }

        DB::table('tblDevice')->insert($devices);
    }
}
