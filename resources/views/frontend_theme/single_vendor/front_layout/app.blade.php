<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="csrf-token" content="{{ csrf_token() }}">

    <title>Porto - Bootstrap eCommerce Template</title>

    <meta name="keywords" content="HTML5 Template" />
    <meta name="description" content="Porto - Bootstrap eCommerce Template">
    <meta name="author" content="SW-THEMES">

    <!-- Favicon -->
    <link rel="icon" type="image/x-icon" href="{{ asset('single_vendor/assets/images/icons/favicon.png') }}">
    <link rel="preload" href="{{ asset('single_vendor/assets/vendor/fontawesome-free/webfonts/fa-regular-400.woff2') }}" as="font" type="font/woff2"
        crossorigin="anonymous">
    <link rel="preload" href="{{ asset('single_vendor/assets/vendor/fontawesome-free/webfonts/fa-solid-900.woff2') }}" as="font" type="font/woff2"
        crossorigin="anonymous">
    <link rel="preload" href="{{ asset('single_vendor/assets/vendor/fontawesome-free/webfonts/fa-brands-400.woff2') }}" as="font" type="font/woff2"
        crossorigin="anonymous">

    <script>
        //Reset scroll top
        history.scrollRestoration = "manual";

        // $(window).on('beforeunload', function(){
        //     $(window).scrollTop(0);
        // });
    </script>

    <script>
        WebFontConfig = {
            google: { families: [ 'Open+Sans:400,600', 'Poppins:400,500,600,700' ] }
        };
        ( function ( d ) {
            var wf = d.createElement( 'script' ), s = d.scripts[ 0 ];
            wf.src = "{{ asset('single_vendor/assets/js/webfont.js') }}";
            wf.async = true;
            s.parentNode.insertBefore( wf, s );
        } )( document );
    </script>


    <!-- Plugins CSS File -->
    <link rel="stylesheet" href="{{ asset('single_vendor/assets/css/bootstrap.min.css') }}">

    <!-- Main CSS File -->
    <link rel="stylesheet" href="{{ asset('single_vendor/assets/css/demo42.min.css') }}">
    <link rel="stylesheet" type="text/css" href="{{ asset('single_vendor/assets/vendor/fontawesome-free/css/all.min.css') }}">
    
    {{-- <link rel="stylesheet" href="{{ asset('single_vendor/assets/css/sismoo-core.css') }}"> --}}

    <link rel="stylesheet" href="{{ asset('single_vendor/assets/css/style.min.css') }}">

    @yield('single_styles')
    
</head>

<body>
    <div class="page-wrapper">
        @include('frontend_theme.single_vendor.front_layout.top-notice')
        <!-- End .top-notice -->

        @include('frontend_theme.single_vendor.front_layout.header')
        <!-- End .header -->

            @yield('main-content')
            
        <!-- End .main -->
        {{-- Modal --}}
        @yield('modal')
        {{--End Modal --}}

        @include('frontend_theme.single_vendor.front_layout.footer')
    </div><!-- End .page-wrapper -->

    <div class="loading-overlay">
        <div class="bounce-loader">
            <div class="bounce1"></div>
            <div class="bounce2"></div>
            <div class="bounce3"></div>
        </div>
    </div>

    <div class="mobile-menu-overlay"></div>
    <!-- End .mobil-menu-overlay -->

    @include('frontend_theme.single_vendor.front_layout.mobile-menu')
    <!-- End .mobile-menu-container -->

    <div class="sticky-navbar">
        <div class="sticky-info">
            <a href="demo42.html">
                <i class="icon-home"></i>Home
            </a>
        </div>
        <div class="sticky-info">
            <a href="demo42-shop.html" class="">
                <i class="icon-bars"></i>Categories
            </a>
        </div>
        <div class="sticky-info">
            <a href="wishlist.html" class="">
                <i class="icon-wishlist-2"></i>Wishlist
            </a>
        </div>
        <div class="sticky-info">
            <a href="login.html" class="">
                <i class="icon-user-2"></i>Account
            </a>
        </div>
        <div class="sticky-info">
            <a href="cart.html" class="">
                <i class="icon-shopping-cart position-relative">
                    <span class="cart-count badge-circle">3</span>
                </i>Cart
            </a>
        </div>
    </div>

    {{-- @include('frontend_theme.single_vendor.partials.newsletter') --}}
    <!-- End .newsletter-popup -->

    <a id="scroll-top" href="#top" title="Top" role="button"><i class="icon-angle-up"></i></a>

    <!-- Plugins JS File -->
    <script src="{{ asset('single_vendor/assets/js/jquery.min.js') }}"></script>
    <script src="{{ asset('single_vendor/assets/js/bootstrap.bundle.min.js') }}"></script>
    <script src="{{ asset('single_vendor/assets/js/optional/isotope.pkgd.min.js') }}"></script>
    <script src="{{ asset('single_vendor/assets/js/plugins.min.js') }}"></script>
    <script src="{{ asset('single_vendor/assets/js/jquery.appear.min.js') }}"></script>
    <script src="{{ asset('single_vendor/assets/js/jquery.plugin.min.js') }}"></script>
    <!-- Main JS File -->
    <script src="{{ asset('single_vendor/assets/js/main.min.js') }}"></script>

    @yield('single_scripts')


    <script>
        function show_purchase_history_details(order_id)
        {
            $('#order-details-modal-body').html(null);

            if(!$('#modal-size').hasClass('modal-lg')){
                $('#modal-size').addClass('modal-lg');
            }

            $.post('{{ route('purchase_history.details') }}', { _token : '{{ csrf_token() }}', order_id : order_id}, function(data){
                $('#order-details-modal-body').html(data);
                $('#order_details').modal();
                // $('.c-preloader').hide();
            });
        }

        function addToCart(product_id)
        {
            $.ajaxSetup({
                headers: {
                    'X-CSRF-TOKEN': jQuery('meta[name="csrf-token"]').attr('content')
                }
            });
            $.ajax({
                    type:"POST",
                    url: '{{ route('cart.addToCart') }}',
                    product_id:product_id,
                    data: $('#option-choice-form').serializeArray(),
               
                    success: function(data){
                        console.log("cart added");
                        //  $('#single_product_view').html(data.single_product_view);
                        //window.location.reload();
                        updateNavCart(data.nav_cart_view,data.cart_count);
                    }
                });

           
        }

        function removeFromCart(key){

            $.post('{{ route('cart.removeFromCart') }}', {
              _token : '{{ csrf_token() }}',
                id      :  key
            }, function(data){
                // console.log("success");
                updateNavCart(data.nav_cart_view,data.cart_count);
                 $('#cart-summary').html(data.cart_view);
                 //window.location.reload();
                // SISMOO.plugins.notify('success', "{{ translate('Item has been removed from cart') }}");
                // $('#cart_items_sidenav').html(parseInt($('#cart_items_sidenav').html())-1);
            });
        }

        function updateNavCart(view,count){
            $('.cart-count').html(count);
            $('#cart_items').html(view);
            window.location.reload();
            // window.location.href="{{ route('cart') }}";
        }


    </script>


</body>

</html>