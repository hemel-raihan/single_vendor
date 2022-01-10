<?php

namespace App\Http\Controllers\Admin\Product;

use Carbon\Carbon;
use Illuminate\Support\Str;
use Illuminate\Http\Request;
use App\Models\Product\Product;
use App\Models\Product\Flashdeal;
use App\Http\Controllers\Controller;
use Intervention\Image\Facades\Image;

class FlashdealController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $flashdeals = Flashdeal::paginate(10);
        return view('backend.admin.marketing.flash_deals.index',compact('flashdeals'));
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        return view('backend.admin.marketing.flash_deals.form');
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
            'title' => 'required|unique:flashdeals',
            'banner' => 'mimes:png,jpg,jpeg,bmp|max:1024',
            'start_date' => 'required',
            'end_date' => 'required',

        ]);

        //get form image
        $image = $request->file('banner');
        $slug = Str::slug($request->title);

        if(isset($image))
        {
            $currentDate = Carbon::now()->toDateString();
            $imagename = $slug.'-'.$currentDate.'-'.uniqid().'.'.$image->getClientOriginalExtension();

             $categoryphotoPath = public_path('uploads/flashdeal_photo');


            $img                     =       Image::make($image->path());
            $img->resize(900, 600)->save($categoryphotoPath.'/'.$imagename);

        }
        else
        {
            $imagename =null;
        }

        if(!$request->status)
        {
            $status = 0;
        }
        else
        {
            $status = 1;
        }

        $flashdeals = Flashdeal::create([
            'title' => $request->title,
            'slug' => $slug,
            'banner' => $imagename,
            'start_date' => $request->start_date,
            'end_date' => $request->end_date,
            'background_color' => $request->background_color,
            'text_color' => $request->text_color,
            'status' => $status,

        ]);

        $flashdeals->products()->attach($request->products);

        foreach ($request->products as $key => $product) {
        $root_product = Product::findOrFail($product);
        $root_product->discount_rate = $request['discount_'.$product];
        $root_product->discount_type = $request['discount_type_'.$product];
        $root_product->discount_startdate = $request->start_date;
        $root_product->discount_enddate   = $request->end_date;
        $root_product->save();
        }

        notify()->success("Flash-Deals Successfully created","Added");
        return redirect()->route('admin.flash-deals.index');
    }

    /**
     * Display the specified resource.
     *
     * @param  \App\Models\Product\Flashdeal  $flashdeal
     * @return \Illuminate\Http\Response
     */
    public function product_discount(Request $request){
        $product_ids = $request->product_ids;
        return view('backend.admin.marketing.flash_deals.flash_deal_discount', compact('product_ids'));
    }

    // public function approval($id)
    // {
    //     Gate::authorize('app.product.categories.approve');
    //     $category = Productcategory::find($id);
    //     if($category->status == true)
    //     {
    //         $category->status = false;
    //         $category->save();

    //         notify()->success('Successfully approved category');
    //     }
    //     elseif($category->status == false)
    //     {
    //         $category->status = true;
    //         $category->save();

    //         notify()->success('Removed the Category Approval');
    //     }

    //     return redirect()->back();
    // }

    // /**
    //  * Show the form for editing the specified resource.
    //  *
    //  * @param  \App\Models\Product\Flashdeal  $flashdeal
    //  * @return \Illuminate\Http\Response
    //  */
    // public function edit(Flashdeal $flashdeal)
    // {
    //     $categories = Productcategory::where('parent_id', '=', 0)->get();
    //     $subcat = Productcategory::all();
    //     $editsidebars = Sidebar::all();
    //     return view('backend.admin.product.category.form',compact('productcategory','categories','subcat','editsidebars'));
    // }

    // /**
    //  * Update the specified resource in storage.
    //  *
    //  * @param  \Illuminate\Http\Request  $request
    //  * @param  \App\Models\Product\Flashdeal  $flashdeal
    //  * @return \Illuminate\Http\Response
    //  */
    // public function update(Request $request, Flashdeal $flashdeal)
    // {
    //     $this->validate($request,[
    //         'name' => 'required',
    //         'image' => 'mimes:png,jpg,jpeg,bmp|max:1024',
    //         'leftsidebar_id' => 'required',
    //         'rightsidebar_id' => 'required',

    //     ]);

    //     //get form image
    //     $image = $request->file('image');
    //     $slug = Str::slug($request->name);

    //     if(isset($image))
    //     {
    //         $currentDate = Carbon::now()->toDateString();
    //         $imagename = $slug.'-'.$currentDate.'-'.uniqid().'.'.$image->getClientOriginalExtension();

    //         $categoryphotoPath = public_path('uploads/productcategory_photo');

    //         $categoryphoto_path = public_path('uploads/productcategory_photo/'.$productcategory->image);  // Value is not URL but directory file path
    //         if (file_exists($categoryphoto_path)) {

    //             @unlink($categoryphoto_path);

    //         }

    //         $img                     =       Image::make($image->path());
    //         $img->resize(900, 600)->save($categoryphotoPath.'/'.$imagename);

    //     }
    //     else
    //     {
    //         $imagename = $productcategory->image;
    //     }

    //     if(!$request->parent_id)
    //     {
    //         $parent_id = 0;
    //     }
    //     else
    //     {
    //         $parent_id = $request->parent_id;
    //     }

    //     if(!$request->status)
    //     {
    //         $status = 0;
    //     }
    //     else
    //     {
    //         $status = 1;
    //     }

    //     $productcategory->update([
    //         'name' => $request->name,
    //         'slug' => $slug,
    //         'parent_id' => $parent_id,
    //         'image' => $imagename,
    //         'desc' => $request->desc,
    //         'leftsidebar_id' => $request->leftsidebar_id,
    //         'rightsidebar_id' => $request->rightsidebar_id,
    //         'status' => $status,

    //     ]);

    //     notify()->success("Category Successfully Updated","Update");
    //     return redirect()->route('admin.productcategories.index');
    // }

    // /**
    //  * Remove the specified resource from storage.
    //  *
    //  * @param  \App\Models\Product\Flashdeal  $flashdeal
    //  * @return \Illuminate\Http\Response
    //  */
    // public function destroy(Flashdeal $flashdeal)
    // {
    //     $categoryphoto_path = public_path('uploads/productcategory_photo/'.$productcategory->image);  // Value is not URL but directory file path
    //         if (file_exists($categoryphoto_path)) {

    //             @unlink($categoryphoto_path);

    //         }

    //     if($productcategory->childrenRecursive->count()>0)
    //     {
    //         notify()->error('You Can not Delete this Item !! Sub-category exist','Alert');
    //     }

    //     elseif($productcategory->products()->count() >0)
    //     {
    //         notify()->error('You Can not Delete this Item !! Post exist under this category','Alert');
    //     }
    //     else
    //     {
    //         $productcategory->delete();
    //         notify()->success('Category Deleted Successfully','Delete');
    //     }


    //     return back();
    // }
}
