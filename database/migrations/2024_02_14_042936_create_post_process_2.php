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
        Schema::create('post_process_2', function (Blueprint $table) {
            $table->id();
            $table->unsignedBigInteger('uid')->nullable();
            $table->unsignedBigInteger('pp_id')->nullable();
            $table->unsignedBigInteger('wash_id')->nullable();
            $table->unsignedBigInteger('part_id')->nullable();
            $table->foreign('pp_id')->references('id')->on('post_process');
            $table->unsignedBigInteger('order_id')->nullable();
            $table->foreign('order_id')->references('id')->on('orders');
            $table->text('file_name')->nullable();
            $table->integer('total_washed_qty')->nullable();
            $table->integer('post_processed_qty')->nullable();
            $table->decimal('part_weight_before_pp_gm')->nullable();
            $table->decimal('part_weight_after_pp_gm')->nullable();
            $table->decimal('difference')->nullable();
            $table->text('part_status')->nullable();
            $table->integer('no_of_failed_part_or_damaged_qty')->nullable();
            $table->text('reason_for_failing')->nullable();
            $table->text('image')->nullable();
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('post_process_2');
    }
};
