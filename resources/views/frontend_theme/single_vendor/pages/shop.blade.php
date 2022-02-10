@extends('frontend_theme.single_vendor.front_layout.app')

@section('single_styles')
<style>

    /* product card */
    .brand-section .product-default {
        padding: 0 0.6rem;
    }

    .inner-icon figure {
        height: 210px;
    }

    .product-default figure img:first-child {
        height: 100%;
        width: 100%;
    }
    /* end product card */
</style>
@endsection

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
                <div class="col-6 col-sm-3">
                @include('frontend_theme.single_vendor.partials.product_box_2',['product'=>$product])
                </div>
                @endforeach
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
                                    <a href="{{route('shops',$category->slug)}}"
                                        aria-expanded="true" aria-controls="widget-category-1">
                                        {{$category->name}}<span class="products-count">({{$category->products()->count()}})</span>
                                    </a>
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
                                           <a href="{{route('shops',$category->slug)}}"> <li>{{$sub_cat->name}}<span class="products-count">({{$category->products()->count()}})</span></li></a>
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

                {{-- <div class="widget">
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
                </div><!-- End .widget --> --}}

                <div class="widget widget-color">
                    <h3 class="widget-title">
                        <a data-toggle="collapse" href="#widget-body-4" role="button" aria-expanded="true"
                            aria-controls="widget-body-4">Color</a>
                    </h3>

                    <div class="collapse show" id="widget-body-4">
                        <div class="widget-body pb-0">
                            <ul class="config-swatch-list">
                                @foreach ($products as $product)
                                @foreach ($product->productcategories as $category)
                                @foreach (json_decode($product->colors) as $key => $color)
                                <li class="">
                                    <a href="{{route('shops.filter',['catId'=>$category->id,'id'=>$product->id])}}" style="background-color: {{$color}};"></a>
                                </li>
                                @endforeach
                                @endforeach
                                @endforeach
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
                                @foreach ($products as $product)
                                @foreach ($product->productcategories as $category)
                                @foreach (json_decode($product->choice_options) as $key => $choice)
                                @foreach ($choice->values as $key => $value)
                                <li class=""><a href="{{route('shops.filter.attribute',['catId'=>$category->id,'id'=>$product->id])}}">{{$value}}</a></li>
                                @endforeach
                                @endforeach
                                @endforeach
                                @endforeach
                                {{-- <li><a href="#">L</a></li>
                                <li><a href="#">M</a></li>
                                <li><a href="#">S</a></li> --}}
                            </ul>
                        </div>
                    </div><!-- End .collapse -->
                </div><!-- End .widget -->

                {{-- <div class="widget widget-featured">
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
                </div> --}}

            </div><!-- End .sidebar-wrapper -->
        </aside><!-- End .col-lg-3 -->
    </div><!-- End .row -->
</div><!-- End .container -->

<div class="mb-4"></div><!-- margin -->
</main>
@endsection
