<?php 

function translate($key, $lang=null){
    if($lang == null){
        $lang = App::getLocale();
    }
    return $key;
}

//Shows Base Price with discount
if (!function_exists('home_discounted_base_price')) {
    function home_discounted_base_price($product)
    {
        $price = $product->unit_price;
        $tax = 0;

        $discount_applicable = false;

        if ($product->discount_startdate == null) {
            $discount_applicable = false;
        } 
        elseif (date('Y-m-d') >= $product->discount_startdate && date('Y-m-d') <= $product->discount_enddate)
        {
            $discount_applicable = true;
        }

        if ($discount_applicable) {
            if ($product->discount_type == 'Percent') {
                $price -= ($price * $product->discount_rate) / 100;
            } elseif ($product->discount_type == 'Flat') {
                $price = $price - $product->discount_rate;
            }
        }

        foreach ($product->taxes as $product_tax) {
            if ($product_tax->tax_type == 'Percent') {
                $tax += ($price * $product_tax->tax) / 100;
            } elseif ($product_tax->tax_type == 'Flat') {
                $tax += $product_tax->tax;
            }
        }
        $price += $tax;


        return $price;
    }

    //Product rating

    if (!function_exists('renderStarRating')) {
        function renderStarRating($rating, $maxRating = 5)
        {
            $fullStar = "<span class='ratings' style='width:100%'></span>";
            $halfStar = "<span class='ratings' style='width:50%'></span>";
            $emptyStar = "<span class='ratings' style='width:0%'></span>";
            $rating = $rating <= $maxRating ? $rating : $maxRating;
    
            $fullStarCount = (int)$rating;
            $halfStarCount = ceil($rating) - $fullStarCount;
            $emptyStarCount = $maxRating - $fullStarCount - $halfStarCount;
    
            $html = str_repeat($fullStar, $fullStarCount);
            $html .= str_repeat($halfStar, $halfStarCount);
            $html .= str_repeat($emptyStar, $emptyStarCount);
            echo $html;
        }
    }
}

