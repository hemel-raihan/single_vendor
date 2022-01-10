@extends('layouts.app')

@section('styles')

<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/Dropify/0.2.2/css/dropify.min.css" integrity="sha512-EZSUkJWTjzDlspOoPSpUFR0o0Xy7jdzW//6qhUkoZ9c4StFkVsp9fbbd0O06p9ELS3H486m4wmrCELjza4JEog==" crossorigin="anonymous" referrerpolicy="no-referrer" />

        <!-- FILE UPLODE CSS -->
        <link href="{{ asset('assets/plugins/fileuploads/css/fileupload.css') }}" rel="stylesheet" type="text/css"/>
        <!-- INTERNAL Fancy File Upload css -->
        <link href="{{ asset('assets/plugins/fancyuploder/fancy_fileupload.css') }}" rel="stylesheet" />
        <!-- WYSIWYG EDITOR CSS -->
        <link href="{{ asset('assets/plugins/wysiwyag/richtext.css') }}" rel="stylesheet"/>

        <!-- SUMMERNOTE CSS -->
        <link rel="stylesheet" href="{{ asset('assets/plugins/summernote/summernote-bs4.css') }}">

        <!-- INTERNAL Quill css -->
        <link href="{{ asset('assets/plugins/quill/quill.snow.css') }}" rel="stylesheet">
        <link href="{{ asset('assets/plugins/quill/quill.bubble.css') }}" rel="stylesheet">
        <!-- INTERNAL SELECT2 CSS -->
        <link href="{{ asset('assets/plugins/select2/select2.min.css') }}" rel="stylesheet"/>

        <!-- INTERNAL Jquerytransfer css-->
        <link rel="stylesheet" href="{{ asset('assets/plugins/jQuerytransfer/jquery.transfer.css') }}">
        <link rel="stylesheet" href="{{ asset('assets/plugins/jQuerytransfer/icon_font/icon_font.css') }}">


        <!-- MULTI SELECT CSS -->
        <link rel="stylesheet" href="{{ asset('assets/plugins/multipleselect/multiple-select.css') }}">

        <!--INTERNAL IntlTelInput css-->
        <link rel="stylesheet" href="{{ asset('assets/plugins/intl-tel-input-master/intlTelInput.css') }}">

        <!-- INTERNAL multi css-->
        <link rel="stylesheet" href="{{ asset('assets/plugins/multi/multi.min.css') }}">






                <!-- FILE UPLODE CSS -->
                <link href="{{ asset('assets/plugins/fileuploads/css/fileupload.css') }}" rel="stylesheet" type="text/css"/>

                <!-- SELECT2 CSS -->
                <link href="{{ asset('assets/plugins/select2/select2.min.css') }}" rel="stylesheet"/>

                <!-- INTERNAL Fancy File Upload css -->
                <link href="{{ asset('assets/plugins/fancyuploder/fancy_fileupload.css') }}" rel="stylesheet" />

                <!--BOOTSTRAP-DATERANGEPICKER CSS-->
                <link rel="stylesheet" href="{{ asset('assets/plugins/bootstrap-daterangepicker/daterangepicker.css') }}">

                <!-- TIME PICKER CSS -->
                <link href="{{ asset('assets/plugins/time-picker/jquery.timepicker.css') }}" rel="stylesheet"/>

                <!-- INTERNAL Date Picker css -->
                <link href="{{ asset('assets/plugins/date-picker/date-picker.css') }}" rel="stylesheet" />

                <!-- INTERNAL Sumoselect css-->
                <link rel="stylesheet" href="{{ asset('assets/plugins/sumoselect/sumoselect.css') }}">

                <!-- INTERNAL Jquerytransfer css-->
                <link rel="stylesheet" href="{{ asset('assets/plugins/jQuerytransfer/jquery.transfer.css') }}">
                <link rel="stylesheet" href="{{ asset('assets/plugins/jQuerytransfer/icon_font/icon_font.css') }}">

                <!-- INTERNAL Bootstrap DatePicker css-->
                <link rel="stylesheet" href="{{ asset('assets/plugins/bootstrap-datepicker/bootstrap-datepicker.css') }}">

                <!-- MULTI SELECT CSS -->
                <link rel="stylesheet" href="{{ asset('assets/plugins/multipleselect/multiple-select.css') }}">

                <!--INTERNAL IntlTelInput css-->
                <link rel="stylesheet" href="{{ asset('assets/plugins/intl-tel-input-master/intlTelInput.css') }}">

                <!-- INTERNAL multi css-->
                <link rel="stylesheet" href="{{ asset('assets/plugins/multi/multi.min.css') }}">

                <style>
                    #preview {
  display:inline-block;
  position:absolute;
  margin-left:20px;
}
                    </style>

@endsection

