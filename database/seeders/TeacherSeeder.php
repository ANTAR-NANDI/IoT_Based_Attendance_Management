<?php

namespace Database\Seeders;

use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\DB;
use Faker\Factory as Faker;

class TeacherSeeder extends Seeder
{
    public function run(): void
    {
        $faker = Faker::create();

        $teachers = [];

        for ($i = 1; $i <= 20; $i++) {

            $teachers[] = [

                'EmployeeID'    => 'EMP' . str_pad($i, 4, '0', STR_PAD_LEFT),

                'TeacherName'   => $faker->name(),

                'DepartmentID'  => rand(1, 10),

                'DesignationID' => rand(1, 5),

                'Mobile'        => '018' . rand(10000000, 99999999),

                'Email'         => $faker->unique()->safeEmail(),

                'ZKUserID'      => $i,

                'created_at'    => now(),

                'updated_at'    => now(),

            ];
        }

        DB::table('tblTeacher')->delete();

        DB::table('tblTeacher')->insert($teachers);
    }
}
