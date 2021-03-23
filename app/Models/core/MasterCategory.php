<?php

namespace App\Models\core;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class MasterCategory extends Model
{
    use HasFactory;

    protected $fillable = [
        'id',
        'budget_id',
        'category_name',
        'sub_categories'
        
    ];

    public function budget() { 
        return $this->belongsTo(MasterBudget::class, 'budget_id', 'id');
    }

    public function sub_categories() {
        return $this->hasMany(SubCategory::class, 'category_id', 'id');
    }

    
}