@section('content')

						<!-- PAGE-HEADER -->
						<div class="page-header">
							<div>
								<h1 class="page-title">{{ isset($category) ? 'Edit ' : 'Create '}}Flash-Deals</h1>
								{{-- <ol class="breadcrumb">
									<li class="breadcrumb-item"><a href="#">Tables</a></li>
									<li class="breadcrumb-item active" aria-current="page">Table</li>
								</ol> --}}
							</div>
							<div class="ms-auto pageheader-btn">
								<a href="{{route('admin.flash-deals.index')}}" class="btn btn-primary btn-icon text-white me-2">
									<span>
										{{-- <i class="fe fe-minus"></i> --}}
									</span> Back To List
								</a>
								{{-- <a href="#" class="btn btn-success btn-icon text-white">
									<span>
										<i class="fe fe-log-in"></i>
									</span> Export
								</a> --}}
							</div>
						</div>
						<!-- PAGE-HEADER END -->

                   <!-- ROW-1 OPEN -->
    <form method="POST" action="{{isset($category) ? route('admin.flash-deals.update',$category->id) : route('admin.flash-deals.store')}}" enctype="multipart/form-data">
    @csrf
    @isset($category)
    @method('PUT')
    @endisset
	<div class="row">
		{{-- Left Side --}}
		<div class="col-lg-9 col-xl-9 col-md-12 col-sm-12">
			<div class="card">
				<div class="card-header">
					<h3 class="card-title">Create Flash-Deals</h3>
				</div>
				<div class="card-body">

                    @if ($errors->any())
                        <div class="alert alert-danger">
                            <ul>
                                @foreach ($errors->all() as $error)
                                    <li>{{ $error }}</li>
                                @endforeach
                            </ul>
                        </div>
                    @endif



					<div class="form-group">
						<label for="exampleInputname">Title</label>
						<input type="text" class="form-control @error('title') is-invalid @enderror" value="{{$category->title ?? old('title')}}" name="title" id="exampleInputname" >
                        @error('title')
                        <span class="invalid-feedback" role="alert">
                            <strong>{{$message}}</strong>
                        </span>
                        @enderror
					</div>

                    <div class="form-group">
						<label for="exampleInputname">Background Color</label>
						<input type="text" class="form-control " value="{{$category->background_color ?? old('background_color')}}" name="background_color" id="exampleInputname" placeholder="#0000">

					</div>

                    <div class="form-group">
						<label for="exampleInputname">Text Color</label>
						<input type="text" class="form-control " value="{{$category->text_color ?? old('text_color')}}" name="text_color" id="exampleInputname" >

					</div>

					<div class="form-group">
						<label class="form-label">Banner Image</label>
						<!-- <input id="demo" type="file" name="image" accept=".jpg, .png, image/jpeg, image/png" multiple="" class="ff_fileupload_hidden"> -->
                        <input type="file" data-height="100" class="dropify form-control @error('banner') is-invalid @enderror" data-default-file="{{ isset($category) ? asset($category->banner) : '' }}" name="banner">
                        @error('banner')
                        <span class="invalid-feedback" role="alert">
                            <strong>{{$message}}</strong>
                        </span>
                        @enderror
					</div>

                    <div class="form-group">
						<label for="exampleInputname">Start Date</label>
						<input type="date" class="form-control" value="{{$product->start_date ?? old('start_date') }}" name="start_date" id="">
					</div>

                    <div class="form-group">
						<label for="exampleInputname">End Date</label>
						<input type="date" class="form-control" value="{{$product->end_date ?? old('end_date') }}" name="end_date" id="">
					</div>

                    <div class="form-group">
						<label class="form-label">Products</label>
                            <select name="products[]" multiple="multiple" id="products" class="testselect2" >
                            @foreach (\App\Models\Product\Product::all() as $key => $product)
                            <option value="{{$product->id}}"  >{{$product->title}}</option>
                            @endforeach
						   </select>
					</div>

                    <div class="form-group" id="discount_table">

                    </div>

				</div>
				<div class="card-footer text-end">
					<button type="submit" class="btn btn-success mt-1">
                        @isset($category)
                        <i class="fas fa-arrow-circle-up"></i>
                        Update
                        @else
                        <i class="fe fe-plus"></i>
                        Create
                        @endisset
                    </button>
					<a href="{{route('admin.categories.index')}}" class="btn btn-danger mt-1">Cancel</a>
				</div>
			</div>
		</div>

		{{-- Right Side --}}
		<div class="col-lg-3 col-xl-3 col-md-12 col-sm-12" style="float: left">



			<div class="card">
				<div class="card-header">
					<h3 class="card-title">Create Page</h3>
				</div>
				<div class="card-body">
                    @isset($category)
					<div class="form-group">
						<div class="form-label">Status</div>
						<label class="custom-switch">
							<input type="checkbox" name="status" {{$category->status == true ? 'checked' : ''}} class="custom-switch-input ">
							<span class="custom-switch-indicator"></span>
						</label>
					</div>

                    @else

                    <div class="form-group">
						<div class="form-label">Status</div>
						<label class="custom-switch">
							<input type="checkbox" name="status" class="custom-switch-input ">
							<span class="custom-switch-indicator"></span>
						</label>
					</div>

                    @endisset





				</div>

			</div>
		</div>

	</div>
    </form>
	<!-- ROW-1 CLOSED -->
