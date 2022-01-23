<div class="product-default inner-quickview inner-icon">
    <figure>
        <a href="{{ route('product.details',$product->slug) }}">
            <img src="{{ asset('uploads/productphoto/'.$product->image) }}" width="300" height="300" alt="product">
        </a>
        <div class="btn-icon-group">
            <a href="#" class="btn-icon btn-add-cart product-type-simple"><i
                    class="icon-shopping-cart"></i></a>
        </div>
        
    </figure>
    <div class="product-details">
        <div class="category-wrap">
            <div class="category-list">
                @foreach ($product->productcategories as $category)
                <a href="#">{{ $category->name }}</a>
                @endforeach
            </div>
            <a href="wishlist.html" class="btn-icon-wish" title="wishlist"><i
                    class="icon-heart"></i></a>
        </div>
        <h3 class="product-title">
            <a href="{{ route('product.details',$product->slug) }}">{{ $product->title }}</a>
        </h3>
        <div class="ratings-container">
            <div class="product-ratings">
                <span class="ratings" style="width:100%"></span>
                <!-- End .ratings -->
                <span class="tooltiptext tooltip-top"></span>
            </div>
        </div>
        <div class="price-box">
            <span class="product-price">Tk.{{ $product->unit_price }}</span>
        </div>
    </div>
</div>