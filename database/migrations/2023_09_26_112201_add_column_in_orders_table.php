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
        Schema::table('orders', function (Blueprint $table) {
            $table->text('value')->nullable()->after('inquiry_date');
            $table->text('quantity_of_parts')->nullable()->after('value');
            $table->text('finish_status')->nullable()->after('quantity_of_parts');
            $table->text('payment_status')->nullable()->after('finish_status');
            $table->text('length')->nullable()->after('payment_status');
            $table->text('width')->nullable()->after('length');
            $table->text('height')->nullable()->after('width');
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::table('orders', function (Blueprint $table) {
            //
        });
    }
};