<?php 

function translate($key, $lang=null){
    if($lang == null){
        $lang = App::getLocale();
    }
    return $key;
}