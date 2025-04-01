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
            $table->unsignedBigInteger('final_audit_id')->nullable();
            $table->unsignedBigInteger('order_id')->nullable();
            $table->foreign('order_id')->references('id')->on('orders');
            $table->text('client_name')->nullable();
            $table->text('file_name')->nullable();
            $table->text('technology')->nullable();
            $table->text('audit_type')->nullable();
            $table->text('audit_stage')->nullable();
            $table->integer('qty')->nullable();
            $table->text('audit_done_by')->nullable();
            $table->date('audit_date')->nullable();
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
