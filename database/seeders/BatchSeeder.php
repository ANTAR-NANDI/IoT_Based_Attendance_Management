<?php

namespace Database\Seeders;

use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\DB;

class BatchSeeder extends Seeder
{
    public function run(): void
    {
        $lawDepartmentId = DB::table('tblDepartment')->where('DepartmentCode', 'LAW')->value('DepartmentID');
        if (!$lawDepartmentId) {
            throw new \RuntimeException('The Law department must be seeded before running BatchSeeder.');
        }

        $now = now();
        foreach ([
            ['16th Batch', 'Fall-2026', 'Semester L1-T1'],
            ['15th Batch', 'Spring-2026', 'Semester L1-T2'],
            ['14th Batch', 'Fall-2025', 'Semester L2-T1'],
            ['13th Batch', 'Spring-2025', 'Semester L2-T2'],
            ['12th Batch', 'Fall-2024', 'Semester L3-T1'],
            ['11th Batch', 'Spring-2024', 'Semester L3-T2'],
            ['10th Batch', 'Fall-2023', 'Semester L4-T1'],
            ['9th Batch', 'Spring-2023', 'Semester L4-T2'],
        ] as [$batchName, $session, $semester]) {
            DB::table('tblBatch')->updateOrInsert(
                ['BatchName' => $batchName, 'DepartmentID' => $lawDepartmentId],
                ['Session' => $session, 'Semester' => $semester, 'Status' => true, 'created_at' => $now, 'updated_at' => $now]
            );
        }
    }
}
