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
        Schema::create('finished_good_inventory', function (Blueprint $table) {
            $table->id();
            $table->text('order_id')->nullable();
            $table->text('client_name')->nullable();
            $table->text('technology')->nullable();
            $table->text('material_variant')->nullable();
            $table->decimal('price_per_gram')->nullable();
            $table->decimal('total_weight')->nullable();
            $table->integer('total_qty')->nullable();
            $table->decimal('part_cost')->nullable();
            $table->decimal('paint_cost')->nullable();
            $table->decimal('labour_cost')->nullable();
            $table->decimal('packaging_and_forwarding_cost')->nullable();
            $table->decimal('inhouse_finished_part_value')->nullable();
            $table->decimal('total_order_value')->nullable();
            $table->decimal('outward')->nullable();
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('finished_good_inventory');
    }
};
