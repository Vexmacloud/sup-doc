<?php
use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class ChangeIdDataTypeInUserNotificationTable extends Migration
{
    public function up()
    {
        Schema::table('user_notification', function (Blueprint $table) {
            $table->string('sender_id')->change();
            $table->string('receiver_id')->change();
        });
    }

    public function down()
    {
        Schema::table('user_notification', function (Blueprint $table) {
            $table->unsignedBigInteger('sender_id')->change();
            $table->unsignedBigInteger('receiver_id')->change();
        });
    }
}
