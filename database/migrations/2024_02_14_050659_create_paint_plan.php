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
        Schema::create('paint_plan', function (Blueprint $table) {
            $table->id();
            $table->unsignedBigInteger('paint_batch_id')->nullable();
            $table->unsignedBigInteger('order_id')->nullable();
            $table->foreign('order_id')->references('id')->on('orders');
            $table->text('file_name')->nullable();
            $table->text('technology')->nullable();
            $table->foreign('technology')->references('uuid')->on('technologies');
            $table->integer('total_part_for_paint')->nullable();
            $table->date('paint_start_date')->nullable();
            $table->date('paint_end_date')->nullable();
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('paint_plan');
    }
};
