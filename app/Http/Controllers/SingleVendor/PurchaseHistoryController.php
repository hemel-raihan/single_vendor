<?php

namespace App\Http\Controllers\SingleVendor;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;

class PurchaseHistoryController extends Controller
{
    public function purchase_history_details(){
        return view('frontend_theme.single_vendor.user.order_details_customer');
    }
}
