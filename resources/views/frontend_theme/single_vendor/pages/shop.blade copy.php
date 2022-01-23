@extends('frontend_theme.single_vendor.front_layout.app')
@section('main-content')
<main class="main">
<div class="container">
    <nav aria-label="breadcrumb" class="breadcrumb-nav">
        <ol class="breadcrumb">
            <li class="breadcrumb-item"><a href="demo42.html"><i class="icon-home"></i></a></li>
            <li class="breadcrumb-item active" aria-current="page">SHOP</li>
        </ol>
    </nav>

    <div class="row">
        <div class="col-lg-9 main-content">
            <nav class="toolbox sticky-header" data-sticky-options="{'mobile': true}">
                <div class="toolbox-left">
                    <a href="#" class="sidebar-toggle">
                        <svg data-name="Layer 3" id="Layer_3" viewBox="0 0 32 32"
                            xmlns="http://www.w3.org/2000/svg">
                            <line x1="15" x2="26" y1="9" y2="9" class="cls-1"></line>
                            <line x1="6" x2="9" y1="9" y2="9" class="cls-1"></line>
                            <line x1="23" x2="26" y1="16" y2="16" class="cls-1"></line>
                            <line x1="6" x2="17" y1="16" y2="16" class="cls-1"></line>
                            <line x1="17" x2="26" y1="23" y2="23" class="cls-1"></line>
                            <line x1="6" x2="11" y1="23" y2="23" class="cls-1"></line>
                            <path
                                d="M14.5,8.92A2.6,2.6,0,0,1,12,11.5,2.6,2.6,0,0,1,9.5,8.92a2.5,2.5,0,0,1,5,0Z"
                                class="cls-2"></path>
                            <path d="M22.5,15.92a2.5,2.5,0,1,1-5,0,2.5,2.5,0,0,1,5,0Z" class="cls-2"></path>
                            <path d="M21,16a1,1,0,1,1-2,0,1,1,0,0,1,2,0Z" class="cls-3"></path>
                            <path
                                d="M16.5,22.92A2.6,2.6,0,0,1,14,25.5a2.6,2.6,0,0,1-2.5-2.58,2.5,2.5,0,0,1,5,0Z"
                                class="cls-2"></path>
                        </svg>
                        <span>Filter</span>
                    </a>

                    <div class="toolbox-item toolbox-sort">
                        <label>Sort By:</label>

                        <div class="select-custom">
                            <select name="orderby" class="form-control">
                                <option value="menu_order" selected="selected">Default sorting</option>
                                <option value="popularity">Sort by popularity</option>
                                <option value="rating">Sort by average rating</option>
                                <option value="date">Sort by newness</option>
                                <option value="price">Sort by price: low to high</option>
                                <option value="price-desc">Sort by price: high to low</option>
                            </select>
                        </div><!-- End .select-custom -->


                    </div><!-- End .toolbox-item -->
                </div><!-- End .toolbox-left -->

                <div class="toolbox-right">
                    <div class="toolbox-item toolbox-show">
                        <label>Show:</label>

                        <div class="select-custom">
                            <select name="count" class="form-control">
                                <option value="12">12</option>
                                <option value="24">24</option>
                                <option value="36">36</option>
                            </select>
                        </div><!-- End .select-custom -->
                    </div><!-- End .toolbox-item -->

                    <div class="toolbox-item layout-modes">
                        <a href="category.html" class="layout-btn btn-grid active" title="Grid">
                            <i class="icon-mode-grid"></i>
                        </a>
                        <a href="category-list.html" class="layout-btn btn-list" title="List">
                            <i class="icon-mode-list"></i>
                        </a>
                    </div><!-- End .layout-modes -->
                </div><!-- End .toolbox-right -->
            </nav>

            <div class="row">
                @foreach ($products as $product)
                <div class="col-6 col-sm-4">
                    <div class="product-default inner-quickview inner-icon">
                        <figure>
                            <a href="demo42-product.html">
                                <img src="{{asset('single_vendor/assets/images/demoes/demo42/product/product15-300x300.jpg')}}"
                                    width="300" height="300" alt="product">
                            </a>
                            <div class="label-group">
                                <span class="product-label label-sale">-13%</span>
                            </div>
                            <div class="btn-icon-group">
                                {{-- <a href="javascript:;" onclick="addToCart({{ $product->id }})" class="btn-icon btn-add-cart product-type-simple"><i
                                        class="icon-shopping-cart"></i></a> --}}
                            </div>
                            <a href="ajax/product-quick-view.html" class="btn-quickview"
                                title="Quick View">Quick
                                View</a>
                        </figure>
                        <div class="product-details">
                            <div class="category-wrap">
                                <div class="category-list">
                                    <a href="#">Interior Accessories</a>
                                </div>
                                <a href="wishlist.html" class="btn-icon-wish"><i class="icon-heart"></i></a>
                            </div>
                            <h3 class="product-title">
                                <a href="demo42-product.html">Product Short Name</a>
                            </h3>
                            <div class="ratings-container">
                                <div class="product-ratings">
                                    <span class="ratings" style="width:0%"></span>
                                    <!-- End .ratings -->
                                    <span class="tooltiptext tooltip-top">0</span>
                                </div><!-- End .product-ratings -->
                            </div><!-- End .product-container -->
                            <div class="price-box">
                                <del class="old-price">$299.00</del>
                                <span class="product-price">$259.00</span>
                            </div><!-- End .price-box -->
                        </div><!-- End .product-details -->
                    </div>
                </div><!-- End .col-sm-4 -->
                @endforeach


                {{-- <div class="col-6 col-sm-4">
                    <div class="product-default inner-quickview inner-icon">
                        <figure>
                            <a href="demo42-product.html">
                                <img src="{{asset('single_vendor/assets/images/demoes/demo42/product/product1-300x300.jpg')}}"
                                    width="300" height="300" alt="product">
                            </a>
                            <div class="label-group">
                                <span class="product-label label-sale">-13%</span>
                            </div>
                            <div class="btn-icon-group">
                                <a href="#" class="btn-icon btn-add-cart product-type-simple"><i
                                        class="icon-shopping-cart"></i></a>
                            </div>
                            <a href="ajax/product-quick-view.html" class="btn-quickview"
                                title="Quick View">Quick
                                View</a>
                        </figure>
                        <div class="product-details">
                            <div class="category-wrap">
                                <div class="category-list">
                                    <a href="#">External Accessories</a>,
                                    <a href="#">Hot Deals</a>
                                </div>
                                <a href="wishlist.html" class="btn-icon-wish"><i class="icon-heart"></i></a>
                            </div>
                            <h3 class="product-title">
                                <a href="demo42-product.html">Product Short Name</a>
                            </h3>
                            <div class="ratings-container">
                                <div class="product-ratings">
                                    <span class="ratings" style="width:0%"></span>
                                    <!-- End .ratings -->
                                    <span class="tooltiptext tooltip-top"></span>
                                </div><!-- End .product-ratings -->
                            </div><!-- End .product-container -->
                            <div class="price-box">
                                <del class="old-price">$299.00</del>
                                <span class="product-price">$259.00</span>
                            </div><!-- End .price-box -->
                        </div><!-- End .product-details -->
                    </div>
                </div><!-- End .col-sm-4 -->

                <div class="col-6 col-sm-4">
                    <div class="product-default inner-quickview inner-icon">
                        <figure>
                            <a href="demo42-product.html">
                                <img src="{{asset('single_vendor/assets/images/demoes/demo42/product/product4-300x300.jpg')}}"
                                    width="300" height="300" alt="product">
                            </a>
                            <div class="label-group">
                                <span class="product-label label-sale">-13%</span>
                            </div>
                            <div class="btn-icon-group">
                                <a href="#" class="btn-icon btn-add-cart product-type-simple"><i
                                        class="icon-shopping-cart"></i></a>
                            </div>
                            <a href="ajax/product-quick-view.html" class="btn-quickview"
                                title="Quick View">Quick
                                View</a>
                        </figure>
                        <div class="product-details">
                            <div class="category-wrap">
                                <div class="category-list">
                                    <a href="#">Hot Deals</a>,
                                    <a href="#">Interior Accessories</a>
                                </div>
                                <a href="wishlist.html" class="btn-icon-wish"><i class="icon-heart"></i></a>
                            </div>
                            <h3 class="product-title">
                                <a href="demo42-product.html">Product Short Name</a>
                            </h3>
                            <div class="ratings-container">
                                <div class="product-ratings">
                                    <span class="ratings" style="width:0%"></span>
                                    <!-- End .ratings -->
                                    <span class="tooltiptext tooltip-top"></span>
                                </div><!-- End .product-ratings -->
                            </div><!-- End .product-container -->
                            <div class="price-box">
                                <del class="old-price">$299.00</del>
                                <span class="product-price">$259.00</span>
                            </div><!-- End .price-box -->
                        </div><!-- End .product-details -->
                    </div>
                </div><!-- End .col-sm-4 -->

                <div class="col-6 col-sm-4">
                    <div class="product-default inner-quickview inner-icon">
                        <figure>
                            <a href="demo42-product.html">
                                <img src="{{asset('single_vendor/assets/images/demoes/demo42/product/product9-300x300.jpg')}}"
                                    width="300" height="300" alt="product">
                            </a>
                            <div class="label-group">
                                <span class="product-label label-hot">HOT</span>
                                <span class="product-label label-sale">-13%</span>
                            </div>
                            <div class="btn-icon-group">
                                <a href="#" class="btn-icon btn-add-cart product-type-simple"><i
                                        class="icon-shopping-cart"></i></a>
                            </div>
                            <a href="ajax/product-quick-view.html" class="btn-quickview"
                                title="Quick View">Quick
                                View</a>
                        </figure>
                        <div class="product-details">
                            <div class="category-wrap">
                                <div class="category-list">
                                    <a href="#">Interior Accessories</a>
                                </div>
                                <a href="wishlist.html" class="btn-icon-wish"><i class="icon-heart"></i></a>
                            </div>
                            <h3 class="product-title">
                                <a href="demo42-product.html">Product Short Name</a>
                            </h3>
                            <div class="ratings-container">
                                <div class="product-ratings">
                                    <span class="ratings" style="width:0%"></span>
                                    <!-- End .ratings -->
                                    <span class="tooltiptext tooltip-top">0</span>
                                </div><!-- End .product-ratings -->
                            </div><!-- End .product-container -->
                            <div class="price-box">
                                <del class="old-price">$299.00</del>
                                <span class="product-price">$259.00</span>
                            </div><!-- End .price-box -->
                        </div><!-- End .product-details -->
                    </div>
                </div><!-- End .col-sm-4 -->

                <div class="col-6 col-sm-4">
                    <div class="product-default inner-quickview inner-icon">
                        <figure>
                            <a href="demo42-product.html">
                                <img src="{{asset('single_vendor/assets/images/demoes/demo42/product/product6-300x300.jpg')}}"
                                    width="300" height="300" alt="product">
                            </a>
                            <div class="btn-icon-group">
                                <a href="#" class="btn-icon btn-add-cart product-type-simple"><i
                                        class="icon-shopping-cart"></i></a>
                            </div>
                            <a href="ajax/product-quick-view.html" class="btn-quickview"
                                title="Quick View">Quick
                                View</a>
                        </figure>
                        <div class="product-details">
                            <div class="category-wrap">
                                <div class="category-list">
                                    <a href="#">Fluids &amp; Chemicals</a>,
                                    <a href="#">Hot Deals</a>
                                </div>
                                <a href="wishlist.html" class="btn-icon-wish"><i class="icon-heart"></i></a>
                            </div>
                            <h3 class="product-title">
                                <a href="demo42-product.html">Product Short Name</a>
                            </h3>
                            <div class="ratings-container">
                                <div class="product-ratings">
                                    <span class="ratings" style="width:80%"></span>
                                    <!-- End .ratings -->
                                    <span class="tooltiptext tooltip-top"></span>
                                </div><!-- End .product-ratings -->
                            </div><!-- End .product-container -->
                            <div class="price-box">
                                <span class="product-price">$299.00</span>
                            </div><!-- End .price-box -->
                        </div><!-- End .product-details -->
                    </div>
                </div><!-- End .col-sm-4 -->

                <div class="col-6 col-sm-4">
                    <div class="product-default inner-quickview inner-icon">
                        <figure>
                            <a href="demo42-product.html">
                                <img src="{{asset('single_vendor/assets/images/demoes/demo42/product/product11-300x300.jpg')}}"
                                    width="300" height="300" alt="product">
                            </a>
                            <div class="btn-icon-group">
                                <a href="#" class="btn-icon btn-add-cart product-type-simple"><i
                                        class="icon-shopping-cart"></i></a>
                            </div>
                            <a href="ajax/product-quick-view.html" class="btn-quickview"
                                title="Quick View">Quick
                                View</a>
                        </figure>
                        <div class="product-details">
                            <div class="category-wrap">
                                <div class="category-list">
                                    <a href="#">Sound &amp; Video</a>
                                </div>
                                <a href="wishlist.html" class="btn-icon-wish"><i class="icon-heart"></i></a>
                            </div>
                            <h3 class="product-title">
                                <a href="demo42-product.html">Product Short Name</a>
                            </h3>
                            <div class="ratings-container">
                                <div class="product-ratings">
                                    <span class="ratings" style="width:80%"></span>
                                    <!-- End .ratings -->
                                    <span class="tooltiptext tooltip-top">4.00</span>
                                </div><!-- End .product-ratings -->
                            </div><!-- End .product-container -->
                            <div class="price-box">
                                <span class="product-price">$299.00</span>
                            </div><!-- End .price-box -->
                        </div><!-- End .product-details -->
                    </div>
                </div><!-- End .col-sm-4 -->

                <div class="col-6 col-sm-4">
                    <div class="product-default inner-quickview inner-icon">
                        <figure>
                            <a href="demo42-product.html">
                                <img src="{{asset('single_vendor/assets/images/demoes/demo42/product/product10-300x300.jpg')}}"
                                    width="300" height="300" alt="product">
                            </a>
                            <div class="btn-icon-group">
                                <a href="#" class="btn-icon btn-add-cart product-type-simple"><i
                                        class="icon-shopping-cart"></i></a>
                            </div>
                            <a href="ajax/product-quick-view.html" class="btn-quickview"
                                title="Quick View">Quick
                                View</a>
                        </figure>
                        <div class="product-details">
                            <div class="category-wrap">
                                <div class="category-list">
                                    <a href="#">Performance</a>
                                </div>
                                <a href="wishlist.html" class="btn-icon-wish"><i class="icon-heart"></i></a>
                            </div>
                            <h3 class="product-title">
                                <a href="demo42-product.html">Product Short Name</a>
                            </h3>
                            <div class="ratings-container">
                                <div class="product-ratings">
                                    <span class="ratings" style="width:100%"></span>
                                    <!-- End .ratings -->
                                    <span class="tooltiptext tooltip-top"></span>
                                </div><!-- End .product-ratings -->
                            </div><!-- End .product-container -->
                            <div class="price-box">
                                <span class="product-price">$488.00</span>
                            </div><!-- End .price-box -->
                        </div><!-- End .product-details -->
                    </div>
                </div><!-- End .col-sm-4 -->

                <div class="col-6 col-sm-4">
                    <div class="product-default inner-quickview inner-icon">
                        <figure>
                            <a href="demo42-product.html">
                                <img src="{{asset('single_vendor/assets/images/demoes/demo42/product/product13-300x300.jpg')}}"
                                    width="300" height="300" alt="product">
                            </a>
                            <div class="label-group">
                                <span class="product-label label-sale">-17%</span>
                            </div>
                            <div class="btn-icon-group">
                                <a href="#" class="btn-icon btn-add-cart product-type-simple"><i
                                        class="icon-shopping-cart"></i></a>
                            </div>
                            <a href="ajax/product-quick-view.html" class="btn-quickview"
                                title="Quick View">Quick
                                View</a>
                        </figure>
                        <div class="product-details">
                            <div class="category-wrap">
                                <div class="category-list">
                                    <a href="#">Auto Parts</a>
                                </div>
                                <a href="wishlist.html" class="btn-icon-wish"><i class="icon-heart"></i></a>
                            </div>
                            <h3 class="product-title">
                                <a href="demo42-product.html">Product Short Name</a>
                            </h3>
                            <div class="ratings-container">
                                <div class="product-ratings">
                                    <span class="ratings" style="width:80%"></span>
                                    <!-- End .ratings -->
                                    <span class="tooltiptext tooltip-top"></span>
                                </div><!-- End .product-ratings -->
                            </div><!-- End .product-container -->
                            <div class="price-box">
                                <del class="old-price">$59.00</del>
                                <span class="product-price">$49.00</span>
                            </div><!-- End .price-box -->
                        </div><!-- End .product-details -->
                    </div>
                </div><!-- End .col-sm-4 -->

                <div class="col-6 col-sm-4">
                    <div class="product-default inner-quickview inner-icon">
                        <figure>
                            <a href="demo42-product.html">
                                <img src="{{asset('single_vendor/assets/images/demoes/demo42/product/product5-300x300.jpg')}}"
                                    width="300" height="300" alt="product">
                            </a>
                            <div class="btn-icon-group">
                                <a href="#" class="btn-icon btn-add-cart product-type-simple"><i
                                        class="icon-shopping-cart"></i></a>
                            </div>
                            <a href="ajax/product-quick-view.html" class="btn-quickview"
                                title="Quick View">Quick
                                View</a>
                        </figure>
                        <div class="product-details">
                            <div class="category-wrap">
                                <div class="category-list">
                                    <a href="#">Hot Deals</a>,
                                    <a href="#">Steering Wheels</a>
                                </div>
                                <a href="wishlist.html" class="btn-icon-wish"><i class="icon-heart"></i></a>
                            </div>
                            <h3 class="product-title">
                                <a href="demo42-product.html">Product Short Name</a>
                            </h3>
                            <div class="ratings-container">
                                <div class="product-ratings">
                                    <span class="ratings" style="width:80%"></span>
                                    <!-- End .ratings -->
                                    <span class="tooltiptext tooltip-top">4.00</span>
                                </div><!-- End .product-ratings -->
                            </div><!-- End .product-container -->
                            <div class="price-box">
                                <span class="product-price">$55.00</span>
                            </div><!-- End .price-box -->
                        </div><!-- End .product-details -->
                    </div>
                </div><!-- End .col-sm-4 -->

                <div class="col-6 col-sm-4">
                    <div class="product-default inner-quickview inner-icon">
                        <figure>
                            <a href="demo42-product.html">
                                <img src="{{asset('single_vendor/assets/images/demoes/demo42/product/product7-300x300.jpg')}}"
                                    width="300" height="300" alt="product">
                            </a>
                            <div class="label-group">
                                <span class="product-label label-hot">HOT</span>
                                <span class="product-label label-sale">-35%</span>
                            </div>
                            <div class="btn-icon-group">
                                <a href="#" class="btn-icon btn-add-cart product-type-simple"><i
                                        class="icon-shopping-cart"></i></a>
                            </div>
                            <a href="ajax/product-quick-view.html" class="btn-quickview"
                                title="Quick View">Quick
                                View</a>
                        </figure>
                        <div class="product-details">
                            <div class="category-wrap">
                                <div class="category-list">
                                    <a href="#">Interior Accessories</a>
                                </div>
                                <a href="wishlist.html" class="btn-icon-wish"><i class="icon-heart"></i></a>
                            </div>
                            <h3 class="product-title">
                                <a href="demo42-product.html">Product Short Name</a>
                            </h3>
                            <div class="ratings-container">
                                <div class="product-ratings">
                                    <span class="ratings" style="width:0%"></span>
                                    <!-- End .ratings -->
                                    <span class="tooltiptext tooltip-top"></span>
                                </div><!-- End .product-ratings -->
                            </div><!-- End .product-container -->
                            <div class="price-box">
                                <span class="product-price">$299.00</span>
                            </div><!-- End .price-box -->
                        </div><!-- End .product-details -->
                    </div>
                </div><!-- End .col-sm-4 -->

                <div class="col-6 col-sm-4">
                    <div class="product-default inner-quickview inner-icon">
                        <figure>
                            <a href="demo42-product.html">
                                <img src="{{asset('single_vendor/assets/images/demoes/demo42/product/product14-300x300.jpg')}}"
                                    width="300" height="300" alt="product">
                            </a>
                            <div class="btn-icon-group">
                                <a href="#" class="btn-icon btn-add-cart product-type-simple"><i
                                        class="icon-shopping-cart"></i></a>
                            </div>
                            <a href="ajax/product-quick-view.html" class="btn-quickview"
                                title="Quick View">Quick
                                View</a>
                        </figure>
                        <div class="product-details">
                            <div class="category-wrap">
                                <div class="category-list">
                                    <a href="#">Lanterns &amp; lighting</a>
                                </div>
                                <a href="wishlist.html" class="btn-icon-wish"><i class="icon-heart"></i></a>
                            </div>
                            <h3 class="product-title">
                                <a href="demo42-product.html">Product Short Name</a>
                            </h3>
                            <div class="ratings-container">
                                <div class="product-ratings">
                                    <span class="ratings" style="width:0%"></span>
                                    <!-- End .ratings -->
                                    <span class="tooltiptext tooltip-top"></span>
                                </div><!-- End .product-ratings -->
                            </div><!-- End .product-container -->
                            <div class="price-box">
                                <span class="product-price">$55.00</span>
                            </div><!-- End .price-box -->
                        </div><!-- End .product-details -->
                    </div>
                </div><!-- End .col-sm-4 -->

                <div class="col-6 col-sm-4">
                    <div class="product-default inner-quickview inner-icon">
                        <figure>
                            <a href="demo42-product.html">
                                <img src="{{asset('single_vendor/assets/images/demoes/demo42/product/product3-300x300.jpg')}}"
                                    width="300" height="300" alt="product">
                            </a>
                            <div class="label-group">
                                <span class="product-label label-sale">-35%</span>
                            </div>
                            <div class="btn-icon-group">
                                <a href="#" class="btn-icon btn-add-cart product-type-simple"><i
                                        class="icon-shopping-cart"></i></a>
                            </div>
                            <a href="ajax/product-quick-view.html" class="btn-quickview"
                                title="Quick View">Quick
                                View</a>
                        </figure>
                        <div class="product-details">
                            <div class="category-wrap">
                                <div class="category-list">
                                    <a href="#">External Accessories</a>,
                                    <a href="#">Hot Deals</a>
                                </div>
                                <a href="wishlist.html" class="btn-icon-wish"><i class="icon-heart"></i></a>
                            </div>
                            <h3 class="product-title">
                                <a href="demo42-product.html">Product Short Name</a>
                            </h3>
                            <div class="ratings-container">
                                <div class="product-ratings">
                                    <span class="ratings" style="width:0%"></span>
                                    <!-- End .ratings -->
                                    <span class="tooltiptext tooltip-top"></span>
                                </div><!-- End .product-ratings -->
                            </div><!-- End .product-container -->
                            <div class="price-box">
                                <del class="old-price">$199.00</del>
                                <span class="product-price">$129.00</span>
                            </div><!-- End .price-box -->
                        </div><!-- End .product-details -->
                    </div>
                </div><!-- End .col-sm-4 --> --}}
            </div><!-- End .row -->

            <nav class="toolbox toolbox-pagination">
                <div class="toolbox-item toolbox-show">
                    <label>Show:</label>

                    <div class="select-custom">
                        <select name="count" class="form-control">
                            <option value="12">12</option>
                            <option value="24">24</option>
                            <option value="36">36</option>
                        </select>
                    </div><!-- End .select-custom -->
                </div><!-- End .toolbox-item -->

                <ul class="pagination toolbox-item">
                    <li class="page-item disabled">
                        <a class="page-link page-link-btn" href="#"><i class="icon-angle-left"></i></a>
                    </li>
                    <li class="page-item active">
                        <a class="page-link" href="#">1 <span class="sr-only">(current)</span></a>
                    </li>
                    <li class="page-item"><a class="page-link" href="#">2</a></li>
                    <li class="page-item">
                        <a class="page-link page-link-btn" href="#"><i class="icon-angle-right"></i></a>
                    </li>
                </ul>
            </nav>
        </div><!-- End .col-lg-9 -->

        <div class="sidebar-overlay"></div>
        <aside class="sidebar-shop col-lg-3 order-lg-first mobile-sidebar">
            <div class="sidebar-wrapper">
                <div class="widget">
                    <h3 class="widget-title">
                        <a data-toggle="collapse" href="#widget-body-2" role="button" aria-expanded="true"
                            aria-controls="widget-body-2">Categories</a>
                    </h3>

                    <div class="collapse show" id="widget-body-2">
                        <div class="widget-body">
                            <ul class="cat-list">
                                @foreach (\App\Models\Product\Productcategory::where(['status'=>1])->get() as $key=>$category)
                                {{-- @if(!$category->childrenRecursive->count()>0) --}}
                                @if($category->children->isEmpty())
                                @if ($category->parent_id == 0)
                                <li>
                                    <a href="#widget-category-1" data-toggle="collapse" role="button"
                                        aria-expanded="true" aria-controls="widget-category-1">
                                        {{$category->name}}<span class="products-count">({{$category->products()->count()}})</span>
                                    </a>
                                    {{-- <div class="collapse show" id="widget-category-1">
                                        <ul class="cat-sublist">
                                            <li>Caps<span class="products-count">(1)</span></li>
                                            <li>Watches<span class="products-count">(2)</span></li>
                                        </ul>
                                    </div> --}}
                                </li>
                                @endif
                                @else
                                <li>
                                    <a href="#{{$category->slug}}" data-toggle="collapse" role="button"
                                        aria-expanded="true" aria-controls="{{$category->slug}}">
                                        {{$category->name}}<span class="products-count"></span>
                                        <span class="toggle"></span>
                                    </a>
                                    <div class="collapse" id="{{$category->slug}}">
                                        <ul class="cat-sublist">
                                            @foreach($category->childrenRecursive as $key => $sub_cat)
                                            <li>{{$sub_cat->name}}<span class="products-count">({{$category->products()->count()}})</span></li>
                                            @endforeach
                                        </ul>
                                    </div>
                                </li>
                                @endif
                                @endforeach
                            </ul>
                        </div><!-- End .widget-body -->
                    </div>
                    <!-- End .collapse -->
                </div><!-- End .widget -->

                <div class="widget">
                    <h3 class="widget-title">
                        <a data-toggle="collapse" href="#widget-body-3" role="button" aria-expanded="true"
                            aria-controls="widget-body-3">Price</a>
                    </h3>

                    <div class="collapse show" id="widget-body-3">
                        <div class="widget-body pb-0">
                            <form action="#">
                                <div class="price-slider-wrapper">
                                    <div id="price-slider"></div><!-- End #price-slider -->
                                </div><!-- End .price-slider-wrapper -->

                                <div
                                    class="filter-price-action d-flex align-items-center justify-content-between flex-wrap">
                                    <div class="filter-price-text">
                                        Price:
                                        <span id="filter-price-range"></span>
                                    </div><!-- End .filter-price-text -->

                                    <button type="submit" class="btn btn-primary">Filter</button>
                                </div><!-- End .filter-price-action -->
                            </form>
                        </div><!-- End .widget-body -->
                    </div><!-- End .collapse -->
                </div><!-- End .widget -->

                <div class="widget widget-color">
                    <h3 class="widget-title">
                        <a data-toggle="collapse" href="#widget-body-4" role="button" aria-expanded="true"
                            aria-controls="widget-body-4">Color</a>
                    </h3>

                    <div class="collapse show" id="widget-body-4">
                        <div class="widget-body pb-0">
                            <ul class="config-swatch-list">
                                <li class="active">
                                    <a href="#" style="background-color: #000;"></a>
                                </li>
                                <li>
                                    <a href="#" style="background-color: #0188cc;"></a>
                                </li>
                                <li>
                                    <a href="#" style="background-color: #81d742;"></a>
                                </li>
                                <li>
                                    <a href="#" style="background-color: #6085a5;"></a>
                                </li>
                                <li>
                                    <a href="#" style="background-color: #ab6e6e;"></a>
                                </li>
                            </ul>
                        </div><!-- End .widget-body -->
                    </div><!-- End .collapse -->
                </div><!-- End .widget -->

                <div class="widget widget-size">
                    <h3 class="widget-title">
                        <a data-toggle="collapse" href="#widget-body-5" role="button" aria-expanded="true"
                            aria-controls="widget-body-5">Sizes</a>
                    </h3>

                    <div class="collapse show" id="widget-body-5">
                        <div class="widget-body pb-0">
                            <ul class="config-size-list">
                                <li class="active"><a href="#">XL</a></li>
                                <li><a href="#">L</a></li>
                                <li><a href="#">M</a></li>
                                <li><a href="#">S</a></li>
                            </ul>
                        </div><!-- End .widget-body -->
                    </div><!-- End .collapse -->
                </div><!-- End .widget -->

                <div class="widget widget-featured">
                    <h3 class="widget-title">Featured</h3>

                    <div class="widget-body">
                        <div class="owl-carousel widget-featured-products">
                            <div class="featured-col">
                                <div class="product-default left-details product-widget">
                                    <figure>
                                        <a href="demo42-product.html">
                                            <img src="{{asset('single_vendor/assets/images/demoes/demo42/product/product1-300x300.jpg')}}"
                                                width="75" height="75" alt="product" />
                                        </a>
                                    </figure>
                                    <div class="product-details">
                                        <h3 class="product-title"> <a href="demo42-product.html">Product
                                                Short Name</a> </h3>
                                        <div class="ratings-container">
                                            <div class="product-ratings">
                                                <span class="ratings" style="width:100%"></span>
                                                <!-- End .ratings -->
                                                <span class="tooltiptext tooltip-top"></span>
                                            </div><!-- End .product-ratings -->
                                        </div><!-- End .product-container -->
                                        <div class="price-box">
                                            <span class="product-price">$49.00</span>
                                        </div><!-- End .price-box -->
                                    </div><!-- End .product-details -->
                                </div>
                                <div class="product-default left-details product-widget">
                                    <figure>
                                        <a href="demo42-product.html">
                                            <img src="{{asset('single_vendor/assets/images/demoes/demo42/product/product2-300x300.jpg')}}"
                                                width="75" height="75" alt="product" />
                                        </a>
                                    </figure>
                                    <div class="product-details">
                                        <h3 class="product-title"> <a href="demo42-product.html">Product
                                                Short Name</a> </h3>
                                        <div class="ratings-container">
                                            <div class="product-ratings">
                                                <span class="ratings" style="width:100%"></span>
                                                <!-- End .ratings -->
                                                <span class="tooltiptext tooltip-top"></span>
                                            </div><!-- End .product-ratings -->
                                        </div><!-- End .product-container -->
                                        <div class="price-box">
                                            <span class="product-price">$49.00</span>
                                        </div><!-- End .price-box -->
                                    </div><!-- End .product-details -->
                                </div>
                                <div class="product-default left-details product-widget">
                                    <figure>
                                        <a href="demo42-product.html">
                                            <img src="{{asset('single_vendor/assets/images/demoes/demo42/product/product3-300x300.jpg')}}"
                                                width="75" height="75" alt="product" />
                                        </a>
                                    </figure>
                                    <div class="product-details">
                                        <h3 class="product-title"> <a href="demo42-product.html">Product
                                                Short Name</a> </h3>
                                        <div class="ratings-container">
                                            <div class="product-ratings">
                                                <span class="ratings" style="width:100%"></span>
                                                <!-- End .ratings -->
                                                <span class="tooltiptext tooltip-top"></span>
                                            </div><!-- End .product-ratings -->
                                        </div><!-- End .product-container -->
                                        <div class="price-box">
                                            <span class="product-price">$49.00</span>
                                        </div><!-- End .price-box -->
                                    </div><!-- End .product-details -->
                                </div>
                            </div><!-- End .featured-col -->

                            <div class="featured-col">
                                <div class="product-default left-details product-widget">
                                    <figure>
                                        <a href="demo42-product.html">
                                            <img src="{{asset('single_vendor/assets/images/demoes/demo42/product/product4-300x300.jpg')}}"
                                                width="75" height="75" alt="product" />
                                        </a>
                                    </figure>
                                    <div class="product-details">
                                        <h3 class="product-title"> <a href="demo42-product.html">Product
                                                Short Name</a> </h3>
                                        <div class="ratings-container">
                                            <div class="product-ratings">
                                                <span class="ratings" style="width:100%"></span>
                                                <!-- End .ratings -->
                                                <span class="tooltiptext tooltip-top"></span>
                                            </div><!-- End .product-ratings -->
                                        </div><!-- End .product-container -->
                                        <div class="price-box">
                                            <span class="product-price">$49.00</span>
                                        </div><!-- End .price-box -->
                                    </div><!-- End .product-details -->
                                </div>
                                <div class="product-default left-details product-widget">
                                    <figure>
                                        <a href="demo42-product.html">
                                            <img src="{{asset('single_vendor/assets/images/demoes/demo42/product/product5-300x300.jpg')}}"
                                                width="75" height="75" alt="product" />
                                        </a>
                                    </figure>
                                    <div class="product-details">
                                        <h3 class="product-title"> <a href="demo42-product.html">Product
                                                Short Name</a> </h3>
                                        <div class="ratings-container">
                                            <div class="product-ratings">
                                                <span class="ratings" style="width:100%"></span>
                                                <!-- End .ratings -->
                                                <span class="tooltiptext tooltip-top"></span>
                                            </div><!-- End .product-ratings -->
                                        </div><!-- End .product-container -->
                                        <div class="price-box">
                                            <span class="product-price">$49.00</span>
                                        </div><!-- End .price-box -->
                                    </div><!-- End .product-details -->
                                </div>
                                <div class="product-default left-details product-widget">
                                    <figure>
                                        <a href="demo42-product.html">
                                            <img src="{{asset('single_vendor/assets/images/demoes/demo42/product/product6-300x300.jpg')}}"
                                                width="75" height="75" alt="product" />
                                        </a>
                                    </figure>
                                    <div class="product-details">
                                        <h3 class="product-title"> <a href="demo42-product.html">Product
                                                Short Name</a> </h3>
                                        <div class="ratings-container">
                                            <div class="product-ratings">
                                                <span class="ratings" style="width:100%"></span>
                                                <!-- End .ratings -->
                                                <span class="tooltiptext tooltip-top"></span>
                                            </div><!-- End .product-ratings -->
                                        </div><!-- End .product-container -->
                                        <div class="price-box">
                                            <span class="product-price">$49.00</span>
                                        </div><!-- End .price-box -->
                                    </div><!-- End .product-details -->
                                </div>
                            </div><!-- End .featured-col -->
                        </div><!-- End .widget-featured-slider -->
                        <!-- End .widget -->
                    </div>
                </div>


                <div class="widget widget-block">
                    <h3 class="widget-title">Custom HTML Block</h3>
                    <h5>This is a custom sub-title.</h5>
                    <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Cras non placerat mi. Etiam
                        non tellus </p>
                </div><!-- End .widget -->
            </div><!-- End .sidebar-wrapper -->
        </aside><!-- End .col-lg-3 -->
    </div><!-- End .row -->
</div><!-- End .container -->

<div class="mb-4"></div><!-- margin -->
</main>
@endsection
