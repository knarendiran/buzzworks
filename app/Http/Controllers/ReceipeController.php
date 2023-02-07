<?php

namespace App\Http\Controllers;

use App\Models\Receipe;

use Illuminate\Http\Request;
use DB;

class ReceipeController extends Controller
{
    
    public function List()
    {
        return response()->json(Receipe::all());
    }

    public function getById($id)
    {
        return response()->json(Receipe::find($id));
    }

    public function create(Request $request)
    {
        $Receipelist = Receipe::create($request->all());

        return response()->json($Receipelist, 201);
    }

    public function update($id, Request $request)
    {
        $Receipe = Receipe::findOrFail($id);
        
        $Receipe->update($request->all());

        return response()->json($Receipe, 200);
    }

    public function delete($id)
    {

        $Receipe = Receipe::find($id);
      
        if($Receipe){
             Receipe::findOrFail($id)->delete();
            return response('Deleted Successfully', 200);
        }
        else
             return response('Receipe Not Found', 200);
    }

    public function rating($id='', Request $request)
    {
       
        $Receipe = Receipe::find($id);
        $rating = $request->star;



        if($Receipe){

            $data = array('rating'=>$rating,'receipe_id'=>$id);

            DB::table('rating')->insert($data);

            return response('Rating Successfully', 200);

        }else
             return response('Receipe Not Found', 200);
         
    }
}
