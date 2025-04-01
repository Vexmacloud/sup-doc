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
        Schema::create('post_processing2', function (Blueprint $table) {
            $table->id();
            $table->unsignedBigInteger('pp_uuid')->nullable();
            $table->unsignedBigInteger('wash_uuid')->nullable();
            $table->unsignedBigInteger('part_uuid')->nullable();
            $table->unsignedBigInteger('order_uuid')->nullable();
            $table->text('file_name')->nullable();
            $table->integer('total_wash_qty')->nullable();
            $table->text('post_processed_qty')->nullable();
            $table->integer('part_weight_before_pp')->nullable();
            $table->integer('part_weight_after_pp')->nullable();
            $table->text('difference')->nullable();
            $table->integer('failed_part')->nullable();
            $table->text('reason_failing')->nullable();
            $table->text('part_status')->nullable();
            $table->text('image')->nullable();
            $table->timestamps();
        });
    }
    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('post_processing2');
    }
};
