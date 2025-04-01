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
        Schema::create('production_plan2', function (Blueprint $table) {
            $table->id();
            $table->uuid('uuid')->nullable();
            $table->unsignedBigInteger('print_id')->nullable();
            $table->foreign('print_id')->references('id')->on('production_plan');
            $table->unsignedBigInteger('order_uuid')->nullable();
            $table->foreign('order_uuid')->references('id')->on('work_order2')->onDelete('cascade');
            // $table->uuid('user_id')->nullable();
            // $table->foreign('user_uuid')->references('uuid')->on('users')->onDelete('cascade');
            $table->string('client_name')->nullable();
            $table->text('part_name')->nullable();
            // $table->foreign('part_name_uuid')->references('uuid')->on('part_list')->onDelete('cascade');
            $table->string('planned_qty_to_print')->nullable();
            $table->string('part_id')->nullable();
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('production_plan2');
    }
};
