<?php

namespace App\Models;

use App\Traits\setUUIdTrait;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Role extends Model
{
    use HasFactory, setUUIdTrait;

    protected $fillable = ['role'];

    public function users()
    {
        return $this->hasMany(User::class, 'role_uuid', 'uuid');
    }
}
