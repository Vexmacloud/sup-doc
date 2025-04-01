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
        Schema::create('outward_sheet', function (Blueprint $table) {
            $table->id();
            $table->text('technology')->nullable();
            $table->text('material')->nullable();
            $table->text('material_variant')->nullable();
            $table->text('container_id')->nullable();
            $table->integer('spool_container_number')->nullable();
            $table->decimal('outward_weight')->nullable();
            $table->text('outward_by')->nullable();
            $table->text('category')->nullable();
            $table->integer('qty')->nullable();
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('outward_sheet');
    }
};
