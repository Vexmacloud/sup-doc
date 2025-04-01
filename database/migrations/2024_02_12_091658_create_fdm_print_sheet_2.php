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
        Schema::create('fdm_print_sheet_2', function (Blueprint $table) {
            $table->id();
            $table->string('uid')->nullable();
            $table->unsignedBigInteger('print_id')->nullable();
            $table->unsignedBigInteger('order_id')->nullable();
            $table->string('client_name')->nullable();
            $table->string('part_name')->nullable();
            $table->integer('printed_qty')->nullable();
            $table->text('print_status')->nullable();
            $table->text('reason_for_failure')->nullable();
            $table->string('part_image')->nullable();
            $table->string('Part_Id')->nullable();
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('fdm_print_sheet_2');
    }
};
