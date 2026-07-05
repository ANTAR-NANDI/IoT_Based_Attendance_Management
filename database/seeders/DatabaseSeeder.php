<?php

namespace Database\Seeders;

use App\Models\User;
// use Illuminate\Database\Console\Seeds\WithoutModelEvents;
use Illuminate\Database\Seeder;

class DatabaseSeeder extends Seeder
{
    /**
     * Seed the application's database.
     */
    public function run(): void
    {
        // User::factory(10)->create();

        $this->call([
            UserSeeder::class,
            TeacherSeeder::class,
            SubjectSeeder::class,
            BatchSeeder::class,
            RoomSeeder::class,
            DeviceSeeder::class,
            RoutineSeeder::class,
            ShiftSeeder::class,
            HolidaySeeder::class,
            LeaveTypeSeeder::class,
            LeaveSeeder::class,
            AttendanceLogSeeder::class

        ]);
    }
}
