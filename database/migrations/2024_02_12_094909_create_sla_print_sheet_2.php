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
        Schema::create('sla_print_sheet_2', function (Blueprint $table) {
            $table->id();
            $table->string('uid')->nullable();
            $table->unsignedBigInteger('print_id')->nullable();
            $table->unsignedBigInteger('order_id')->nullable();
            $table->string('part_name')->nullable();
            $table->integer('printed_qty')->nullable();
            $table->integer('failed_qty')->nullable();
            $table->integer('passed_qty')->nullable();
            $table->decimal('part_cc')->nullable();
            $table->decimal('support_cc')->nullable();
            $table->decimal('total_cc')->nullable();
            $table->decimal('cc_to_weight')->nullable();
            $table->decimal('actual_weight')->nullable();
            $table->decimal('part_weight_difference')->nullable();
            $table->text('print_status')->nullable();
            $table->text('reason_for_failure')->nullable();
            $table->text('image_path')->nullable();
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('sla_print_sheet_2');
    }
};
