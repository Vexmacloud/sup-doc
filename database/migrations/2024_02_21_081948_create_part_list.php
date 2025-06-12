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
        Schema::create('part_list', function (Blueprint $table) {
            $table->id();
            $table->uuid('uuid')->nullable();
            $table->unsignedBigInteger('order_id')->nullable();
            $table->foreign('order_id')->references('id')->on('work_order2')->onDelete('cascade');
            $table->uuid('user_uuid')->nullable();
            $table->foreign('user_uuid')->references('uuid')->on('users')->onDelete('cascade');
            $table->uuid('technology_uuid')->nullable();
            $table->foreign('technology_uuid')->references('uuid')->on('technologies')->onDelete('cascade');
            $table->uuid('material_uuid')->nullable();
            $table->foreign('material_uuid')->references('uuid')->on('materials')->onDelete('cascade');
            $table->string('machine')->nullable();
            // $table->foreign('machine_uuid')->references('uuid')->on('machines_sheet')->onDelete('cascade');
            $table->string('resolution')->nullable();
            $table->string('part_name')->nullable();
            $table->integer('qty')->nullable();
            $table->decimal('per_part_weight')->nullable();
            $table->decimal('volume_cc')->nullable();
            $table->decimal('support_cc')->nullable();
            $table->decimal('chargable_cc')->nullable();
            $table->decimal('total_cc')->nullable();
            $table->decimal('total_weight_cc')->nullable();
            $table->text('finish_type')->nullable();
            $table->text('paint_required')->nullable();
            $table->text('mechanical_attachment')->nullable();
            $table->text('part_id')->nullable();
            $table->integer('printed_qty')->nullable();
            $table->integer('failed_qty')->nullable();
            $table->integer('pending_qty')->nullable();
            $table->string('part_image')->nullable();
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('part_list');
    }
};
