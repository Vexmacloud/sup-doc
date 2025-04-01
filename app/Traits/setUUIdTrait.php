<?php

namespace App\Traits;
use Illuminate\Support\Str;



trait setUUIdTrait{

    protected static function boot(){
        parent::boot();

        static::creating(function($model){
            if(empty($model->uuid)){
                $model->uuid = Str::uuid();
            }
        });
    }
}
