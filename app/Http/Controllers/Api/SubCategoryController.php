<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use App\Models\core\SubCategory;
use Illuminate\Http\Request;

class SubCategoryController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index(Request $request)
    {
        $data = SubCategory::where('category_id', $request->input('category_id'))->get();

        return response()->json([
            $data
        ]);
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        //
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        //
        if(SubCategory::where([
            [
                'sub_category_name', '=',$request->input('sub_category_name')
            ], 
            [
                'category_id' , '=', $request->input('category_id')
            ]
        ])->count() > 0 )
        {   
            $error_message = "This sub Category name has been used";
            return response()->json([
                'data'=> $error_message
            ], 400);
        }
        else {
            $data = SubCategory::create([
                'category_id' => $request->input('category_id'),
                'sub_category_name' => $request->input('sub_category_name'),
                'budgeted' => 0,
                'activity' => 0,
                'available' => 0
            ]);
            return response()->json([
                'data' => $data
            ], 200);
        }
        
    }

    /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function show($id)
    {
        //
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function edit($id)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, $id)
    {
        //
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        //
    }
}
