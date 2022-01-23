<?php

namespace App\Models\Product;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use App\Models\Admin;
use App\Models\Admin\Sidebar;

class Product extends Model
{
    use HasFactory;

    protected $guarded = ['id'];

    public function productcategories()
    {
        return $this->belongsToMany(Productcategory::class);
    }

    public function brand()
    {
        return $this->belongsTo(Brand::class);
    }

    public function admin()
    {
        return $this->belongsTo(Admin::class);
    }

    public function sidebars()
    {
        return $this->belongsToMany(Sidebar::class);
    }

    public function flashdeals()
    {
        return $this->belongsToMany(Flashdeal::class);
    }

    public function taxes()
    {
        return $this->belongsToMany(Tax::class);
    }

    public function stocks()
    {
        return $this->hasMany(Productstock::class);
    }

}
