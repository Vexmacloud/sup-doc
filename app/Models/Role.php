<?php

namespace App\Models;

use App\Traits\setUUIdTrait;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Role extends Model
{
    use HasFactory, setUUIdTrait;

    protected $fillable = ['role'];

    // Existing hasMany relationship
    public function users()
    {
        return $this->hasMany(User::class, 'role_uuid', 'uuid');
    }

    // Adding the belongsToMany relationship
    public function usersManyToMany()
    {
        return $this->belongsToMany(User::class, 'user_roles', 'role_id', 'user_id');
    }
}
