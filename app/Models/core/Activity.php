<?php

namespace App\Models\core;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Activity extends Model
{
    use HasFactory;

    protected $fillable = [
    	'sub_category_id',
    	'expense',
    	'income',
    	'created_at'

    ];

    public function getCreatedAtAttribute($value) {
    	return \Carbon\Carbon::parse($value)->format('d/m/Y');
    }

    public function sub_category() {
        return $this->belongsTo(SubCategory::class, 'sub_category_id', 'id');
    }
}
