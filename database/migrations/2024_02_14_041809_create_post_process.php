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
        Schema::create('post_process', function (Blueprint $table) {
            $table->id();
            $table->unsignedBigInteger('pp_id')->nullable();
            $table->unsignedBigInteger('part_id')->nullable();
            $table->unsignedBigInteger('user_id')->nullable();
            $table->text('order_id')->nullable();
            $table->foreign('order_id')->references('id')->on('post_process_2');
            $table->text('file_name')->nullable();
            $table->text('technology')->nullable();
            $table->foreign('technology')->references('name')->on('technologies');
            $table->integer('total_washed_qty')->nullable();
            $table->text('assigned_to')->nullable();
            $table->date('post_process_date')->nullable();
            $table->integer('qty_for_pp')->nullable();
            $table->timestamp('pp_start_time')->nullable();
            $table->timestamp('pp_end_time')->nullable();
            $table->decimal('total_hours_of_pp')->nullable();
            $table->text('assigned_by')->nullable();
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('post_process');
    }
};
