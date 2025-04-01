<?php

namespace App\Models;

// use Illuminate\Contracts\Auth\MustVerifyEmail;

use App\Traits\setUUIdTrait;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Foundation\Auth\User as Authenticatable;
use Illuminate\Notifications\Notifiable;
use Illuminate\Support\Facades\Hash;
use Laravel\Sanctum\HasApiTokens;

class User extends Authenticatable
{
    use HasApiTokens, HasFactory, Notifiable, setUUIdTrait;

    /**
     * The attributes that are mass assignable.
     *
     * @var array<int, string>
     */
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
        'tour_status'
    ];

    /**
     * The attributes that should be hidden for serialization.
     *
     * @var array<int, string>
     */
    protected $hidden = [
        'password',
        'remember_token',
    ];

    /**
     * The attributes that should be cast.
     *
     * @var array<string, string>
     */
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
}
