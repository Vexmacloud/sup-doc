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
        Schema::table('orders', function (Blueprint $table) {
            $table->dropColumn('technology_or_department');
            $table->dropColumn('material');

            $table->uuid('technology_uuid')->nullable();
            $table->foreign('technology_uuid')->references('uuid')->on('technologies')->onDelete('cascade');
            $table->uuid('material_uuid')->nullable();
            $table->foreign('material_uuid')->references('uuid')->on('materials')->onDelete('cascade');
            
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::table('orders', function (Blueprint $table) {
            //
        });
    }
};
