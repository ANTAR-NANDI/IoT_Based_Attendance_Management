<?php

namespace Database\Seeders;

use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\DB;

class HolidaySeeder extends Seeder
{
    public function run(): void
    {
        DB::table('tblHolidaySetup')->delete();

        $holidays = [

            [
                'HolidayName'   => 'New Year',
                'holidaydate'   => '2026-01-01',
                'strDescription' => 'New Year Holiday',
                'type'          => 'Public',
                'created_at'    => now(),
                'updated_at'    => now(),
            ],

            [
                'HolidayName'   => 'International Mother Language Day',
                'holidaydate'   => '2026-02-21',
                'strDescription' => 'National Holiday',
                'type'          => 'National',
                'created_at'    => now(),
                'updated_at'    => now(),
            ],

            [
                'HolidayName'   => 'Independence Day',
                'holidaydate'   => '2026-03-26',
                'strDescription' => 'National Holiday',
                'type'          => 'National',
                'created_at'    => now(),
                'updated_at'    => now(),
            ],

            [
                'HolidayName'   => 'Eid-ul-Fitr',
                'holidaydate'   => '2026-03-20',
                'strDescription' => 'Religious Holiday',
                'type'          => 'Religious',
                'created_at'    => now(),
                'updated_at'    => now(),
            ],

            [
                'HolidayName'   => 'Bengali New Year',
                'holidaydate'   => '2026-04-14',
                'strDescription' => 'Pohela Boishakh',
                'type'          => 'Cultural',
                'created_at'    => now(),
                'updated_at'    => now(),
            ],

            [
                'HolidayName'   => 'May Day',
                'holidaydate'   => '2026-05-01',
                'strDescription' => 'International Workers Day',
                'type'          => 'Public',
                'created_at'    => now(),
                'updated_at'    => now(),
            ],

            [
                'HolidayName'   => 'Eid-ul-Adha',
                'holidaydate'   => '2026-05-27',
                'strDescription' => 'Religious Holiday',
                'type'          => 'Religious',
                'created_at'    => now(),
                'updated_at'    => now(),
            ],

            [
                'HolidayName'   => 'Ashura',
                'holidaydate'   => '2026-06-26',
                'strDescription' => 'Religious Holiday',
                'type'          => 'Religious',
                'created_at'    => now(),
                'updated_at'    => now(),
            ],

            [
                'HolidayName'   => 'National Mourning Day',
                'holidaydate'   => '2026-08-15',
                'strDescription' => 'National Holiday',
                'type'          => 'National',
                'created_at'    => now(),
                'updated_at'    => now(),
            ],

            [
                'HolidayName'   => 'Eid-e-Milad-un-Nabi',
                'holidaydate'   => '2026-09-04',
                'strDescription' => 'Religious Holiday',
                'type'          => 'Religious',
                'created_at'    => now(),
                'updated_at'    => now(),
            ],

            [
                'HolidayName'   => 'Durga Puja (Vijaya Dashami)',
                'holidaydate'   => '2026-10-20',
                'strDescription' => 'Religious Holiday',
                'type'          => 'Religious',
                'created_at'    => now(),
                'updated_at'    => now(),
            ],

            [
                'HolidayName'   => 'Victory Day',
                'holidaydate'   => '2026-12-16',
                'strDescription' => 'National Holiday',
                'type'          => 'National',
                'created_at'    => now(),
                'updated_at'    => now(),
            ],

            [
                'HolidayName'   => 'Christmas Day',
                'holidaydate'   => '2026-12-25',
                'strDescription' => 'Public Holiday',
                'type'          => 'Religious',
                'created_at'    => now(),
                'updated_at'    => now(),
            ],

        ];

        DB::table('tblHolidaySetup')->insert($holidays);
    }
}
