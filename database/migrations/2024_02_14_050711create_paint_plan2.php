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
        Schema::create('paint_plan2', function (Blueprint $table) {
            $table->id();
            $table->unsignedBigInteger('uid')->nullable();
            $table->unsignedBigInteger('paint_batch_id')->nullable();
            $table->unsignedBigInteger('pp_id')->nullable();
            $table->foreign('pp_id')->references('id')->on('post_process');
            $table->unsignedBigInteger('order_id')->nullable();
            $table->foreign('order_id')->references('id')->on('post_process');
            $table->text('part_id')->nullable();
            $table->text('file_name')->nullable();
            $table->text('technology')->nullable();
            $table->foreign('technology')->references('name')->on('paint_plan');
            $table->integer('pp_qty')->nullable();
            $table->integer('part_qty_for_paint')->nullable();
            $table->text('paint_finish')->nullable();
            $table->text('colour')->nullable();
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('paint_plan2');
    }
};
