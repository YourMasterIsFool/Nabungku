<?php

namespace App\Models\core;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class SubCategory extends Model
{
    use HasFactory;

   
    protected $fillable = [
        'id',
        'category_id',
        'sub_category_name',
        'budgeted',
        'activity',
        'available'

    ];

    public function category(){
        return $this->belongsTo(MasterCategory::class, 'category_id', 'id');
    }
}
