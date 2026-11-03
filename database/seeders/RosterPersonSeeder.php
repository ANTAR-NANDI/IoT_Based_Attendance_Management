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
        $legacyCeCodes = [
            'IH' => '23-21-29', 'LR' => '24-21-35', 'ANS' => '19-21-16', 'AHP' => '21-21-23',
            'AA' => '25-21-40', 'TA' => '25-21-42', 'MTI' => '26-21-46', 'JA' => '26-21-45',
        ];
        foreach ($legacyCeCodes as $shortForm => $employeeCode) {
            DB::table('tblRosterPerson')->where('EmployeeCode', $shortForm)->update(['EmployeeCode' => $employeeCode, 'updated_at' => $now]);
        }
        $employeeEmails = [
            '22-71-08' => 'head.law@baiust.ac.bd', '19-71-05' => 'rezwana.law@baiust.ac.bd',
            '19-71-06' => 'drumki.law@baiust.ac.bd', '24-71-13' => 'tanjila.law@baiust.ac.bd',
            '22-71-09' => 'ashraf.law@baiust.ac.bd', '22-71-10' => 'nadia.law@baiust.ac.bd',
            '23-71-11' => 'mdshamim.law@baiust.ac.bd', '24-71-15' => 'lamia.law@baiust.ac.bd',
            '25-71-17' => 'saimur.law@baiust.ac.bd', '26-71-19' => 'fahim.law@baiust.ac.bd',
            '26-41-36' => 'nafis.english@baiust.ac.bd', '26-41-37' => 'anis.english@baiust.ac.bd',
            '24-11-61' => 'saad.cse@baiust.ac.bd', '25-42-41' => 'sharmin.scnhum@baiust.ac.bd',
            '26-42-49' => 'nazmul.scnhum@baiust.ac.bd', '26-71-20' => 'sauddu@gmail.com',
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
            '23-21-29' => 'imam.ce@baiust.ac.bd', '24-21-35' => 'lutfar.ce@baiust.ac.bd',
            '19-21-16' => 'sakib.ce@baiust.ac.bd', '21-21-23' => 'arman.ce@baiust.ac.bd',
            '25-21-40' => 'azeem.ce@baiust.ac.bd', '25-21-42' => 'tanvir.ce@baiust.ac.bd',
            '26-21-46' => 'tahmidul.ce@baiust.ac.bd', '26-21-45' => 'jannatul.ce@baiust.ac.bd',
            '25-21-38' => 'sectionoffice.ce@baiust.ac.bd',
        ];
        $shortNames = [
            '22-71-08' => 'NAH', '19-71-05' => 'MRK', '19-71-06' => 'DKR', '24-71-13' => 'TT',
            '22-71-09' => 'SBA', '22-71-10' => 'NIN', '23-71-11' => 'MSA', '24-71-15' => 'LDW',
            '25-71-17' => 'SR', '26-71-19' => 'SBF', '26-41-36' => 'NAB', '26-41-37' => 'ANR',
            '24-11-61' => 'SBK', '25-42-41' => 'SHA', '26-42-49' => 'NAR', '26-71-20' => 'SH',
            '26-71-21' => 'JF', '26-71-23' => 'SAM', '26-71-22' => 'RIH', '26-71-24' => 'MD',
            '18-31-16' => 'TR', '16-31-003' => 'FJ', '16-31-007' => 'MSI', '18-31-17' => 'AHC',
            '22-31-33' => 'SI', '22-31-34' => 'TAC', '18-31-19' => 'RS', '19-31-25' => 'FJS',
            '20-31-28' => 'FTZ', '24-31-38' => 'AN', '24-31-37' => 'YA', '24-31-39' => 'SSS',
            '25-31-41' => 'SHA', '25-31-43' => 'TMP', '45-31-44' => 'IH', '26-31-46' => 'AA',
            '26-31-47' => 'SAM', '26-31-48' => 'MS',
            'MNI' => 'MNI', 'MGM' => 'MGM', 'YAA' => 'YAA', 'TT' => 'TT', 'SA' => 'SA',
            'SHT' => 'SHT', 'MMH' => 'MMH', 'MJM' => 'MJM', 'AI' => 'AI', 'NM' => 'NM',
        ];
        $employeePasswords = array_fill_keys(array_keys($shortNames), '12345678');

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
            ['26-41-36', 'Nafis Ahmed Bhuiyan', 'Lecturer', 'English', true],
            ['26-41-37', 'Anisur Rahman', 'Lecturer', 'English', true],
            ['24-11-61', 'Saad Bin Kamal', 'Lecturer', 'Computer Science & Engineering', true],
            ['25-42-41', 'Sharmin Akter', 'Lecturer', 'Science & Humanities', true],
            ['26-42-49', 'Nazmul Alam Ridoy', 'Lecturer', 'Science & Humanities', true],
            ['26-71-20', 'Saud Hasan', 'District & Sessions Judge', 'Adjunct Faculty', true],
            ['26-71-21', 'Dr. Jannatul Ferdous', 'Professor, Comilla University', 'Adjunct Faculty', true],
            ['26-71-23', 'Sabbir Ahmed Mukim', 'Advocate', 'Adjunct Faculty', true],
            ['26-71-22', 'Rafiqul Islam Hossaini', 'Advocate', 'Adjunct Faculty', true],
            ['26-71-24', 'Manik Das', 'Joint District & Sessions Judge', 'Adjunct Faculty', true],
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
            ['23-21-29', 'Md Imam Hossain', 'Assistant Professor', 'Communication Engineering', true, 'IH'],
            ['24-21-35', 'Lutfar Rahman Talukder', 'Assistant Professor', 'Communication Engineering', true, 'LR'],
            ['19-21-16', 'Ann Nazmun Sakib', 'Assistant Professor', 'Communication Engineering', true, 'ANS'],
            ['21-21-23', 'Arman Hossain Patwary', 'Lecturer', 'Communication Engineering', true, 'AHP'],
            ['25-21-40', 'Arshil Azeem', 'Lecturer', 'Communication Engineering', true, 'AA'],
            ['25-21-42', 'S.M Tanvir Ahmed', 'Lecturer', 'Communication Engineering', true, 'TA'],
            ['26-21-46', 'Md. Tahmidul Islam', 'Lecturer', 'Communication Engineering', true, 'MTI'],
            ['26-21-45', 'Jannatul Akmum', 'Lecturer', 'Communication Engineering', true, 'JA'],
            ['22-21-28', 'Md Belal Hossain', 'Lab Technician', 'Communication Engineering', true],
            ['22-21-25', 'Md Saiful Islam', 'Lab Technician', 'Communication Engineering', true],
            ['25-21-38', 'Fazle Rabbi Rakib', 'Computer Operator', 'Communication Engineering', true],
            ['24-21-34', 'Md. Rafi Mahmud', 'Lab Assistant', 'Communication Engineering', true],
            ['25-21-41', 'Md. Raquib Uddin Sorkar', 'Lab Assistant', 'Communication Engineering', true],
            ['17-02-52', 'Md Abu Sayed Rony', 'Lab Attendant', 'Communication Engineering', true],
            ['26-21-44', 'Md. Obaidullah Sobhani', 'Messenger', 'Communication Engineering', true],
            ['MNI', 'Dr. Md. Nazrul Islam', 'Associate Professor', 'Science & Humanities', true],
            ['MGM', 'Md. Gulam Mustafa', 'Lecturer', 'Science & Humanities', true],
            ['YAA', 'Md. Yasir Arafat Arman', 'Assistant Professor', 'Science & Humanities', true],
            ['TT', 'Tazin Tamanna', 'Lecturer', 'Science & Humanities', true],
            ['SA', 'Sharmin Akther', 'Lecturer', 'Science & Humanities', true],
            ['SHT', 'Sajjad Hossain Tamim', 'Lecturer', 'Science & Humanities', true],
            ['MMH', 'Md. Mehadi Hasan', 'Lecturer', 'Science & Humanities', true],
            ['MJM', 'Md. Jaman Mia', 'Lecturer', 'Science & Humanities', true],
            ['AI', 'Afroz Islam', 'Lecturer', 'Computer Science & Engineering', true],
            ['NM', 'Nafisa Maliyat', 'Lecturer', 'English', true],
        ] as $person) {
            [$employeeCode, $personName, $designation, $department, $status, $zktUserId] = array_pad($person, 6, null);
            DB::table('tblRosterPerson')->updateOrInsert(
                ['EmployeeCode' => $employeeCode],
                [
                    'PersonName' => $personName,
                    'ShortName' => $shortNames[$employeeCode] ?? $zktUserId ?: null,
                    'RoleName' => $designation,
                    'DepartmentName' => $department,
                    'DepartmentID' => $departmentIds[$department],
                    'DesignationID' => $designationIds[$designation],
                    'RunsRoster' => true,
                    'WorkMode' => 'Both',
                    'ZKUserID' => $zktUserId ?: $employeeCode,
                    'Status' => $status,
                    'created_at' => $now,
                    'updated_at' => $now,
                ]
            );
            if (isset($employeeEmails[$employeeCode])) {
                $personId = DB::table('tblRosterPerson')->where('EmployeeCode', $employeeCode)->value('RosterPersonID');
                User::updateOrCreate(
                    ['email' => $employeeEmails[$employeeCode]],
                    ['name' => $personName, 'password' => Hash::make($employeePasswords[$employeeCode] ?? '123456'), 'role' => 'employee', 'RosterPersonID' => $personId]
                );
            }
        }
    }
}
