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
        Schema::create('sla_print_sheet', function (Blueprint $table) {
            $table->id();
            $table->unsignedBigInteger('print_id')->nullable();
            $table->string('material')->nullable();
            $table->unsignedBigInteger('order_id')->nullable();
            $table->string('client_name')->nullable();
            $table->string('file_name')->nullable();
            $table->integer('total_printed_qty')->nullable();
            $table->integer('no_of_failed_qty')->nullable();
            $table->decimal('laser_power')->nullable();
            $table->decimal('resin_level')->nullable();
            $table->timestamp('start_time')->nullable();
            $table->timestamp('end_time')->nullable();
            $table->decimal('total_time')->nullable();
            $table->string('LP')->nullable();
            $table->string('maintenance')->nullable();
            $table->string('add_resin')->nullable();
            $table->integer('gallon_no')->nullable();
            $table->decimal('total_material_used')->nullable();
            $table->decimal('ac_consumption')->nullable();
            $table->decimal('machine_consumption')->nullable();
            $table->decimal('ec_consumption_per_print')->nullable();
            $table->decimal('resolution_percent')->nullable();
            $table->string('speed')->nullable();
            $table->string('support_structure')->nullable();
            $table->string('form_filled_by')->nullable();
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('sla_print_sheet');
    }
};
