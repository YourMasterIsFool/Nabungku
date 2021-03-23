<?php

namespace App\Models\core;

use App\Models\User;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class MasterBudget extends Model
{
    use HasFactory;

    protected $fillable = [
        'user_id',
        'name_budget',
        'category'
    ];

    public function user() {
        
        return $this->belongsTo(User::class, 'user_id', 'id');
    }

    public function category() {
        return $this->hasMany(MasterCategory::class, 'budget_id', 'id');
    }
}
