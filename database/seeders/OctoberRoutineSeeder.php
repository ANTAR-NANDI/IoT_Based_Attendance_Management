<?php

namespace Database\Seeders;

use Carbon\Carbon;
use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\DB;

class OctoberRoutineSeeder extends Seeder
{
    /**
     * Seeds 7 teachers with one class per working day in October.
     * Friday and Saturday are holidays, so only Sunday–Thursday templates
     * are stored. The attendance report expands these templates by date.
     */
    public function run(): void
    {
        $year = now()->year;
        $semesterStart = Carbon::create($year, 10, 1)->startOfMonth();
        $semesterEnd = $semesterStart->copy()->endOfMonth();
        $classDays = ['Sunday', 'Monday', 'Tuesday', 'Wednesday', 'Thursday'];

        $teachers = DB::table('tblTeacher')->orderBy('TeacherID')->limit(7)->get();
        $rooms = DB::table('tblRoom as r')
            ->join('tblDevice as d', 'd.RoomID', '=', 'r.RoomID')
            ->where('d.Status', 1)
            ->select('r.RoomID', 'd.DeviceID')
            ->orderBy('r.RoomID')
            ->limit(7)
            ->get();
        $batches = DB::table('tblBatch')->where('Status', 1)->orderBy('BatchID')->get();

        if ($teachers->count() < 7 || $rooms->isEmpty() || $batches->isEmpty()) {
            $this->command?->warn(sprintf(
                'October routine seed skipped: found %d teacher(s), %d active room device(s), and %d active batch(es); it needs 7 teachers, 1 active room device, and 1 active batch.',
                $teachers->count(), $rooms->count(), $batches->count()
            ));
            return;
        }

        // This seed owns only its own rows; existing user routines are untouched.
        DB::table('tblRoutine')->where('Remarks', 'October generated routine')->delete();

        $now = now();
        foreach ($teachers->values() as $index => $teacher) {
            $subject = DB::table('tblSubject')
                ->where('DepartmentID', $teacher->DepartmentID)
                ->orderBy('SubjectID')
                ->first()
                ?? DB::table('tblSubject')->orderBy('SubjectID')->first();

            if (!$subject) {
                $this->command?->warn('October routine seed skipped: no subjects are available.');
                return;
            }

            foreach ($classDays as $dayIndex => $day) {
                // Seven distinct room/time combinations avoid clashes while
                // giving every teacher a class on each working day.
                $periods = [['09:00:00', '10:00:00'], ['10:15:00', '11:15:00'], ['11:30:00', '12:30:00'], ['12:45:00', '13:45:00'], ['14:00:00', '15:00:00'], ['15:15:00', '16:15:00'], ['16:30:00', '17:30:00']];
                $period = $periods[($index + $dayIndex) % count($periods)];
                // One room/device or batch may safely be reused because each
                // teacher receives a different time period on a given day.
                $room = $rooms[$index % $rooms->count()];
                $batch = $batches[$index % $batches->count()];

                DB::table('tblRoutine')->insert([
                    'RoutineDate' => $semesterStart->toDateString(),
                    'SemesterStartDate' => $semesterStart->toDateString(),
                    'SemesterEndDate' => $semesterEnd->toDateString(),
                    'TeacherID' => $teacher->TeacherID,
                    'ProxyTeacherID' => null,
                    'SubjectID' => $subject->SubjectID,
                    'BatchID' => $batch->BatchID,
                    'RoomID' => $room->RoomID,
                    'DeviceID' => $room->DeviceID,
                    'StartTime' => $period[0],
                    'EndTime' => $period[1],
                    'GraceMinute' => 0,
                    'DayName' => $day,
                    'ClassType' => 'Theory',
                    'Remarks' => 'October generated routine',
                    'Status' => 1,
                    'created_at' => $now,
                    'updated_at' => $now,
                ]);
            }
        }

        $this->command?->info("Seeded 35 weekly routine slots for {$year} October: 7 teachers × 5 working days.");
    }
}
