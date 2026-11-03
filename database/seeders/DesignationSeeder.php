<?php

namespace Database\Seeders;

use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\DB;

class DesignationSeeder extends Seeder
{
    public function run(): void
    {
        $now = now();
        $designations = array_unique([
            'Professor & Dean',
            'Professor & Head',
            'Associate Professor',
            'Associate Professor and Head of the Department',
            'Assistant Professor',
            'Assistant Professor & Program Coordinator',
            'Lecturer',
            'District & Sessions Judge',
            'Professor, Comilla University',
            'Advocate',
            'Joint District & Sessions Judge',
            'Lab Technician',
            'Computer Operator',
            'Lab Assistant',
            'Lab Attendant'
        ]);

        foreach ($designations as $designation) {
            DB::table('tblDesignation')->updateOrInsert(
                ['DesignationName' => $designation],
                ['Status' => true, 'updated_at' => $now, 'created_at' => $now]
            );

            $ids = DB::table('tblDesignation')->where('DesignationName', $designation)->orderBy('DesignationID')->pluck('DesignationID');
            if ($ids->count() > 1) {
                $keptId = $ids->first();
                $duplicateIds = $ids->slice(1)->all();
                DB::table('tblRosterPerson')->whereIn('DesignationID', $duplicateIds)->update(['DesignationID' => $keptId]);
                DB::table('tblDesignation')->whereIn('DesignationID', $duplicateIds)->delete();
            }
        }
    }
}
