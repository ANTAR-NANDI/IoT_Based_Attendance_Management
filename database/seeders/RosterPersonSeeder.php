<?php

namespace Database\Seeders;

use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\DB;

class RosterPersonSeeder extends Seeder
{
    public function run(): void
    {
        $now = now();
        $departmentIds = DB::table('tblDepartment')->pluck('DepartmentID', 'DepartmentName');
        $designationIds = DB::table('tblDesignation')->pluck('DesignationID', 'DesignationName');

        foreach ([
            ['22-71-08', 'Dr. Md. Nayem Alimul Hyder', 'Associate Professor and Head of the Department', 'Law', true],
            ['19-71-05', 'Mst. Rezwana Karim', 'Assistant Professor', 'Law', true],
            ['19-71-06', 'Dipannita Kundu Rumki', 'Assistant Professor', 'Law', true],
            ['24-71-13', 'Tanjila Tamanna', 'Assistant Professor & Program Coordinator', 'Law', true],
            ['22-71-09', 'Shadab Bin Ashraf', 'Assistant Professor', 'Law', true],
            ['22-71-10', 'Nadia Islam Nody', 'Assistant Professor', 'Law', true],
            ['23-71-11', 'Md Shamim Ahmed', 'Assistant Professor', 'Law', true],
            ['24-71-15', 'Lamia Dilshad Waziha', 'Lecturer', 'Law', true],
            ['25-71-17', 'Saimur Rahman', 'Lecturer', 'Law', true],
            ['26-71-19', 'Sadd Been Hossain Fahim', 'Lecturer', 'Law', true],
            ['26-41-37', 'Anisur Rahman', 'Lecturer', 'English', true],
            ['24-11-61', 'Saad Bin Kamal', 'Lecturer', 'Computer Science & Engineering', true],
            ['25-42-41', 'Sharmin Akter', 'Lecturer', 'Science & Humanities', true],
            ['26-42-49', 'Nazmul Alam Ridoy', 'Lecturer', 'Science & Humanities', true],
            ['26-71-20', 'Saud Hasan', 'District & Sessions Judge', 'Adjunct Faculty', true],
            ['26-71-21', 'Dr. Jannatul Ferdous', 'Professor, Comilla University', 'Law', true],
            ['26-71-23', 'Sabbir Ahmed Mukim', 'Advocate', 'Law', true],
            ['26-71-22', 'Rafiqul Islam Hossaini', 'Advocate', 'Adjunct Faculty', false],
            ['26-71-24', 'Manik Das', 'Joint District & Sessions Judge', 'Law', true],
        ] as [$employeeCode, $personName, $designation, $department, $status]) {
            DB::table('tblRosterPerson')->updateOrInsert(
                ['EmployeeCode' => $employeeCode],
                [
                    'PersonName' => $personName,
                    'RoleName' => $designation,
                    'DepartmentName' => $department,
                    'DepartmentID' => $departmentIds[$department],
                    'DesignationID' => $designationIds[$designation],
                    'RunsRoster' => true,
                    'WorkMode' => 'Both',
                    'ZKUserID' => $employeeCode,
                    'Status' => $status,
                    'created_at' => $now,
                    'updated_at' => $now,
                ]
            );
        }
    }
}
