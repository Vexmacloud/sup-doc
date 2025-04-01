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
        Schema::create('production_plan', function (Blueprint $table) {
            $table->id();
            $table->uuid('uuid')->nullable();
            $table->text('print_id')->nullable();
            $table->uuid('technology_uuid')->nullable();
            $table->foreign('technology_uuid')->references('uuid')->on('technologies')->onDelete('cascade');
            // $table->uuid('machine_uuid')->nullable();
            // $table->foreign('machine_uuid')->references('uuid')->on('machines_sheet')->onDelete('cascade');
            $table->unsignedBigInteger('order_id')->nullable();
            $table->foreign('order_id')->references('id')->on('work_order2')->onDelete('cascade');
            $table->uuid('user_uuid')->nullable();
            $table->foreign('user_uuid')->references('uuid')->on('users')->onDelete('cascade');
            $table->string('client_name')->nullable();
            $table->integer('estimated_print_duration')->nullable();
            $table->timestamp('scheduled_print')->nullable();
            $table->string('material_uuid')->nullable();
            $table->string('material_variant')->nullable();
            $table->decimal('total_available_stock')->nullable();
            $table->integer('resolution')->nullable();
            $table->decimal('nozzle_size')->nullable();
            $table->decimal('material_required_height')->nullable();
            $table->decimal('rising_time_min')->nullable();
            $table->decimal('holding_time_min')->nullable();
            $table->decimal('dropping_time_min')->nullable();
            $table->decimal('peak_temperature')->nullable();
            $table->decimal('planned_by')->nullable();
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('production_plan');
    }
};
