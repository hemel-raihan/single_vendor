<?php

namespace App\Http\Controllers\Admin\Product;

use App\Http\Controllers\Controller;
use App\Models\Product\Tax;
use Illuminate\Http\Request;

class TaxController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $taxes = Tax::all();
        return view('backend.admin.product.tax.form',compact('taxes'));
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        return view('backend.admin.product.tax.form');
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        $this->validate($request,[
            'name' => 'required|unique:taxes',
        ]);

        if(!$request->status)
        {
            $status = 0;
        }
        else
        {
            $status = 1;
        }

        $tax = Tax::create([
            'name' => $request->name,
            'status' => $status,
        ]);

        notify()->success("Tax Successfully created","Added");
        return redirect()->route('admin.taxes.index');
    }

    public function status($id)
    {
        $tax = Tax::find($id);
        if($tax->status == true)
        {
            $tax->status = false;
            $tax->save();

            notify()->success('Successfully Deactiveated Post');
        }
        elseif($tax->status == false)
        {
            $tax->status = true;
            $tax->save();

            notify()->success('Removed the Activeated Approval');
        }

        return redirect()->back();
    }

    /**
     * Display the specified resource.
     *
     * @param  \App\Models\Product\Tax  $tax
     * @return \Illuminate\Http\Response
     */
    public function show(Tax $tax)
    {
        //
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  \App\Models\Product\Tax  $tax
     * @return \Illuminate\Http\Response
     */
    public function edit(Tax $tax)
    {
        $taxes = Tax::all();
        return view('backend.admin.product.tax.form',compact('tax','taxes'));
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\Models\Product\Tax  $tax
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, Tax $tax)
    {
        $this->validate($request,[
            'name' => 'required',
        ]);

        if(!$request->status)
        {
            $status = 0;
        }
        else
        {
            $status = 1;
        }

        $tax->update([
            'name' => $request->name,
            'status' => $status,
        ]);

        notify()->success('Tax Updated','Update');
        return redirect()->route('admin.taxes.index');
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Models\Product\Tax  $tax
     * @return \Illuminate\Http\Response
     */
    public function destroy(Tax $tax)
    {
        $tax->delete();
        notify()->success('Tax Deleted Successfully','Delete');
        return back();
    }
}
