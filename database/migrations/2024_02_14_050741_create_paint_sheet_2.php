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
        Schema::create('paint_sheet_2', function (Blueprint $table) {
            $table->id();
            $table->unsignedBigInteger('paint_batch_id')->nullable();
            $table->foreign('paint_batch_id')->references('id')->on('paint_sheet');
            $table->unsignedBigInteger('order_id')->nullable();
            $table->foreign('order_id')->references('id')->on('paint_plan');
            $table->text('client_name')->nullable();
            $table->text('part_name')->nullable();
            $table->integer('quantity')->nullable();
            $table->text('part_status')->nullable();
            $table->text('which_color')->nullable();
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('paint_sheet_2');
    }
};
