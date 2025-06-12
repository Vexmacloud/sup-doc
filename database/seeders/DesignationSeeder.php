<?php

namespace Database\Seeders;

use App\Models\Designation;
use Illuminate\Database\Console\Seeds\WithoutModelEvents;
use Illuminate\Database\Seeder;

class DesignationSeeder extends Seeder
{
    /**
     * Run the database seeds.
     */
    public function run(): void
    {
        $payload = [
            ['name'=>'Test1'],
            ['name'=>'Test2'],
            ['name'=>'Test3'],
            ['name'=>'Test4'],
            ['name'=>'Test5'],
            ['name'=>'Test6'],
        ];


        foreach($payload as $value){
            Designation::create(['name'=>$value['name']]);
        }
    }
}
