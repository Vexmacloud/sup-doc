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
        Schema::create('post_processing', function (Blueprint $table) {
            $table->id();
            $table->unsignedBigInteger('pp_uuid')->nullable();
            $table->unsignedBigInteger('part_uuid')->nullable();
            $table->unsignedBigInteger('order_uuid')->nullable();
            $table->text('technology_uuid')->nullable();
            $table->date('pp_start_time')->nullable();
            $table->date('pp_end_time')->nullable();
            $table->text('total_pp_time')->nullable();
            $table->integer('total_wash_qty')->nullable();
            $table->text('file_name')->nullable();
            $table->integer('total_part_pp')->nullable();
            $table->text('assigned_to')->nullable();
            $table->timestamps();
        });
    }
    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('post_processing');
    }
};