@endsection('content')

@section('scripts')


<script type="text/javascript">
    // $(document).ready(function(){
    //     $('#products').on('change', function(){
    //         var product_ids = $('#products').val();
    //         if(product_ids.length > 0){
    //             $.post('{{ route('admin.flash_deals.product_discount') }}', {_token:'{{ csrf_token() }}', product_ids:product_ids}, function(data){
    //                 $('#discount_table').html(data);
    //                 //SISMOO.plugins.fooTable();
    //             });
    //         }
    //         else{
    //             $('#discount_table').html(null);
    //         }
    //     });
    // });

    $('#products').on('change', function() {
        var product_ids = $('#products').val();
            if(product_ids.length > 0){
                $.post('{{ route('admin.flash_deals.product_discount') }}', {_token:'{{ csrf_token() }}', product_ids:product_ids}, function(data){
                    $('#discount_table').html(data);
                    //SISMOO.plugins.fooTable();
                });
            }
            else{
                $('#discount_table').html(null);
            }
    });

</script>

{{-- <script>
    // $("select").imagepicker()
    $(document).ready( function() {
   $(document).on("change", "select", function() {
      let img = $(this).find("option:selected").attr("data-img-src");
      $("#preview").empty().append("<image src=" + img + "/>");
   });
});

    </script> --}}


        <!-- <script>
            $('#select-all').click(function(event){
                if(this.checked)
                {
                    $(':checkbox').each(function(){
                        this.checked = true;
                    });
                }
                else
                {
                    $(':checkbox').each(function(){
                        this.checked = false;
                    });
                }
            });
         </script> -->

        <script src="https://cdnjs.cloudflare.com/ajax/libs/Dropify/0.2.2/js/dropify.min.js" integrity="sha512-8QFTrG0oeOiyWo/VM9Y8kgxdlCryqhIxVeRpWSezdRRAvarxVtwLnGroJgnVW9/XBRduxO/z1GblzPrMQoeuew==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>


        <!-- CHARTJS JS -->
       <script src="{{ asset('assets/plugins/chart/Chart.bundle.js')}}"></script>
       <script src="{{ asset('assets/plugins/chart/utils.js')}}"></script>

       <!-- INTERNAL SELECT2 JS -->
       <script src="{{ asset('assets/plugins/select2/select2.full.min.js') }}"></script>
       <script src="{{ asset('assets/js/select2.js') }}"></script>
       <!-- FILE UPLOADES JS -->
       <script src="{{ asset('assets/plugins/fileuploads/js/fileupload.js') }}"></script>
       <script src="{{ asset('assets/plugins/fileuploads/js/file-upload.js') }}"></script>

       <!-- INTERNAL File-Uploads Js-->
       <script src="{{ asset('assets/plugins/fancyuploder/jquery.ui.widget.js') }}"></script>
       <script src="{{ asset('assets/plugins/fancyuploder/jquery.fileupload.js') }}"></script>
       <script src="{{ asset('assets/plugins/fancyuploder/jquery.iframe-transport.js') }}"></script>
       <script src="{{ asset('assets/plugins/fancyuploder/jquery.fancy-fileupload.js') }}"></script>
       <script src="{{ asset('assets/plugins/fancyuploder/fancy-uploader.js') }}"></script>

       <!-- WYSIWYG Editor JS -->
       <script src="{{ asset('assets/plugins/wysiwyag/jquery.richtext.js') }}"></script>
       <script src="{{ asset('assets/plugins/wysiwyag/wysiwyag.js') }}"></script>

       <!-- INTERNAL Sumoselect js-->
       <script src="{{ asset('assets/plugins/sumoselect/jquery.sumoselect.js') }}"></script>

       <script src="{{ asset('assets/plugins/date-picker/jquery-ui.js') }}"></script>


       <!-- INTERNAL multi js-->
       <script src="{{ asset('assets/plugins/multi/multi.min.js') }}"></script>

               <!-- MULTI SELECT JS-->
               <script src="{{ asset('assets/plugins/multipleselect/multiple-select.js') }}"></script>
               <script src="{{ asset('assets/plugins/multipleselect/multi-select.js') }}"></script>

                       <!-- FORMELEMENTS JS -->
       <script src="{{ asset('assets/js/formelementadvnced.js') }}"></script>
       <script src="{{ asset('assets/js/form-elements.js') }}"></script>


       <!-- INTERNAL jquery transfer js-->
       <script src="{{ asset('assets/plugins/jQuerytransfer/jquery.transfer.js') }}"></script>

       <!-- SUMMERNOTE JS -->
       <script src="{{ asset('assets/plugins/summernote/summernote-bs4.js') }}"></script>

       <!-- FORMEDITOR JS -->
       <script src="{{ asset('assets/plugins/quill/quill.min.js') }}"></script>
       <script src="{{ asset('assets/js/form-editor2.js') }}"></script>

@endsection
