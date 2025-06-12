<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class UserNotification extends Model
{
    use HasFactory;

    protected $table = 'user_notification';

    protected $fillable = [
        'sender_id',
        'receiver_id',
        'message',
        'is_read',
        'type'
    ];

    protected $casts = [
        'is_read' => 'boolean'
    ];
    public function user()
    {
        return $this->belongsTo(User::class, 'sender_id', 'uuid');
    }
}
