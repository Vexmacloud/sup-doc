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
        Schema::create('sla_wash_cure', function (Blueprint $table) {
            $table->id();
            $table->unsignedBigInteger('user_id')->nullable();
            $table->unsignedBigInteger('wash_id')->nullable();
            $table->unsignedBigInteger('order_id')->nullable();
            $table->foreign('order_id')->references('id')->on('sla_wash_cure_2');
            $table->integer('printed_qty')->nullable();
            $table->integer('washed_qty')->nullable();
            $table->integer('cured_qty')->nullable();
            $table->text('file_name')->nullable();
            $table->text('process')->nullable();
            $table->timestamp('wash_start_time')->nullable();
            $table->timestamp('wash_end_time')->nullable();
            $table->timestamp('cure_start_time')->nullable();
            $table->timestamp('cure_end_time')->nullable();
            $table->decimal('total_wash_time')->nullable();
            $table->decimal('total_cure_time')->nullable();
            $table->foreign('done_by')->references('id')->on('users');
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('sla_wash_cure');
    }
};
