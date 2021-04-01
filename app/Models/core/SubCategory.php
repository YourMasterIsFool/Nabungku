<?php

namespace App\Models\core;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use App\Models\core\Activity;
use DB;

class SubCategory extends Model
{
    use HasFactory;

   
    protected $fillable = [
        'id',
        'category_id',
        'sub_category_name',
        'budgeted',
        'available',

    ];

    public function category(){
        return $this->belongsTo(MasterCategory::class, 'category_id', 'id');
    }

    public function activity() {
        return $this->hasMany(Activity::class, 'sub_category_id', 'id');
    }
}
