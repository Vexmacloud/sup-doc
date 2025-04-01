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
        Schema::create('Inventory', function (Blueprint $table) {
            $table->id();
            $table->text('material_variant')->nullable();
            $table->text('material_name')->nullable();
            $table->text('technical_specification')->nullable();
            $table->text('material')->nullable();
            $table->text('technology')->nullable();
            $table->decimal('price_per_grams')->nullable();
            $table->text('vendor_name')->nullable();
            $table->text('image')->nullable();
            $table->decimal('initial_stock_grams')->nullable();
            $table->decimal('inward')->nullable();
            $table->decimal('outward')->nullable();
            $table->decimal('available_stock')->nullable();
            $table->decimal('stock_value')->nullable();
            $table->text('category')->nullable();
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('Inventory');
    }
};
