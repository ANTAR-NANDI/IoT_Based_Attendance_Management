<?php

namespace Database\Seeders;

use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\DB;

class CommunicationEngineeringSubjectSeeder extends Seeder
{
    public function run(): void
    {
        $departmentId = DB::table('tblDepartment')->where('DepartmentCode', 'CE')->value('DepartmentID');
        if (!$departmentId) throw new \RuntimeException('Communication Engineering must be seeded before its subjects.');

        $now = now();
        $subjects = [
            ['PHY-1101', 'Physics I'], ['MATH-1101', 'Mathematics I'], ['CHEM-1101', 'Chemistry I'],
            ['GED-1103', 'Sociology and Bangladesh Studies'], ['CE-1101', 'Engineering Mechanics'],
            ['CHEM-1102', 'Chemistry Sessional'], ['LANG-1101', 'English'], ['CE-1100', 'Civil Engineering Drawing'],
            ['PHY-1203', 'Physics II'], ['MATH-1203', 'Mathematics II'], ['EEE-1265', 'Basic Electrical Technology'],
            ['CE-1203', 'Surveying'], ['LANG-1201', 'Bangla Language and Literature'], ['LANG-1202', 'Developing English Language Skills'],
            ['PHY-1202', 'Physics Sessional'], ['CE-1210', 'Computer Aided Drawing'], ['CE-1212', 'GIS and Remote sensing'],
            ['CE-1204', 'Practical Surveying'], ['MATH-2203', 'Mathematics IV'], ['CE-2201', 'Engineering Materials'],
            ['CE-2215', 'Numerical Methods'], ['GED-2207', 'Socio-economic Aspects of Development Projects'],
            ['CE-2213', 'Mechanics of Solids-II'], ['CE-2208', 'Quantity Surveying'],
            ['CSE-2211', 'Engineering Computation Sessional'], ['CE-2212', 'Structural Mechanics & Materials Sessional'],
            ['GED-3113', 'Fundamentals of Research Methodology'], ['CE-3111', 'Structural Analysis & Design-I'],
            ['CE-3115', 'Design of Concrete Structures-I'], ['CE-3131', 'Environmental Engineering-I'],
            ['CE-3141', 'Principle of Soil Mechanics'], ['CE-3132', 'Environmental Engineering Laboratory'],
            ['CE-3142', 'Geotechnical Engineering Sessional-I'], ['CE-3217', 'Design of Concrete Structures-II'],
            ['CE-3219', 'Design of Steel Structures'], ['CE-3233', 'Environmental Engineering-II'],
            ['CE-3251', 'Fundamentals of Transportation Engineering'], ['CE-3271', 'Open Channel Hydraulics'],
            ['CE-3216', 'Design of Concrete Structures Sessional I'], ['CE-3212', 'Structural Analysis & Design Sessional-I'],
            ['CE-3272', 'Open Channel Hydraulics Sessional'], ['CE-3200', 'Civil Engineering Students’ Internship Programme (CESIP)'],
            ['CE-4111', 'Structural Analysis & Design-II'], ['CE-4141', 'Foundation Engineering'],
            ['CE-4151', 'Highway Materials, Pavement Design and Railway Engineering'], ['CE-4163', 'Hydrology and Irrigation Engineering'],
            ['CE-4110', 'Structural Analysis and Design Sessional-II'], ['CE-4152', 'Highway Materials, Mix Design and Traffic Engineering Sessional'],
            ['GED-4201', 'Project Planning and Construction Management'], ['GED-4203', 'Professional Practice and Communication'],
            ['CE-4215', 'Prestressed Concrete'], ['CE-4219', 'Introduction to Finite Element Method'],
            ['CE-4212', 'Bridge Design Sessional'], ['CE-4233', 'Environmental Pollution and Management'],
            ['CE-4239', 'Environmental Impact Assessment and Sustainability'], ['CE-4232', 'Design of Water Supply, Sanitation and Sewerage System'],
        ];

        foreach ($subjects as [$code, $subjectName]) {
            DB::table('tblSubject')->updateOrInsert(
                ['Code' => $code, 'SubjectName' => $subjectName, 'DepartmentID' => $departmentId],
                ['created_at' => $now, 'updated_at' => $now]
            );
        }
    }
}
