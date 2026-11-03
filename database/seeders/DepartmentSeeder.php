<?php

namespace Database\Seeders;

use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\DB;

class DepartmentSeeder extends Seeder
{
    public function run(): void
    {
        $now = now();
        foreach ([
            ['DepartmentCode' => 'LAW', 'DepartmentName' => 'Law'],
            ['DepartmentCode' => 'ENG', 'DepartmentName' => 'English'],
            ['DepartmentCode' => 'CSE', 'DepartmentName' => 'Computer Science & Engineering'],
            ['DepartmentCode' => 'CE', 'DepartmentName' => 'Communication Engineering'],
            ['DepartmentCode' => 'BBA', 'DepartmentName' => 'Business Administration'],
            ['DepartmentCode' => 'SH', 'DepartmentName' => 'Science & Humanities'],
            ['DepartmentCode' => 'ADJ', 'DepartmentName' => 'Adjunct Faculty'],
        ] as $department) {
            DB::table('tblDepartment')->updateOrInsert(
                ['DepartmentCode' => $department['DepartmentCode']],
                [...$department, 'Status' => true, 'updated_at' => $now, 'created_at' => $now]
            );
        }
    }
}
