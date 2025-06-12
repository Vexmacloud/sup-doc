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
        Schema::create('print', function (Blueprint $table) {
            $table->id();
            $table->unsignedBigInteger('order_uuid')->nullable();
            $table->unsignedBigInteger('user_uuid')->nullable();
            $table->text('technology_uuid')->nullable();
            $table->text('inventory_uuid')->nullable();
            $table->text('machine_uuid')->nullable();
            $table->integer('unit')->nullable();
            $table->integer('container_id')->nullable();
            $table->integer('nozzel')->nullable();
            $table->date('print_start_time')->nullable();
            $table->integer('layer_height')->nullable();
            $table->integer('infill')->nullable();
            $table->integer('nozzel_temp')->nullable();
            $table->integer('bed_temp')->nullable();
            $table->integer('speed')->nullable();
            $table->text('support_structure')->nullable();
            $table->text('support_density')->nullable();
            $table->text('support_interferance')->nullable();
            $table->text('cooling_duration')->nullable();
            $table->date('print_end_time')->nullable();
            $table->date('total_time')->nullable();
            $table->text('print_status')->nullable();
            $table->text('reason_failing')->nullable();
            $table->integer('total_parts_print_qty')->nullable();
            $table->integer('laser_power')->nullable();
            $table->integer('resin_level')->nullable();
            $table->text('file_name')->nullable();
            $table->text('ac_consup')->nullable();
            $table->text('machine_power_consup')->nullable();
            $table->integer('total_part_cc')->nullable();
            $table->integer('total_support_cc')->nullable();
            $table->integer('total_print_cc')->nullable();
            $table->integer('total_cc_to_weight')->nullable();
            $table->integer('actual_weight')->nullable();
            $table->integer('build_plate')->nullable();
            $table->integer('bed_weight_before_print')->nullable();
            $table->integer('bed_weight_after_print')->nullable();
            $table->integer('nitrogen_cylinder')->nullable();
            $table->integer('nitrogen_cylinder_presure_before_printing')->nullable();
            $table->integer('nitrogen_cylinder_presure_after_printing')->nullable();
            $table->integer('total_nitrogen_usage')->nullable();
            $table->integer('chiller_power_consup')->nullable();
            $table->integer('diffrence')->nullable();
            $table->text('assigned_to')->nullable();
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('printPlan');
    }
};
