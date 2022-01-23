<?php

namespace App\Http\Controllers\Admin\frontmenu;

use App\Models\Admin\Page;
use Illuminate\Support\Str;
use Illuminate\Http\Request;
use App\Models\blog\category;
use App\Models\Teams\Teamcategory;
use App\Models\Frontmenu\Frontmenu;
use App\Http\Controllers\Controller;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Gate;
use App\Models\Frontmenu\Frontmenuitem;
use App\Models\general_content\Contentcategory;

class MenuitemController extends Controller
{
    public function index($id)
    {
        Gate::authorize('app.front.menuitems.widgetbuilder');
        $menu = Frontmenu::findOrFail($id);
        $auth = Auth::guard('admin')->user();
        $pages = Page::all();
        $categories = category::where('parent_id', '=', 0)->get();
        $contentcategories = Contentcategory::where('parent_id', '=', 0)->get();
        $teamcategories = Teamcategory::where('parent_id', '=', 0)->get();
        return view('backend.admin.frontmenu.builder',compact('menu','auth','pages','categories','contentcategories','teamcategories'));
    }

    // public function show()
    // {
    //     $menuitem = Frontmenuitem::all();
    //     return response()->json([
    //         'menuitem' => $menuitem,
    //     ]);
    // }

    public function create($id)
    {
        $menu = Frontmenu::findOrFail($id);
        return view('backend.admin.frontmenu.menuitem.form',compact('menu'));
    }

    public function store(Request $request,$id)
    {
        foreach($request->input('slug') as $key => $value) {
            $slug = $request->input('slug')[$key];
        }
        foreach($request->input('id') as $key => $value) {
            $content_id = $request->input('id')[$key];
        }

        $contentcategory = Contentcategory::all();
        foreach($contentcategory  as $cat)
        {
            if($cat->slug == $slug)
            {
                $contentcategory_id = $content_id;
            }
            else
            {
                $contentcategory_id = null;
            }

        }

        $page = Page::all();
        foreach($page  as $page)
        {
            if($page->slug == $slug)
            {
                $page_id = $content_id;
            }
            else
            {
                $page_id = null;
            }

        }


        $this->validate($request,[
            'title' => 'required'
        ],
        [
            'title.required' => 'Menu Order already changed. check in Home-page Please!',
        ]);


        $menu = Frontmenu::findOrFail($id);

        // foreach($request->input('title') as $key => $value) {
        //     $title = $request->input('title')[$key];


        // $menu->menuItems()->create([
        //     'title' => ucwords(str_replace('-', ' ', $title)),
        //     'slug' => $request->input('title')[$key],
        //     //'type' => $request->type,
        //     //'divider_title' => $request->divider_title,
        //     //'target' => $request->target,
        // ]);

        foreach($request->input('title') as $key => $value) {
            $title = $request->input('title')[$key];


        $menu->menuItems()->create([
            'title' => $title,
            'slug' => $slug,
            'contentcategory_id' => $contentcategory_id,
            'page_id' => $page_id,
        ]);

        }

        notify()->success('Menu Item Added','Added');
        return redirect()->route('admin.menuitem.builder',$menu->id);
    }

    public function menustore(Request $request,$id)
    {
        $menu = Frontmenu::findOrFail($id);
        $menu->menuItems()->create([
            'title' => $request->title,
            'slug' => $request->slug,
        ]);
        return back();

        // $menu = new Frontmenuitem();
        // $menu->title = $request->title;
        // $menu->slug = $request->slug;
        // $menu->frontmenu_id = 1;
        // $menu->save();
        // return ['success'=>true,'message'=>'data insert successfully'];
    }

    public function order(Request $request, $id)
    {
        $menu = Frontmenu::findOrFail($id);
        $menuItemOrder = json_decode($request->get('order'));
        $this->orderMenu($menuItemOrder,0);
    }

    private function orderMenu(array $menuItems, $parentId)
    {
        foreach($menuItems as $index => $item)
        {
            $menutItem = Frontmenuitem::findOrFail($item->id);
            $menutItem->update([
                'order' => $index + 1,
                'parent_id' => $parentId
            ]);

            if(isset($item->children))
            {
                $this->orderMenu($item->children,$menutItem->id);
            }

        }
    }

    public function edit($id,$menuId)
    {

        $menu = Frontmenu::findOrFail($id);
        $auth = Auth::guard('admin')->user();
        //$menuitemm = $menu->menuItems()->first($menuId);
        $menuitemm = Frontmenuitem::find($menuId);
        $pages = Page::all();
        $categories = category::where('parent_id', '=', 0)->get();
        $contentcategories = Contentcategory::where('parent_id', '=', 0)->get();
        $teamcategories = Teamcategory::where('parent_id', '=', 0)->get();
        return view('backend.admin.frontmenu.builder',compact('menu','auth','menuitemm','pages','categories','contentcategories','teamcategories'));
    }

    public function update(Request $request,$menuId)
    {
        $frontmenu = Frontmenuitem::findOrFail($menuId);
        $frontmenu->update([
            'title' => $request->title,
            'slug' => $request->slug,
        ]);
        notify()->success('Menu Updated Successfully');
        return back();
    }

    public function destroy($id,$menuId)
    {
        Frontmenuitem::findOrFail($menuId)
                 ->delete();

        notify()->success('Menu Delete Successfully');
        return back();
    }
}
