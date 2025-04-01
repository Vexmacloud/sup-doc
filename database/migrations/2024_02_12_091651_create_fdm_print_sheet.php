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
        Schema::create('fdm_print_sheet', function (Blueprint $table) {
            $table->id();
            $table->unsignedBigInteger('print_id')->nullable();
            $table->unsignedBigInteger('order_id')->nullable();
            $table->string('client_name')->nullable();
            $table->string('file_name')->nullable();
            $table->integer('total_printed_qty')->nullable();
            $table->string('material')->nullable();
            $table->string('material_variant')->nullable();
            $table->integer('container_id')->nullable();
            $table->string('nozzle_size')->nullable();
            $table->integer('infill_percent')->nullable();
            $table->string('machine')->nullable();
            $table->timestamp('start_time')->nullable();
            $table->timestamp('end_time')->nullable();
            $table->decimal('gross_weight')->nullable();
            $table->decimal('layer_height')->nullable();
            $table->decimal('nozzle_temp')->nullable();
            $table->decimal('bed_temp')->nullable();
            $table->integer('speed')->nullable();
            $table->string('support_structure')->nullable();
            $table->integer('support_structure_density')->nullable();
            $table->integer('support_interference')->nullable();
            $table->integer('cooling_duration')->nullable();
            $table->integer('total_time')->nullable();
            $table->text('form_filled_by')->nullable();
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('fdm_print_sheet');
    }
};
