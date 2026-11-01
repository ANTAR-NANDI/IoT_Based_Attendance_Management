<?php

namespace Database\Seeders;

use App\Models\User;
use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Hash;

class RosterPersonSeeder extends Seeder
{
    public function run(): void
    {
        $now = now();
        $departmentIds = DB::table('tblDepartment')->pluck('DepartmentID', 'DepartmentName');
        $designationIds = DB::table('tblDesignation')->pluck('DesignationID', 'DesignationName');
        $employeeEmails = [
            '22-71-08' => 'head.law@baiust.ac.bd', '19-71-05' => 'rezwana.law@baiust.ac.bd',
            '19-71-06' => 'drumki.law@baiust.ac.bd', '24-71-13' => 'tanjila.law@baiust.ac.bd',
            '22-71-09' => 'ashraf.law@baiust.ac.bd', '22-71-10' => 'nadia.law@baiust.ac.bd',
            '23-71-11' => 'mdshamim.law@baiust.ac.bd', '24-71-15' => 'lamia.law@baiust.ac.bd',
            '25-71-17' => 'saimur.law@baiust.ac.bd', '26-71-19' => 'fahim.law@baiust.ac.bd',
            '24-11-61' => 'saad.cse@baiust.ac.bd', '25-42-41' => 'sharmin.schum@baiust.ac.bd',
            '26-42-49' => 'nazmul.schum@baiust.ac.bd', '26-71-20' => 'sauddu@gmail.com',
            '26-71-21' => 'jannat.lata@yahoo.com', '26-71-23' => 'samukim1@gmail.com',
            '26-71-22' => 'advrih@gmail.com', '26-71-24' => 'maniklaw88@gmail.com',
            '18-31-16' => 'tahidur.dba@baiust.ac.bd', '16-31-003' => 'fatema.dba@baiust.ac.bd',
            '16-31-007' => 'shariful.dba@baiust.ac.bd', '18-31-17' => 'ariful.dba@baiust.ac.bd',
            '22-31-33' => 'shahanur.dba@baiust.ac.bd', '22-31-34' => 'tawhid.dba@baiust.ac.bd',
            '18-31-19' => 'rebaka.dba@baiust.ac.bd', '19-31-25' => 'farjes.dba@baiust.ac.bd',
            '20-31-28' => 'ftztarin.dba@baiust.ac.bd', '24-31-38' => 'noman.dba@baiust.ac.bd',
            '24-31-37' => 'yeakub.dba@baiust.ac.bd', '24-31-39' => 'sara.dba@baiust.ac.bd',
            '25-31-41' => 'shipa.dba@baiust.ac.bd', '25-31-43' => 'tahsin.dba@baiust.ac.bd',
            '45-31-44' => 'imran.dba@baiust.ac.bd', '26-31-46' => 'aklima3rd@yahoo.com',
            '26-31-47' => 'shabbirahmedmayen@gmail.com', '26-31-48' => 'shakilmirzajkknu@gmail.com',
        ];

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
            ['26-41-36', 'Anisur Rahman', 'Lecturer', 'English', true],
            ['24-11-61', 'Saad Bin Kamal', 'Lecturer', 'Computer Science & Engineering', true],
            ['25-42-41', 'Sharmin Akter', 'Lecturer', 'Science & Humanities', true],
            ['26-42-49', 'Nazmul Alam Ridoy', 'Lecturer', 'Science & Humanities', true],
            ['26-71-20', 'Saud Hasan', 'District & Sessions Judge', 'Adjunct Faculty', true],
            ['26-71-21', 'Dr. Jannatul Ferdous', 'Professor, Comilla University', 'Adjunct Faculty', true],
            ['26-71-23', 'Sabbir Ahmed Mukim', 'Advocate', 'Law', true],
            ['26-71-22', 'Rafiqul Islam Hossaini', 'Advocate', 'Adjunct Faculty', false],
            ['26-71-24', 'Manik Das', 'Joint District & Sessions Judge', 'Law', true],
            ['18-31-16', 'Dr. Md. Tahidur Rahman', 'Professor & Dean', 'Business Administration', true],
            ['16-31-003', 'Dr. Fatema Johara', 'Professor & Head', 'Business Administration', true],
            ['16-31-007', 'Dr. Mohammad Shariful Islam', 'Associate Professor', 'Business Administration', true],
            ['18-31-17', 'Md. Ariful Haque Chowdhury', 'Associate Professor', 'Business Administration', true],
            ['22-31-33', 'Md. Shahanur Islam', 'Associate Professor', 'Business Administration', true],
            ['22-31-34', 'Tawhid Ahmed Chowdhury', 'Assistant Professor', 'Business Administration', true],
            ['18-31-19', 'Rebaka Sultana', 'Assistant Professor', 'Business Administration', true],
            ['19-31-25', 'Farhana Jesmin', 'Assistant Professor', 'Business Administration', true],
            ['20-31-28', 'Fatema Tuz Zohora', 'Assistant Professor', 'Business Administration', true],
            ['24-31-38', 'Md Abdullah Al Noman', 'Lecturer', 'Business Administration', true],
            ['24-31-37', 'Yeakub Ali', 'Lecturer', 'Business Administration', true],
            ['24-31-39', 'Sabiha Shirin Sara', 'Lecturer', 'Business Administration', true],
            ['25-31-41', 'Shipa Akter', 'Lecturer', 'Business Administration', true],
            ['25-31-43', 'Tahsin Mamun Prottoy', 'Lecturer', 'Business Administration', true],
            ['45-31-44', 'Imran Hossain', 'Lecturer', 'Business Administration', true],
            ['26-31-46', 'Dr. Aklima Akter', 'Lecturer', 'Business Administration', true],
            ['26-31-47', 'Md. Sabbir Ahmed Mayen', 'Lecturer', 'Business Administration', true],
            ['26-31-48', 'Mirza Shakil', 'Lecturer', 'Business Administration', true],
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
            if (isset($employeeEmails[$employeeCode])) {
                $personId = DB::table('tblRosterPerson')->where('EmployeeCode', $employeeCode)->value('RosterPersonID');
                User::updateOrCreate(
                    ['email' => $employeeEmails[$employeeCode]],
                    ['name' => $personName, 'password' => Hash::make('123456'), 'role' => 'employee', 'RosterPersonID' => $personId]
                );
            }
        }
    }
}
