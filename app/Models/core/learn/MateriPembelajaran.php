<?php

namespace App\Models\core\learn;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class MateriPembelajaran extends Model
{
    use HasFactory;
    protected $fillable = [
        'title',
        'body',
        'category_pembelajaran_id',
        'images_url'
    ];


}
