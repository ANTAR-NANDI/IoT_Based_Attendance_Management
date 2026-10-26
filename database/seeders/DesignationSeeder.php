<?php

namespace Database\Seeders;

use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\DB;

class DesignationSeeder extends Seeder
{
    public function run(): void
    {
        $now = now();
        foreach ([
            'Associate Professor and Head of the Department',
            'Assistant Professor',
            'Assistant Professor & Program Coordinator',
            'Lecturer',
            'District & Sessions Judge',
            'Professor, Comilla University',
            'Advocate',
            'Joint District & Sessions Judge',
        ] as $designation) {
            DB::table('tblDesignation')->updateOrInsert(
                ['DesignationName' => $designation],
                ['Status' => true, 'updated_at' => $now, 'created_at' => $now]
            );
        }
    }
}
