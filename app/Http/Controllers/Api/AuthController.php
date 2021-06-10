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

        $rules = [
            'email' => 'required',
            'password' => 'required',
            'firstname' => 'required',
            'lastname' => 'required',
        ];

        $request->validate($rules);

        if(User::where('email', $request->input('email'))->count() > 1) {
            $response = [
                'message' => 'email has been exists'
            ] ;

             return response()->json([
             "data" => $response
         ], 400);

        }

        $user = User::create([
            'lastname' => $request->input('lastname'),
            'firstname'  =>  $request->input('firstname'),
            'password' => Hash::make($request->input('password')),
            'email'  => $request->input('email'),
        ]);
        
        return response()->json([
            "data" => $user
        ]);

    }

    public function editUser(Request $request) {
        
        $filename = '';
        $photos = $request->file('photos');
        
        if($photos) {
            $filename = now().str_replace(' ','_', $photos->getClientOriginalName());
            $photos->move(public_path('avatars'), $filename);
        }
      
        

        if($request->input('password') != null) {
           if($request->file('photos') == null) {
            User::where('id', $request->user()->id)->update([
                'firstname' => $request->input('firstname'),
                'lastname' => $request->input('lastname'),
                'password' => Hash::make($request->input('password')),
            ]);
           }
           else{
            User::where('id', $request->user()->id)->update([
                'firstname' => $request->input('firstname'),
                'photos' => $filename,
                'lastname' => $request->input('lastname'),
                'password' => Hash::make($request->input('password')),
            ]);
           }
        }
            if($request->file('photos')){
                User::where('id', $request->user()->id)->update([
                    'firstname' => $request->input('firstname'),
                    'lastname' => $request->input('lastname'),
                    'photos' => $filename
                ]);
            }
            else {
                User::where('id', $request->user()->id)->update([
                    'firstname' => $request->input('firstname'),
                    'lastname' => $request->input('lastname'),
                ]);
            }

        $user = User::findOrFail($request->user()->id);
        return response()->json([
            'data' => $user
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
            $response['user_detail'] = $user->load('user_detail');

            return response()->json([
                'data' => $response
            ], 200);

        }
        else {
            $response['success'] = false;
            $response['message'] = "Username or password incorrected";
            return response()->json([
                'data' => $response
            ],
            401
        );
        }
    }

    public function me(Request $request) {


        return response()->json([
            'data' => $request->user()
        ]);
    }
}
