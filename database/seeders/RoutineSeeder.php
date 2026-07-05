<?php

namespace Database\Seeders;

use Carbon\Carbon;
use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\DB;

class RoutineSeeder extends Seeder
{
    public function run(): void
    {
        DB::table('tblRoutine')->delete();

        DB::statement("DBCC CHECKIDENT ('tblRoutine', RESEED, 0)");

        $teachers = DB::table('tblTeacher')->get();

        $batches = DB::table('tblBatch')->pluck('BatchID')->toArray();

        $rooms = DB::table('tblRoom')->get();

        $deviceMap = DB::table('tblDevice')
            ->pluck('DeviceID', 'RoomID');

        $periods = [

            ['09:00:00', '10:00:00'],
            ['10:00:00', '11:00:00'],
            ['11:15:00', '12:15:00'],
            ['12:15:00', '01:15:00'],
            ['02:00:00', '03:00:00'],
            ['03:00:00', '04:00:00'],

        ];

        $classTypes = [
            'Theory',
            'Theory',
            'Theory',
            'Lab',
            'Theory',
            'Viva'
        ];

        $startDate = Carbon::today();

        for ($day = 1; $day < 30; $day++) {

            $date = $startDate->copy()->addDays($day);

            if ($date->isFriday()) {
                continue;
            }

            foreach ($teachers as $teacher) {

                // Teacher's own department subjects
                $subjects = DB::table('tblSubject')
                    ->where('DepartmentID', $teacher->DepartmentID)
                    ->get();

                if ($subjects->isEmpty()) {
                    continue;
                }

                // 2 classes per teacher/day
                $selectedPeriods = collect(array_rand($periods, 2));

                foreach ($selectedPeriods as $periodIndex) {

                    $subject = $subjects->random();

                    $room = $rooms->random();

                    DB::table('tblRoutine')->insert([

                        'RoutineDate' => $date,

                        'TeacherID' => $teacher->TeacherID,

                        'SubjectID' => $subject->SubjectID,

                        'BatchID' => $batches[array_rand($batches)],

                        'RoomID' => $room->RoomID,

                        'DeviceID' => $deviceMap[$room->RoomID],

                        'StartTime' => $periods[$periodIndex][0],

                        'EndTime' => $periods[$periodIndex][1],

                        'GraceMinute' => 10,

                        'DayName' => $date->format('l'),

                        'ClassType' => $classTypes[$periodIndex],

                        'Remarks' => null,

                        'Status' => 1,

                        'created_at' => now(),

                        'updated_at' => now(),

                    ]);
                }
            }
        }
    }
}
