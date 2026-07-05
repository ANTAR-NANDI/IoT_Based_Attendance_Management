<?php

namespace Database\Seeders;

use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\DB;

class BatchSeeder extends Seeder
{
    public function run(): void
    {
        DB::table('tblBatch')->delete();

        DB::statement("DBCC CHECKIDENT ('tblBatch', RESEED, 0)");

        $batches = [

            // CSE
            ['BatchName' => 'CSE-61', 'Session' => '2023-2024', 'Semester' => 1, 'Status' => 1],
            ['BatchName' => 'CSE-60', 'Session' => '2022-2023', 'Semester' => 3, 'Status' => 1],
            ['BatchName' => 'CSE-59', 'Session' => '2022-2023', 'Semester' => 5, 'Status' => 1],
            ['BatchName' => 'CSE-58', 'Session' => '2021-2022', 'Semester' => 7, 'Status' => 1],

            // EEE
            ['BatchName' => 'EEE-32', 'Session' => '2023-2024', 'Semester' => 1, 'Status' => 1],
            ['BatchName' => 'EEE-31', 'Session' => '2022-2023', 'Semester' => 3, 'Status' => 1],
            ['BatchName' => 'EEE-30', 'Session' => '2022-2023', 'Semester' => 5, 'Status' => 1],

            // BBA
            ['BatchName' => 'BBA-25', 'Session' => '2023-2024', 'Semester' => 1, 'Status' => 1],
            ['BatchName' => 'BBA-24', 'Session' => '2022-2023', 'Semester' => 3, 'Status' => 1],

            // Law
            ['BatchName' => 'LAW-18', 'Session' => '2023-2024', 'Semester' => 1, 'Status' => 1],
            ['BatchName' => 'LAW-17', 'Session' => '2022-2023', 'Semester' => 3, 'Status' => 1],

            // History
            ['BatchName' => 'HIS-12', 'Session' => '2023-2024', 'Semester' => 1, 'Status' => 1],

            // Economics
            ['BatchName' => 'ECO-15', 'Session' => '2023-2024', 'Semester' => 1, 'Status' => 1],
            ['BatchName' => 'ECO-14', 'Session' => '2022-2023', 'Semester' => 3, 'Status' => 1],

            // English
            ['BatchName' => 'ENG-20', 'Session' => '2023-2024', 'Semester' => 1, 'Status' => 1],
            ['BatchName' => 'ENG-19', 'Session' => '2022-2023', 'Semester' => 3, 'Status' => 1],

            // Mathematics
            ['BatchName' => 'MAT-11', 'Session' => '2023-2024', 'Semester' => 1, 'Status' => 1],

            // Forestry
            ['BatchName' => 'FOR-09', 'Session' => '2023-2024', 'Semester' => 1, 'Status' => 1],

            // Fisheries
            ['BatchName' => 'FIS-08', 'Session' => '2023-2024', 'Semester' => 1, 'Status' => 1],

        ];

        foreach ($batches as &$batch) {
            $batch['created_at'] = now();
            $batch['updated_at'] = now();
        }

        DB::table('tblBatch')->insert($batches);
    }
}
