<?php

namespace Database\Seeders;

use App\Models\User;
use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Facades\DB;

class UserSeeder extends Seeder
{
    public function run(): void
    {
        // Check if the user already exists to prevent duplicate insertion issues in SQL Server

        User::create([
            'name' => 'System Administrator',
            'email' => 'admin@hrm.com',
            'password' => Hash::make('@#$%^&'), // Change this in production!

        ]);


        // 2. Seed Clean Departments Data into tblDepartment
        $departments = [
            ['DepartmentName' => 'Computer Science & Engineering', 'DepartmentCode' => 1001],
            ['DepartmentName' => 'Electrical & Electronics Engineering', 'DepartmentCode' => 1002],
            ['DepartmentName' => 'Business Administration', 'DepartmentCode' => 1003],
            ['DepartmentName' => 'Law', 'DepartmentCode' => 1004],
            ['DepartmentName' => 'History', 'DepartmentCode' => 1005],
            ['DepartmentName' => 'Economics', 'DepartmentCode' => 1006],
            ['DepartmentName' => 'English', 'DepartmentCode' => 1007],
            ['DepartmentName' => 'Math', 'DepartmentCode' => 1008],
            ['DepartmentName' => 'Forestry', 'DepartmentCode' => 1009],
            ['DepartmentName' => 'Fisheries', 'DepartmentCode' => 1010]
        ];
        foreach ($departments as $dept) {
            DB::table('tblDepartment')->updateOrInsert(['DepartmentName' => $dept['DepartmentName']], $dept);
        }

        // 3. Seed Clean Designations Data into tblDeignation
        $designations = [
            ['DesignationName' => 'Lecturer',],
            ['DesignationName' => 'Assistant Professor'],
            ['DesignationName' => 'Professor'],
            ['DesignationName' => 'Chairman'],
            ['DesignationName' => 'Dean']
        ];
        foreach ($designations as $desig) {
            DB::table('tblDesignation')->updateOrInsert(['DesignationName' => $desig['DesignationName']], $desig);
        }
    }
}
