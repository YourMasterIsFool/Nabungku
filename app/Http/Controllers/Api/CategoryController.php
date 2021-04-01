<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use App\Models\core\MasterCategory;
use Illuminate\Http\Request;
use DB;

class CategoryController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index(Request $request)
    {
        $data = MasterCategory::with(['sub_categories' => function($query) {
            $query->withCount(['activity as activity'=> function ($q) {
                $q->select(DB::raw('COALESCE(sum(income-expense), 0)'));
            }]);
         },
        ])
        ->withCount(['sub_categories as budgeted' => function($query) {

            $query->select(DB::raw('COALESCE(sum(budgeted), 0)'));
        },
        'sub_categories as activity' => function($query) {
             $query->withCount(['activity'=> function ($q) {
                $q->select(DB::raw('COALESCE(sum(income-expense), 0)'));
             }]);
        }
        ])
        ->where('budget_id', $request->input('budget_id'))->get();

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
        $category = MasterCategory::create([
            'category_name' => $request->input('name_category'),
            'budget_id' => $request->input('budget_id'),
        ]);

        $category['budgeted'] = 0;
        $category['activity'] = 0;

        return response()->json([
            'data' => $category->load('sub_categories')
        ]);
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
        
        

        
        if(MasterCategory::where('category_name', $request->input('category_name'))->count() > 0) {
            $error_message = "This category name has been exists";
            return response()->json([
                'data' => $error_message
            ], 400);
        }
        else {
            $category = MasterCategory::where('id', $id)
            ->update([
                'category_name' =>  $request->input('category_name'),
            ]);
            return response()->json([
                'data' => [
                    'id' => $id,
                    'category_name' => $request->input('category_name'),
                ]
            ], 200);
        }

       
       
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {

        $category = MasterCategory::find($id);
        $category->delete();

        $success = true;
        return response()->json([
            'data' => [
                'success' => $success
            ]
        ], 200);

    }
}
