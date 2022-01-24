<?php

namespace App\Http\Controllers;
use Illuminate\Support\Facades\Route;
/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
*/
// user login
Route::get('/user/login','SingleVendor\LoginController@login')->name('user.login');
Route::get('/user/register','SingleVendor\LoginController@register')->name('user.register');

//Change Password
// Route::get('change-password', 'ChangePasswordController@index');
Route::post('change-password', 'SingleVendor\ChangePasswordController@store')->name('change.password');


Route::get('/', 'SingleVendor\HomepageController@index')->name('home');
Route::post('/home/section/category', 'SingleVendor\HomepageController@load_category_section')->name('home.section.category');
Route::post('/home/section/hot-deals', 'SingleVendor\HomepageController@load_hot_deals_section')->name('home.section.hot-deal');
Route::post('/home/section/special-offer', 'SingleVendor\HomepageController@load_special_offer_section')->name('home.section.specialoffer');
Route::post('/home/section/home-brand', 'SingleVendor\HomepageController@load_brand_section')->name('home.section.brand');
Route::post('/home/section/home-callsection', 'SingleVendor\HomepageController@load_call_section')->name('home.section.call');
Route::post('/home/section/home-recent', 'SingleVendor\HomepageController@load_recent_section')->name('home.section.recent');

Route::get('/product/details/{slug}', 'SingleVendor\HomepageController@single_product_details')->name('product.details');
Route::get('/product/shops/{id}', 'SingleVendor\HomepageController@shop')->name('shops');
Route::get('/product/shops/filtered/{catId}/{id}', 'SingleVendor\HomepageController@filter')->name('shops.filter');
Route::get('/product/shops/filtered/attribute/{catId}/{id}', 'SingleVendor\HomepageController@filterAttribute')->name('shops.filter.attribute');
// Route::get('/product/cart', 'SingleVendor\HomepageController@view_cart')->name('view.cart');
Route::get('/product/checkout', 'SingleVendor\HomepageController@checkout')->name('checkout');


// Customer Panel
Route::get('/customer/dashboard', 'SingleVendor\CustomerController@index')->name('customer.dashboard');
Route::get('/customer/purchase', 'SingleVendor\CustomerController@purchaseOrders')->name('customer.orders');
Route::post('/purchase_history/details', 'SingleVendor\PurchaseHistoryController@purchase_history_details')->name('purchase_history.details');

//user-profile
Route::post('/customer/profile-update', 'SingleVendor\CustomerController@userProfileUpdate')->name('customer.profile.update');
Route::post('/customer/address-add', 'SingleVendor\CustomerController@storeAddress')->name('customer.profile.address');

//Single add to cart
Route::get('/cart/view', 'SingleVendor\CartController@index')->name('cart');
Route::post('/cart/addtocart', 'SingleVendor\CartController@addToCart')->name('cart.addToCart');
Route::post('/cart/removeFromCart', 'SingleVendor\CartController@removeFromCart')->name('cart.removeFromCart');
Route::post('/cart/updateQuantity', 'SingleVendor\CartController@updateQuantity')->name('cart.updateQuantity');
Route::get('/cart/checkout', 'SingleVendor\CartController@checkout')->name('checkout');
//Order+OrderDetails Store
Route::post('/order/store','SingleVendor\OrderController@store')->name('order.store');
Route::get('/order/order-success', 'SingleVendor\OrderController@order_confirmed')->name('order.success');









