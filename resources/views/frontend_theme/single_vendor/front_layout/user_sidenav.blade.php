<div class="sidebar widget widget-dashboard mb-lg-0 mb-3 col-lg-3 order-0">
    <h2 class="text-uppercase">
        @if (Auth::check())
            {{ Auth::user()->name }}
        @endif
    </h2>
    <ul class="nav nav-tabs list flex-column mb-0" role="tablist">
        <li class="nav-item">
            <a class="nav-link active" id="dashboard-tab" data-toggle="tab" href="#dashboard"
                role="tab" aria-controls="dashboard" aria-selected="true">Dashboard</a>
        </li>

        <li class="nav-item">
            <a class="nav-link" href="{{ route('customer.orders') }}" 
               >Orders</a>
        </li>

        <li class="nav-item">
            <a class="nav-link" id="download-tab" data-toggle="tab" href="#download" role="tab"
                aria-controls="download" aria-selected="false">Downloads</a>
        </li>

        <li class="nav-item">
            <a class="nav-link" id="address-tab" data-toggle="tab" href="#address" role="tab"
                aria-controls="address" aria-selected="false">Addresses</a>
        </li>

        <li class="nav-item">
            <a class="nav-link" id="edit-tab" data-toggle="tab" href="#edit" role="tab"
                aria-controls="edit" aria-selected="false">Account
                details</a>
        </li>
        <li class="nav-item">
            <a class="nav-link" id="shop-address-tab" data-toggle="tab" href="#shipping" role="tab"
                aria-controls="edit" aria-selected="false">Shopping Addres</a>
        </li>
        <li class="nav-item">
            <a class="nav-link" id="wishlist-tab" data-toggle="tab" href="#wishlist" role="tab"
                aria-controls="wishlist" aria-selected="false">Wishlist</a>
        </li>
       
        <li class="nav-item">
            <a class="nav-link" href="login.html">Logout</a>
        </li>
    </ul>
</div>