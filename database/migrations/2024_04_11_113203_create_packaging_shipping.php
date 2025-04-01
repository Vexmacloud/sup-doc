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
            $table->unsignedBigInteger('uuid')->nullable();
            $table->unsignedBigInteger('order_uuid')->nullable();
            $table->unsignedBigInteger('user_uuid')->nullable();
            $table->text('courier_type')->nullable();
            $table->integer('quantity_of_parts')->nullable();
            $table->date('packaging_date')->nullable();
            $table->text('packaging_box_dimension')->nullable();
            $table->text('verified_by')->nullable();
            $table->text('image')->nullable();
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
