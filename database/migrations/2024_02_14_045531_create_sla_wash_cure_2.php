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
        Schema::create('sla_wash_cure_2', function (Blueprint $table) {
            $table->id();
            $table->unsignedBigInteger('uid')->nullable();
            $table->unsignedBigInteger('wash_id')->nullable();
            $table->foreign('wash_id')->references('id')->on('sla_wash_cure');
            $table->text('part_id')->nullable();
            $table->unsignedBigInteger('print_id')->nullable();
            $table->unsignedBigInteger('order_id')->nullable();
            $table->foreign('order_id')->references('id')->on('orders');
            $table->text('file_name')->nullable();
            $table->integer('total_part_print_qty')->nullable();
            $table->integer('washed_part_qty')->nullable();
            $table->integer('cured_part_qty')->nullable();
            $table->text('part_status')->nullable();
            $table->integer('damaged_part_qty')->nullable();
            $table->text('reason_for_fail')->nullable();
            $table->text('image')->nullable();
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('sla_wash_cure_2');
    }
};
