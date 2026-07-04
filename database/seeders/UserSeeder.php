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


        // 2. Seed Clean Departments Data into tblDepartmentOrder
        $departments = [
            ['DepartmentName' => 'Human Resources', 'DepartmentCode' => 1],
            ['DepartmentName' => 'Information Technology', 'DepartmentCode' => 2],
            ['DepartmentName' => 'Production Department', 'DepartmentCode' => 3],
            ['DepartmentName' => 'Finance & Accounts', 'DepartmentCode' => 4],
        ];
        foreach ($departments as $dept) {
            DB::table('tblDepartment')->updateOrInsert(['DepartmentName' => $dept['DepartmentName']], $dept);
        }

        // 3. Seed Clean Designations Data into tblDeignationOrder
        $designations = [
            ['DesignationName' => 'Software Engineer',],
            ['DesignationName' => 'HR Officer'],
            ['DesignationName' => 'Floor Supervisor'],
            ['DesignationName' => 'Accountant'],
        ];
        foreach ($designations as $desig) {
            DB::table('tblDesignation')->updateOrInsert(['DesignationName' => $desig['DesignationName']], $desig);
        }
    }
}
