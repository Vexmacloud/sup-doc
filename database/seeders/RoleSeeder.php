<?php

namespace Database\Seeders;

use App\Models\Role;
use Illuminate\Database\Console\Seeds\WithoutModelEvents;
use Illuminate\Database\Seeder;

class RoleSeeder extends Seeder
{
    /**
     * Run the database seeds.
     */
    public function run(): void
    {
        $payload = [
            ['role'=>'Admin'],
            ['role'=>'Client'],
            ['role'=>'Sub-Admin'],
        ];


        foreach($payload as $index=>$value){
            if(Role::where('role',$value['role'])->exists()){

            }else{
                Role::create($value);
            }
        }
    }
}
