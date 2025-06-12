<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class AddOrderIdToUserNotificationTable extends Migration
{
    public function up()
    {
        Schema::table('user_notification', function (Blueprint $table) {
            $table->string('order_id')->nullable();
        });
    }

    public function down()
    {
        Schema::table('user_notification', function (Blueprint $table) {
            $table->dropColumn('order_id');
        });
    }
}
