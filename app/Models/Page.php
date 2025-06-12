<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Page extends Model
{
    use HasFactory;

    // Add this method to your Page model
    public function contentBlocks()
    {
        return $this->hasMany(ContentBlock::class)->orderBy('order');
    }
}