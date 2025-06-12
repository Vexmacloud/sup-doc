<?php

namespace App\Models;

use App\Traits\setUUIdTrait;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Department extends Model
{
    use HasFactory, setUUIdTrait;

    protected $fillable = ['name'];

    public function users()
    {
        return $this->hasMany(User::class, 'department_uuid', 'uuid');
    }
    // public function employee()
    // {
    //     return $this->hasMany(Employee::class, 'department_uuid', 'uuid');
    // }
}
