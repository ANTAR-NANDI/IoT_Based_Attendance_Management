<?php

namespace Database\Seeders;

use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\DB;

class BatchSeeder extends Seeder
{
    public function run(): void
    {
        $departmentIds = DB::table('tblDepartment')->whereIn('DepartmentCode', ['LAW', 'BBA'])->pluck('DepartmentID', 'DepartmentCode');
        if (!$departmentIds->has('LAW') || !$departmentIds->has('BBA')) {
            throw new \RuntimeException('The Law and Business Administration departments must be seeded before running BatchSeeder.');
        }

        $now = now();
        foreach ([
            ['LAW', '9th Batch', 'Spring-2023', 'L4-T2'], ['LAW', '10th Batch', 'Fall-2023', 'L4-T1'],
            ['LAW', '11th Batch', 'Spring-2024', 'L3-T2'], ['LAW', '12th Batch', 'Fall-2024', 'L3-T1'],
            ['LAW', '13th Batch', 'Spring-2025', 'L2-T2'], ['LAW', '14th Batch', 'Fall-2025', 'L2-T1'],
            ['LAW', '15th Batch', 'Spring-2026', 'L1-T2'], ['LAW', '16th Batch', 'Fall-2026', 'L1-T1'],
            ['BBA', '16th Batch', 'Spring-2023', 'L4-T2'], ['BBA', '17th Batch', 'Fall-2023', 'L4-T1'],
            ['BBA', '18th Batch', 'Spring-2024', 'L3-T2'], ['BBA', '19th Batch', 'Fall-2024', 'L3-T1'],
            ['BBA', '20th Batch', 'Spring-2025', 'L2-T2'], ['BBA', '21th Batch', 'Fall-2025', 'L2-T1'],
            ['BBA', '22th Batch', 'Spring-2026', 'L1-T2'], ['BBA', '23th Batch', 'Fall-2026', 'L1-T1'],
        ] as [$departmentCode, $batchName, $session, $semester]) {
            DB::table('tblBatch')->updateOrInsert(
                ['BatchName' => $batchName, 'DepartmentID' => $departmentIds[$departmentCode]],
                ['Session' => $session, 'Semester' => $semester, 'Status' => true, 'created_at' => $now, 'updated_at' => $now]
            );
        }
    }
}
