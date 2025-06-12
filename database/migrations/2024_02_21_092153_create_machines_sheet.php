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
        Schema::create('machines_sheet', function (Blueprint $table) {
            $table->id();
            $table->unsignedBigInteger('machine_id');
            $table->uuid('technology');
            $table->foreign('technology')->references('uuid')->on('technologies');
            $table->text('machine_name');
            $table->text('machine_type');
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('machines_sheet');
    }
};
