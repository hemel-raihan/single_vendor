@if(count($combinations[0]) > 0)
<table class="table table-bordered sismoo-table">
    <thead>
        <tr>
            <td class="text-center">
                Variant
            </td>
            <td class="text-center">
               Variant Price
            </td>
            <td class="text-center" data-breakpoints="lg">
               SKU
            </td>
            <td class="text-center" data-breakpoints="lg">
                Quantity
            </td>
            <td class="text-center" data-breakpoints="lg">
                Photo
            </td>
            <td></td>
        </tr>
    </thead>
    <tbody>

        @foreach ($combinations as $key => $combination)
            @php
                $variation_available = false;
                $sku = '';
                foreach (explode(' ', $product_name) as $key => $value) {
                    $sku .= substr($value, 0, 1);
                }

                $str = '';
                foreach ($combination as $key => $item){
                    if($key > 0 ) {
                        $str .= '-'.str_replace(' ', '', $item);
                        $sku .='-'.str_replace(' ', '', $item);
                    }
                    else {
                        if($colors_active == 1) {
                            $color_name = \App\Models\Product\Color::where('code', $item)->first()->name;
                            $str .= $color_name;
                            $sku .='-'.$color_name;
                        }
                        else {
                            $str .= str_replace(' ', '', $item);
                            $sku .='-'.str_replace(' ', '', $item);
                        }
                    }
                    $stock = $product->stocks->where('variant', $str)->first();
                    // if($stock != null) {
                    //     $variation_available = true;
                    // }
                }
            @endphp
            @if(strlen($str) > 0)
            <tr class="variant">
                <td>
                    <label for="" class="control-label">{{ $str }}</label>
                </td>
                <td>
                    <input type="number" lang="en" name="price_{{ $str }}" value="@php
                            if ($product->unit_price == $price) {
                                if($stock != null){
                                    echo $stock->price;
                                }
                                else {
                                    echo $price;
                                }
                            }
                            else{
                                echo $price;
                            }
                           @endphp" min="0" step="0.01" class="form-control" required>
                </td>
                <td>
                    <input type="text" name="sku_{{ $str }}" value="@php
                            if($stock != null) {
                                echo $stock->sku;
                            }
                            else {
                                echo $str;
                            }
                           @endphp" class="form-control">
                </td>
                <td>
                    <input type="number" lang="en" name="qty_{{ $str }}" value="@php
                            if($stock != null){
                                echo $stock->qty;
                            }
                            else{
                                echo '10';
                            }
                           @endphp" min="0" step="1" class="form-control" required>
                </td>
                <td>
                    <div class=" input-group " data-toggle="sismoouploader" data-type="image">
                        {{-- <div class="input-group-prepend">
                            <div class="input-group-text bg-soft-secondary font-weight-medium">Browse</div>
                        </div>
                        <div class="form-control file-amount text-truncate">Choose File</div>
                        <input type="hidden" name="img_{{ $str }}" class="selected-files" value="@php
                                if($stock != null){
                                    echo $stock->image;
                                }
                                else{
                                    echo null;
                                }
                               @endphp"> --}}
                               <input type="file" data-height="100" class="dropify form-control" data-default-file="{{ isset($product) ? asset('uploads/productphoto/'.$product->image) : '' }}" name="image">
                    </div>
                    <div class="file-preview box sm"></div>
                </td>
                {{-- <td>
                    <button type="button" class="btn btn-danger waves effect" onclick="delete_variant(this)"><i class="fa fa-trash"></i></button>
                </td> --}}
            </tr>
            @endif
        @endforeach

    </tbody>
</table>
@endif
