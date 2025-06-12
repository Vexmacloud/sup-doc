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
        Schema::create('orders_files', function (Blueprint $table) {
            $table->id();
            $table->uuid('uuid')->unique();

            $table->uuid('order_uuid')->nullable();
            $table->foreign('order_uuid')->references('uuid')->on('orders')->onDelete('cascade');

            $table->text('path')->nullable();
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('orders_files');
    }
};
