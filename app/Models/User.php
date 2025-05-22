<?php

namespace App\Models;

use App\Traits\setUUIdTrait;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Foundation\Auth\User as Authenticatable;
use Illuminate\Notifications\Notifiable;
use Illuminate\Support\Facades\Hash;
use Laravel\Sanctum\HasApiTokens;

class User extends Authenticatable
{
    use HasApiTokens, HasFactory, Notifiable, setUUIdTrait;

    protected $fillable = [
        'name',
        'email',
        'password',
        'mobile',
        'role_uuid',
        'designation_uuid',
        'department_uuid',
        'company',
        'alt_mobile',
        'address',
        'gst',
        'shopping_address',
        'salesperson_bde',
        'reference',
        'fcm_token',
        'assigned_to',
        'account_status',
        'tour_status',
        'is_admin' // Added new attribute
    ];

    protected $hidden = [
        'password',
        'remember_token',
    ];

    protected $casts = [
        'email_verified_at' => 'datetime',
        'password' => 'hashed',
    ];

    public function setPassword($password)
    {
        $this->attributes['password'] = Hash::make($password);
    }

    public function designation()
    {
        return $this->belongsTo(Designation::class, 'designation_uuid', 'uuid');
    }

    public function department()
    {
        return $this->belongsTo(Department::class, 'department_uuid', 'uuid');
    }

    public function role()
    {
        return $this->belongsTo(Role::class, 'role_uuid', 'uuid');
    }

    public function orders()
    {
        return $this->hasMany(Order::class, 'user_uuid', 'uuid');
    }

    public function invoice()
    {
        return $this->hasMany(Invoice::class, 'user_uuid', 'uuid');
    }

    public function comparePassword($password)
    {
        return Hash::check($password, $this->attributes['password']) ? $password : null;
    }

    public function clientdocs()
    {
        return $this->hasMany(ClientDocs::class, 'user_uuid', 'uuid');
    }

    public function inquiry()
    {
        return $this->belongsTo(Inquiry::class, 'user_uuid', 'uuid');
    }

    // NEW METHODS ADDED BELOW
    public function roles()
    {
        return $this->belongsToMany(Role::class);
    }

    public function pages()
    {
        return $this->hasMany(Page::class);
    }

    // Method to check if the user is an admin
    public function isAdmin()
    {
        return $this->is_admin;
    }
}