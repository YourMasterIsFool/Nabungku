<?php

use App\Http\Controllers\Api\AuthController;
use App\Http\Controllers\core\UserController;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;



/*
|--------------------------------------------------------------------------
| API Routes
|--------------------------------------------------------------------------
|
| Here is where you can register API routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| is assigned the "api" middleware group. Enjoy building your API!
|
*/

// Route::middleware('auth:api')->get('/user', function (Request $request) {
//     return $request->user();
// });

// Route::prefix('api')->group(function() {
   
// });
// Route::post('register', [UserController::class, 'store']);
// Route::resource('users', UserController::class);


// Auth
Route::post('register', [AuthController::class, 'register']);
Route::post('login', [AuthController::class, 'login']);


// After Auth
Route::group(['middleware' => 'auth:api'], function() {
   
});