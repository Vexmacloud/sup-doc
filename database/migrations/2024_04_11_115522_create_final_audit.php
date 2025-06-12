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
        Schema::create('final_audit', function (Blueprint $table) {
            $table->id();
            $table->unsignedBigInteger('uuid')->nullable();
            $table->unsignedBigInteger('order_uuid')->nullable();
            $table->unsignedBigInteger('user_uuid')->nullable();
            $table->integer('part_id')->nullable();
            $table->string('file_name')->nullable();
            $table->text('technology_uuid')->nullable();
            $table->integer('quantity_of_parts')->nullable();
            $table->date('audit_date')->nullable();
            $table->text('audit_type')->nullable();
            $table->text('audit_stage')->nullable();
            $table->text('image')->nullable();
            $table->text('assigned_to')->nullable();
            $table->timestamps();
        });
    }
    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('final_audit');
    }
};
