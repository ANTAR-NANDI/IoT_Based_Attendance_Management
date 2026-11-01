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
            ['301', 'Class Room', '2nd Floor', '192.168.25.172', 'SMR5261600058'],
            ['302', 'Class Room', '2nd Floor', '192.168.25.173', 'SMR5261600071'],
            ['303', 'Class Room', '2nd Floor', '192.168.1.103', 'SOYG2146600074'],
            ['309', 'Class Room', '2nd Floor', '192.168.25.175', 'SMR5261600070'],
            ['405', 'Class Room', '3rd Floor', '192.168.25.176', 'SMR5261600065'],
            ['406', 'Class Room', '3rd Floor', '192.168.25.177', 'SMR5261600066'],
            ['409', 'Moot Court', '3rd Floor', '192.168.25.178', 'SMR5261600063'],
            ['401', 'Class Room', '4th Floor', null, null], ['402', 'Class Room', '4th Floor', null, null],
            ['403', 'Class Room', '4th Floor', null, null], ['404', 'Class Room', '4th Floor', null, null],
            ['502', 'Class Room', '5th Floor', null, null], ['503', 'Class Room', '5th Floor', null, null],
            ['504', 'Class Room', '5th Floor', null, null], ['505', 'Class Room', '5th Floor', null, null],
            ['506', 'Class Room', '5th Floor', null, null], ['507', 'Class Room', '5th Floor', null, null],
            ['508', 'Class Room', '5th Floor', null, null], ['516', 'Class Room', '5th Floor', null, null],
            ['515', 'Computer Lab', '5th Floor', null, null],
        ] as [$roomNumber, $type, $floor, $ipAddress, $serialNo]) {
            $locationName = "Room - {$roomNumber}";

            $deviceId = null;
            if ($serialNo) {
                DB::table('tblDevice')->updateOrInsert(
                    ['SerialNo' => $serialNo],
                    ['DeviceName' => $locationName, 'RoomID' => null, 'IPAddress' => $ipAddress, 'Status' => true, 'created_at' => $now, 'updated_at' => $now]
                );
                $deviceId = DB::table('tblDevice')->where('SerialNo', $serialNo)->value('DeviceID');
            }

            DB::table('tblRosterLocation')->updateOrInsert(
                ['LocationName' => $locationName],
                [
                    'LocationType' => $type,
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
