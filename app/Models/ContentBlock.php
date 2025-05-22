<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class ContentBlock extends Model
{
    use HasFactory;

    // Add this method to your ContentBlock model
    public function page()
    {
        return $this->belongsTo(Page::class);
    }
}