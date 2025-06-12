<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    /**
     * Run the migrations.
     */
    public function up(): void
    {
        Schema::create('packaging_shipping', function (Blueprint $table) {
            $table->id();
            $table->unsignedBigInteger('order_id')->nullable();
            $table->text('client_name')->nullable();
            $table->text('courier_type')->nullable();
            $table->text('packaging_date')->nullable();
            $table->integer('total_quantity')->nullable();
            $table->date('ship_date')->nullable();
            $table->text('preferred_service')->nullable();
            $table->text('shipping_service_used')->nullable();
            $table->date('expected_delivery_date')->nullable();
            $table->text('packaging_box_dimension')->nullable();
            $table->text('packaging_photo')->nullable();
            $table->text('shipping_charges')->nullable();
            $table->text('box_dimension')->nullable();
            $table->text('shipping_address')->nullable();
            $table->text('images_verified_by')->nullable();
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('packaging_shipping');
    }
};
