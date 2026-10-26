<?php

namespace Database\Seeders;

use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\DB;

class RoomDeviceSeeder extends Seeder
{
    public function run(): void
    {
        $now = now();
        foreach ([
            ['301', '2nd Floor', '192.168.25.172', 'SMR5261600058'],
            ['302', '2nd Floor', '192.168.25.173', 'SMR5261600071'],
            ['303', '2nd Floor', '192.168.25.170', 'SOYG2146600074'],
            ['309', '2nd Floor', '192.168.25.175', 'SMR5261600070'],
            ['405', '3rd Floor', '192.168.25.176', 'SMR5261600065'],
            ['406', '3rd Floor', '192.168.25.177', 'SMR5261600066'],
            ['409', '3rd Floor', '192.168.25.178', 'SMR5261600063'],
        ] as [$roomNumber, $floor, $ipAddress, $serialNo]) {
            $locationName = "Room - {$roomNumber}";

            // Devices are separate records and are linked back to their room
            // through tblRosterLocation.DeviceID.
            DB::table('tblDevice')->updateOrInsert(
                ['SerialNo' => $serialNo],
                [
                    'DeviceName' => $locationName,
                    'RoomID' => null,
                    'IPAddress' => $ipAddress,
                    'Status' => true,
                    'created_at' => $now,
                    'updated_at' => $now,
                ]
            );
            $deviceId = DB::table('tblDevice')->where('SerialNo', $serialNo)->value('DeviceID');

            DB::table('tblRosterLocation')->updateOrInsert(
                ['LocationName' => $locationName],
                [
                    'LocationType' => 'Class Room',
                    'Description' => $floor,
                    'DeviceID' => $deviceId,
                    'Status' => true,
                    'created_at' => $now,
                    'updated_at' => $now,
                ]
            );
        }
    }
}
