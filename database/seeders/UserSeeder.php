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
            ['email' => 'antarnandy.2@gmail.com'],
            [
                'name' => 'Sanjibani Super Admin',
                'password' => Hash::make('Sanjibani@2026'),
                'role' => 'superadmin',
                'RosterPersonID' => null,
            ]
        );
    }
}
