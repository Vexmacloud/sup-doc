<?php

namespace Database\Seeders;

use App\Models\Order;
use Illuminate\Database\Console\Seeds\WithoutModelEvents;
use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\DB;

class UpdateOrderNumbers extends Seeder
{
    /**
     * Run the database seeds.
     */
    public function run(): void
    {
        $initialOrderNo = 634;

        // generate order id 
        $generateOrderID = function($orderId)
        {
            $year = date('y'); 
            return "{$year}CV{$orderId}";
        };
        
        // null all order id
        Order::query()->update(["order_id" => null]);

        // orders
        $orders = Order::orderBy("id","asc")->get();

        foreach ($orders as $key => $order) {
            $initialOrderNo++; // increment

            // new order id
            $newOrderId = $generateOrderID($initialOrderNo); 

            
            DB::table("orders")->where("id", $order->id)->update([
                "order_id" => $newOrderId,
            ]);

            // dd($order, $newOrderId);
        }
    }
}
