@php
    $flash_deal = \App\Models\Product\Flashdeal::where('status', 1)->first();
    $today = date("Y/m/d");
    $to_day=date("Y-m-d",strtotime($today));
    $from_datee=date("Y-m-d",strtotime($flash_deal->start_date));
    $to_datee=date("Y-m-d",strtotime($flash_deal->end_date));
@endphp
@if($to_day >= $from_datee && $to_day <= $to_datee)
<section class="category-section container">
    <div class="d-lg-flex align-items-center appear-animate" data-animation-name="fadeInLeftShorter">
        <h2 class="title title-underline divider">Flash-Deals</h2>
        <a href="#" class="sicon-title">View Flash-Deals<i class="fas fa-arrow-right"></i></a>
    </div>
    <div class="owl-carousel owl-theme appear-animate" data-owl-options="{
            'loop': false,
            'dots': false,
            'nav': true,
            'responsive': {
                '0': {
                    'items': 2
                },
                '576': {
                    'items': 3
                },
                '991': {
                    'items': 4
                }
            }
        }">

        @foreach ($flash_deal->products as $key => $flash_deal_product)
        <div class="product-default inner-quickview inner-icon">
            <figure>
                <a href="{{ route('product.details',$flash_deal_product->slug) }}">
                    <img src="{{ asset('uploads/productphoto/'.$flash_deal_product->image) }}" width="300" height="300" alt="product">
                </a>
                {{-- <div class="btn-icon-group">
                    <a href="#" class="btn-icon btn-add-cart product-type-simple"><i
                            class="icon-shopping-cart"></i></a>
                </div> --}}
                <div class="btn-icon-group">
                    <a href="javascript:void(0)" onclick="showAddToCartModal({{ $flash_deal_product->id }})" class="btn-icon  product-type-simple"><i
                            class="icon-shopping-cart"></i></a>
                </div>

            </figure>
            <div class="product-details">
                <div class="category-wrap">
                    <div class="category-list">
                        @foreach ($flash_deal_product->productcategories as $category)
                        <a href="#">{{ $category->name }}</a>
                        @endforeach
                    </div>
                    <a href="wishlist.html" class="btn-icon-wish" title="wishlist"><i
                            class="icon-heart"></i></a>
                </div>
                <h3 class="product-title">
                    <a href="{{ route('product.details',$flash_deal_product->slug) }}">{{ $flash_deal_product->title }}</a>
                </h3>
                <div class="ratings-container">
                    <div class="product-ratings">
                        <span class="ratings" style="width:100%"></span>
                        {{-- ratings end --}}
                        <span class="tooltiptext tooltip-top"></span>
                    </div>
                </div>
                <div class="price-box">
                    @if($flash_deal_product->discount_rate == null)
                    <span class="product-price">${{number_format(($flash_deal_product->unit_price),2,'.','')}}</span>
                    @else
                    <del class="old-price">${{number_format(($flash_deal_product->unit_price),2,'.','')}}</del>
                    @php
                        if($flash_deal_product->discount_type == 'Flat')
                        {
                            $after_discount = $flash_deal_product->unit_price - $flash_deal_product->discount_rate;
                        }
                        else
                        {
                            $percant = ($flash_deal_product->unit_price * $flash_deal_product->discount_rate)/100;
                            $after_discount = $flash_deal_product->unit_price - $percant;
                        }
                    @endphp
                    <span class="product-price">${{number_format(($after_discount),2,'.','')}}</span>
                    @endif
                </div><!-- End .price-box -->
            </div>
        </div>
        @endforeach


    </div>
</section>
@else
asd
@endif
