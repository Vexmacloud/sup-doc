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
        Schema::table('work_order2', function (Blueprint $table) {
            $table->unsignedBigInteger('order_id')->nullable();
            $table->foreign('order_id')->references('id')->on('orders');
            $table->string('client_name', 55)->nullable();
            $table->string('technology', 16)->nullable();
            $table->date('inquiry_date')->nullable();
            $table->date('confirmation_date')->nullable();
            $table->date('expected_dispatch_date')->nullable();
            $table->string('exhibition_model', 3)->nullable();
            $table->string('model_name', 27)->nullable();
            $table->string('design_modification', 5)->nullable();
            $table->string('pre_audit', 4)->nullable();
            $table->string('3d_printing', 19)->nullable();
            $table->string('post_processing', 19)->nullable();
            $table->string('paint', 12)->nullable();
            $table->string('final_audit', 4)->nullable();
            $table->string('shipped', 4)->nullable();
            $table->date('shipped_date')->nullable();
            $table->string('pre_audit_folder', 72)->nullable();
            $table->string('3d_print_folder', 72)->nullable();
            $table->string('post_processing_folder', 72)->nullable();
            $table->string('painted_part_folder', 72)->nullable();
            $table->string('final_audit_folder', 72)->nullable();
            $table->string('packaging_folder', 72)->nullable();
            $table->string('x_mm', 4)->nullable();
            $table->string('y_mm', 4)->nullable();
            $table->string('z_mm', 3)->nullable();
            $table->string('model_dimension', 12)->nullable();
            $table->string('model_type', 7)->nullable();
            $table->string('required_services')->nullable();
            $table->string('assembly_required', 3)->nullable();
            $table->string('flight_case_required', 3)->nullable();
            $table->integer('flight_case_charges_per_box')->nullable();
            $table->string('flight_case_dimension', 10)->nullable();
            $table->string('acrylic_box_required', 3)->nullable();
            $table->integer('acrylic_box_charges_per_box')->nullable();
            $table->string('acrylic_box_type', 10)->nullable();
            $table->string('epf_foam_cutting_required', 3)->nullable();
            $table->integer('foam_cutting_charges_per_set')->nullable();
            $table->string('foam_dimension', 10)->nullable();
            $table->string('sticker_type', 22)->nullable();
            $table->integer('sticker_charges')->nullable();
            $table->string('delayed_due_to', 67)->nullable();
            $table->date('initial_expected_delivery_date')->nullable();
            $table->integer('total_parts_qty')->nullable();
            $table->integer('order_parts_printed_qty')->nullable();
            $table->integer('order_parts_failed_qty')->nullable();
            $table->integer('order_parts_pending_qty')->nullable();
            $table->string('status', 19)->nullable();
            $table->string('paint_required', 12)->nullable();
            $table->string('packed', 15)->nullable();
            $table->string('manual_doc', 49)->nullable();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::table('work_order2', function (Blueprint $table) {
            //
        });
    }
};
