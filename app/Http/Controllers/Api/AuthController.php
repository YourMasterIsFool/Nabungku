<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use App\Models\User;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Hash;

class AuthController extends Controller
{
    //

    public function register(Request $request) {
        $user = User::create([
            'name'  =>  $request->input('name'),
            'password' => Hash::make($request->input('password')),
            'email'  => $request->input('email'),
        ]);
        
        return response()->json([
            "data" => $user
        ]);

    }

    public function login(Request $request) {
        $rules = [
            'email' => 'required',
            'password' => 'required'
        ];

        $request->validate($rules);

        $data = [
            'email' => $request->input('email'),
            'password' => $request->input('password')
        ];

        if(Auth::attempt($data)) {
            $user = Auth::user();
            $response['token'] = $user->createToken('Laravel')->accessToken;
            $response['success'] = true;

            return response()->json([
                'data' => $response
            ], 200);

        }
        else {
            $response['success'] = false;
            $response['message'] = "Username or password incorrected";
            return response()->json([
                'data' => $data
            ],
            401
        );
        }
    }
}