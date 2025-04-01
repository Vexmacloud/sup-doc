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
            $table->unsignedBigInteger('uuid')->nullable();
            $table->unsignedBigInteger('order_uuid')->nullable();
            $table->unsignedBigInteger('user_uuid')->nullable();
            $table->text('part_name')->nullable();
            $table->integer('total_quantity')->nullable();
            $table->text('part_status')->nullable();
            $table->text('color')->nullable();
            $table->date('part_received_from_paint_date')->nullable();
            $table->integer('paint_cost')->nullable();
            $table->integer('labour_cost')->nullable();
            $table->text('assigned_to')->nullable();
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
