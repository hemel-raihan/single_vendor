<?php

namespace App\Http\Controllers\SingleVendor;

use App\Http\Controllers\Controller;
use App\Models\Address\Address;
use Auth;
use Illuminate\Http\Request;

class CustomerController extends Controller
{
    public function index(){
       // return view('frontend_theme.single_vendor.front_layout.user_panel');
         return view('frontend_theme.single_vendor.user.customer.dashboard');
    }

    public function userProfileUpdate(Request $request){
      $user = Auth::user();
      $user->name = $request->name;
      $user->phone = $request->phone;
      $user->save();

      return back()->with('success','User Profile Updated');
    }

    public function storeAddress(Request $request){
      $address = new Address;
      $address->user_id = Auth::user()->id;
      $address->address = $request->address;
      $address->country_id = $request->country_id;
      $address->state_id = $request->state_id;
      $address->city_id = $request->city_id;
      $address->postal_code = $request->postal_code;
      $address->phone = $request->phone;
      $address->save();

      return back()->with('success','Address Created Successfully');

    }

}
