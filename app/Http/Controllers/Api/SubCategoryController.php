<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use App\Models\core\SubCategory;
use Illuminate\Http\Request;
use DB;

class SubCategoryController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index(Request $request)
    {
        $data = SubCategory::withCount(['activity as activity' => function ($query) {
            $query->select(DB::raw('COALESCE(sum(income-expense), 0)'));
        }])->where('category_id', $request->input('category_id'))->get();

        return response()->json([
            'data' => $data
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
                'category_id' , '=', $request->input('category_id')
            ],
            [
                'sub_category_name', '=',$request->input('sub_category_name')
            ], 
          
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
            ]);
            $data['activity'] = 0;
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
           $payload = [
            'sub_category_name' => $request->input('sub_category_name'),
            'budgeted' => $request->input('budgeted'),
            
            ];
        if($request->filled('amount')) {

            $payload = [
                'amount' => $request->input('amount'),
                'finishBy' => $request->input('finishBy'),
                'period' => $request->input('period'),
            ];
             SubCategory::where('id', $id)->update($payload);

             $data = SubCategory::withCount(['activity as activity' => function($query) {
                $query->select(DB::raw('sum(income-expense)'));
             }])->where('id',$id)->first();

            return response()->json([
                'data' => $data
                    
            ], 200); 

        }


       else {
         if(SubCategory::where([
            ['id', '=', $id],
            ['sub_category_name', '=', $request->input('sub_category_name')]
            ])->count() > 0) {
              

            SubCategory::where('id', $id)->update($payload);

             $data = SubCategory::withCount(['activity as activity' => function($query) {
                $query->select(DB::raw('sum(income-expense)'));
             }])->where('id',$id)->first();

            return response()->json([
                'data' => $data
                    
            ], 200); 
            }
        else if(SubCategory::where([
            ['sub_category_name', '=', $request->input('sub_category_name')]
            ])->count() > 0) {
            $error = "sub category name has been used";
            return response()->json([
                'data' => $error
            ], 400);
        }
        else {

            SubCategory::where('id', $id)->update($payload);

                  $data = SubCategory::withCount(['activity as activity' => function($query) {
                $query->select(DB::raw('sum(income-expense)'));
             }])->where('id',$id)->first();
            return response()->json([
                'data' => $data
                    
            ], 200); 
        }
       }
        
    }

    public function updateAmount(Request $request, $id) {
        return response()->json([
            'data' => $request->all()
        ]);
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
