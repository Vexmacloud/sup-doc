<?php

namespace Database\Seeders;

use App\Models\Role;
use Illuminate\Database\Console\Seeds\WithoutModelEvents;
use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\Hash;

class AdminSeeder extends Seeder
{
    /**
     * Run the database seeds.
     */
    public function run(): void
    {
        $role = Role::where('role', 'Admin')->first();
        if ($role) {
            $role->users()->create([
                'name' => 'admin',
                'email' => 'admin@gmail.com',
                'password' => Hash::make('123456')
            ]);

        }
    }
}