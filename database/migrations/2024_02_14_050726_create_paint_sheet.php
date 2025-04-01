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
        Schema::create('paint_sheet', function (Blueprint $table) {
            $table->id();
            $table->unsignedBigInteger('paint_batch_id')->nullable();
            $table->foreign('paint_batch_id')->references('id')->on('paint_plan');
            $table->text('order_id')->nullable();
            $table->text('client_name')->nullable();
            $table->text('part_name')->nullable();
            $table->integer('total_quantity')->nullable();
            $table->date('part_given_for_paint')->nullable();
            $table->date('part_received_from_paint')->nullable();
            $table->decimal('paint_cost')->nullable();
            $table->decimal('labour_cost')->nullable();
            $table->decimal('total_cost')->nullable();
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('paint_sheet');
    }
};
