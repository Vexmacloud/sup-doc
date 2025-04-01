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
        Schema::create('knowledege_center', function (Blueprint $table) {
            $table->id();
            $table->uuid('uuid')->nullable();
            $table->uuid('service_uuid')->nullable();
            $table->foreign('service_uuid')->references('uuid')->on('services')->onDelete('cascade');

            $table->uuid('sub_service_uuid')->nullable();
            $table->foreign('sub_service_uuid')->references('uuid')->on('sub_services')->onDelete('cascade');

            $table->text('title')->nullable();
            $table->text('short_description')->nullable();
            $table->text('description')->nullable();
            $table->text('image')->nullable();

            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('knowledege_center');
    }
};
