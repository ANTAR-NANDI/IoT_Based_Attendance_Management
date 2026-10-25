<?php

namespace Database\Seeders;

use App\Models\User;
use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\Hash;

class UserSeeder extends Seeder
{
    public function run(): void
    {
        User::updateOrCreate(
            ['email' => 'admin@baiust.com'],
            [
                'name' => 'Super Admin',
                'password' => Hash::make('Superadmin@#$%2026'),
                'role' => 'superadmin',
                'RosterPersonID' => null,
            ]
        );
    }
}
