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
            ['CE-4212', 'Bridge Design Sessional'], ['CE-4219', 'Introduction to Finite Element Method'],
            ['CE-4151', 'Highway Materials, Pavement Design and Railway Engineering'], ['CE-4163', 'Hydrology and Irrigation Engineering'],
            ['CE-3271', 'Open Channel Hydraulics'], ['CE-3219', 'Design of Steel Structures'],
            ['CE-3233', 'Environmental Engineering-II'], ['CE-3251', 'Fundamentals of Transportation Engineering'],
            ['CE-3141', 'Principle of Soil Mechanics'], ['CE-3115', 'Design of Concrete Structures-I'],
            ['CE-3111', 'Structural Analysis & Design-I'], ['GED-3113', 'Fundamentals of Research Methodology'],
            ['CE-3131', 'Environmental Engineering-I'], ['CE-2215', 'Numerical Methods'],
            ['CE-2213', 'Mechanics of Solids-II'], ['CE-2201', 'Engineering Materials'],
            ['CE-1210', 'Computer Aided Drawing'], ['CE-1101', 'Engineering Mechanics'],
            ['CE-4239', 'Environmental Impact Assessment and Sustainability'], ['CE-4215', 'Prestressed Concrete'],
            ['GED-4203', 'Professional Practices & Communication'], ['CE-4111', 'Structural Analysis & Design-II'],
            ['CE-4141', 'Foundation Engineering'], ['CE-3212', 'Structural Analysis & Design Sessional-I'],
            ['CE-3132', 'Environmental Engineering Laboratory'], ['CE-1212', 'GIS and Remote sensing'],
            ['GED-4201', 'Project Planning & Construction Management'], ['CE-4233', 'Environmental Pollution and Management'],
            ['CE-3217', 'Design of Concrete Structures-II'], ['CE-3216', 'Concrete Structures Design Sessional I'],
            ['GED-2207', 'Socio-economic Aspects of Development Projects'], ['CE-1203', 'Surveying'],
            ['CE-1100', 'Civil Engineering Drawing'], ['CE-4232', 'Design of Water Supply, Sanitation and Sewerage Systems'],
            ['CE-4110', 'Structural Analysis and Design Sessional-II'], ['CE-3272', 'Open Channel Hydraulics Sessional'],
            ['CE-3142', 'Geotechnical Engineering Sessional-I'], ['CE-2208', 'Quantity Surveying'],
            ['CE-2103', 'Geology & Geomorphology'], ['CE-4152', 'Highway Materials, Mix Design and Traffic Engineering Sessional'],
            ['CE-2212', 'Structural Mechanics & Materials Sessional'], ['CE-1204', 'Practical Surveying'],
            ['CE 4100/4150', 'Thesis/ Integrated Design Project'], ['CE 4200/4250', 'Thesis/ Integrated Design Project'],
        ];

        foreach ($subjects as [$code, $subjectName]) {
            DB::table('tblSubject')->updateOrInsert(
                ['Code' => $code, 'SubjectName' => $subjectName, 'DepartmentID' => $departmentId],
                ['created_at' => $now, 'updated_at' => $now]
            );
        }
    }
}
