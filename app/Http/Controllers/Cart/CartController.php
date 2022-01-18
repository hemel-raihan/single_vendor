<?php

namespace App\Http\Controllers\Cart;

use Session;
use App\Models\Cart\Cart;
use Illuminate\Http\Request;
use App\Models\Product\Product;
use App\Http\Controllers\Controller;
use App\Models\Product\Productcategory;
use Illuminate\Support\Facades\Auth;

class CartController extends Controller
{
    public function index(Request $request){

        $categories = Productcategory::all();
        if(auth()->user() != null) {
            $user_id = Auth::user()->id;
            if($request->session()->get('temp_user_id')) {
                Cart::where('temp_user_id', $request->session()->get('temp_user_id'))
                        ->update(
                                [
                                    'user_id' => $user_id,
                                    'temp_user_id' => null
                                ]
                );

                Session::forget('temp_user_id');
            }
            $carts = Cart::where('user_id', $user_id)->get();

           
        } else {
            $temp_user_id = $request->session()->get('temp_user_id');
            // $carts = Cart::where('temp_user_id', $temp_user_id)->get();
            $carts = ($temp_user_id != null) ? Cart::where('temp_user_id', $temp_user_id)->get() : [] ;
        }
        //dd($carts);

        return view('frontend_theme.single_vendor.pages.cart', compact('categories', 'carts'));
    }

    public function addToCart(Request $request){
        $product = Product::find($request->product_id);

        $cart = new Cart;
        $cart->owner_id = $product->admin_id;

        if(auth()->user() != null) {
            $user_id = Auth::user()->id;
            $cart->user_id = $user_id;
            $carts = Cart::where('user_id', $user_id)->get();
        } else {
            if($request->session()->get('temp_user_id')) {
                $temp_user_id = $request->session()->get('temp_user_id');
            } else {
                $temp_user_id = bin2hex(random_bytes(10));
                $request->session()->put('temp_user_id', $temp_user_id);
            }
            $cart->temp_user_id = $temp_user_id;
            $carts = Cart::where('temp_user_id', $temp_user_id)->get();
        }

        $str = '';
        //check the color enabled or disabled for the product
        if($request->has('color')) {
            $str = $request['color'];
        }

        // if ($product->digital != 1) {
            //Gets all the choice values of customer choice option and generate a string like Black-S-Cotton
            // foreach (json_decode(Product::find($request->id)->choice_options) as $key => $choice) {
            //     if($str != null){
            //         $str .= '-'.str_replace(' ', '', $request['attribute_id_'.$choice->attribute_id]);
            //     }
            //     else{
            //         $str .= str_replace(' ', '', $request['attribute_id_'.$choice->attribute_id]);
            //     }
            // }
        // }

        $cart->variation = $str;

        $cart->address_id = $request->address_id;
        $cart->product_id = $product->id;
        $cart->price = $product->unit_price;
        $cart->tax = $product->tax;
        $cart->quantity = $request->quantity;
        $cart->shipping_cost = 0.00;
        $cart->save();

        return back();
    }
}
