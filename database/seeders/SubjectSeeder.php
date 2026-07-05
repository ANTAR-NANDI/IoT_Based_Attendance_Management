<?php

namespace Database\Seeders;

use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\DB;

class SubjectSeeder extends Seeder
{
    public function run(): void
    {
        DB::table('tblSubject')->delete();
        DB::statement("DBCC CHECKIDENT ('tblSubject', RESEED, 0)");

        $subjects = [

            // DepartmentID = 1 (CSE)
            ['Code' => 'CSE101', 'SubjectName' => 'Programming Fundamentals', 'DepartmentID' => 1],
            ['Code' => 'CSE102', 'SubjectName' => 'Structured Programming', 'DepartmentID' => 1],
            ['Code' => 'CSE201', 'SubjectName' => 'Object Oriented Programming', 'DepartmentID' => 1],
            ['Code' => 'CSE202', 'SubjectName' => 'Data Structures', 'DepartmentID' => 1],
            ['Code' => 'CSE301', 'SubjectName' => 'Algorithms', 'DepartmentID' => 1],
            ['Code' => 'CSE302', 'SubjectName' => 'Database Management System', 'DepartmentID' => 1],
            ['Code' => 'CSE303', 'SubjectName' => 'Operating Systems', 'DepartmentID' => 1],
            ['Code' => 'CSE304', 'SubjectName' => 'Computer Networks', 'DepartmentID' => 1],
            ['Code' => 'CSE401', 'SubjectName' => 'Software Engineering', 'DepartmentID' => 1],
            ['Code' => 'CSE402', 'SubjectName' => 'Artificial Intelligence', 'DepartmentID' => 1],

            // DepartmentID = 2 (EEE)
            ['Code' => 'EEE101', 'SubjectName' => 'Basic Electrical Engineering', 'DepartmentID' => 2],
            ['Code' => 'EEE102', 'SubjectName' => 'Circuit Analysis', 'DepartmentID' => 2],
            ['Code' => 'EEE201', 'SubjectName' => 'Electronics I', 'DepartmentID' => 2],
            ['Code' => 'EEE202', 'SubjectName' => 'Digital Electronics', 'DepartmentID' => 2],
            ['Code' => 'EEE301', 'SubjectName' => 'Power System', 'DepartmentID' => 2],
            ['Code' => 'EEE302', 'SubjectName' => 'Electrical Machines', 'DepartmentID' => 2],
            ['Code' => 'EEE401', 'SubjectName' => 'Control Systems', 'DepartmentID' => 2],
            ['Code' => 'EEE402', 'SubjectName' => 'Microprocessor & Interfacing', 'DepartmentID' => 2],

            // DepartmentID = 3 (BBA)
            ['Code' => 'BBA101', 'SubjectName' => 'Principles of Management', 'DepartmentID' => 3],
            ['Code' => 'BBA102', 'SubjectName' => 'Financial Accounting', 'DepartmentID' => 3],
            ['Code' => 'BBA201', 'SubjectName' => 'Marketing Management', 'DepartmentID' => 3],
            ['Code' => 'BBA202', 'SubjectName' => 'Human Resource Management', 'DepartmentID' => 3],
            ['Code' => 'BBA301', 'SubjectName' => 'Business Communication', 'DepartmentID' => 3],
            ['Code' => 'BBA302', 'SubjectName' => 'Finance', 'DepartmentID' => 3],

            // DepartmentID = 4 (Law)
            ['Code' => 'LAW101', 'SubjectName' => 'Constitutional Law', 'DepartmentID' => 4],
            ['Code' => 'LAW102', 'SubjectName' => 'Criminal Law', 'DepartmentID' => 4],
            ['Code' => 'LAW201', 'SubjectName' => 'Civil Procedure Code', 'DepartmentID' => 4],
            ['Code' => 'LAW202', 'SubjectName' => 'Corporate Law', 'DepartmentID' => 4],

            // DepartmentID = 5 (History)
            ['Code' => 'HIS101', 'SubjectName' => 'History of Bangladesh', 'DepartmentID' => 5],
            ['Code' => 'HIS102', 'SubjectName' => 'Ancient Civilizations', 'DepartmentID' => 5],
            ['Code' => 'HIS201', 'SubjectName' => 'Modern World History', 'DepartmentID' => 5],

            // DepartmentID = 6 (Economics)
            ['Code' => 'ECO101', 'SubjectName' => 'Microeconomics', 'DepartmentID' => 6],
            ['Code' => 'ECO102', 'SubjectName' => 'Macroeconomics', 'DepartmentID' => 6],
            ['Code' => 'ECO201', 'SubjectName' => 'Development Economics', 'DepartmentID' => 6],
            ['Code' => 'ECO202', 'SubjectName' => 'International Economics', 'DepartmentID' => 6],

            // DepartmentID = 7 (English)
            ['Code' => 'ENG101', 'SubjectName' => 'English Reading & Writing', 'DepartmentID' => 7],
            ['Code' => 'ENG102', 'SubjectName' => 'English Literature', 'DepartmentID' => 7],
            ['Code' => 'ENG201', 'SubjectName' => 'Linguistics', 'DepartmentID' => 7],
            ['Code' => 'ENG202', 'SubjectName' => 'Creative Writing', 'DepartmentID' => 7],

            // DepartmentID = 8 (Math)
            ['Code' => 'MAT101', 'SubjectName' => 'Calculus I', 'DepartmentID' => 8],
            ['Code' => 'MAT102', 'SubjectName' => 'Linear Algebra', 'DepartmentID' => 8],
            ['Code' => 'MAT201', 'SubjectName' => 'Differential Equations', 'DepartmentID' => 8],
            ['Code' => 'MAT202', 'SubjectName' => 'Probability & Statistics', 'DepartmentID' => 8],

            // DepartmentID = 9 (Forestry)
            ['Code' => 'FOR101', 'SubjectName' => 'Introduction to Forestry', 'DepartmentID' => 9],
            ['Code' => 'FOR102', 'SubjectName' => 'Forest Ecology', 'DepartmentID' => 9],
            ['Code' => 'FOR201', 'SubjectName' => 'Forest Management', 'DepartmentID' => 9],

            // DepartmentID = 10 (Fisheries)
            ['Code' => 'FIS101', 'SubjectName' => 'Introduction to Fisheries', 'DepartmentID' => 10],
            ['Code' => 'FIS102', 'SubjectName' => 'Aquaculture', 'DepartmentID' => 10],
            ['Code' => 'FIS201', 'SubjectName' => 'Fish Nutrition', 'DepartmentID' => 10],
            ['Code' => 'FIS202', 'SubjectName' => 'Fish Breeding', 'DepartmentID' => 10],
        ];

        foreach ($subjects as &$subject) {
            $subject['created_at'] = now();
            $subject['updated_at'] = now();
        }

        DB::table('tblSubject')->insert($subjects);
    }
}
