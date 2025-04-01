<?php

namespace Database\Seeders;

use App\Models\OrderStatus;
use Illuminate\Database\Console\Seeds\WithoutModelEvents;
use Illuminate\Database\Seeder;

class OrderStatusSeeder extends Seeder
{
    /**
     * Run the database seeds.
     */
    public function run(): void
    {
        $payload = [
            ['name'=>'Order Confirmation'],
            ['name'=>'PO Pending'],
            ['name'=>'PO Received'],
            ['name'=>'Pre-Audit'],
            ['name'=>'Design Modification'],
            ['name'=>'3D Printing'],
            ['name'=>'Post Processing'],
            ['name'=>'Paint'],
            ['name'=>'Final Audit'],
            ['name'=>'Shipped'],
        ];

        foreach($payload as $index=>$value){
            OrderStatus::create($value);
        }
    }
}
