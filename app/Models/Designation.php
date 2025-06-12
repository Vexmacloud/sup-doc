<?php

namespace App\Models;

use App\Traits\setUUIdTrait;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Designation extends Model
{
    use HasFactory,setUUIdTrait;

    protected $fillable = ['name'];

    public function users(){
        return $this->hasMany(User::class,'designation_uuid','uuid');
    }
    //  public function employee(){
    //     return $this->hasMany(Employee::class,'designation_uuid','uuid');
    // }
}
