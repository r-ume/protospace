// Making references in the code below
//http://yamakadoh.net/weblog/?p=595

$(document).on("turbolinks:load", function(){

	const mainImageId      = "#main-prototype-image";
	const mainImageWidth   = $(mainImageId).width();
	const mainImageHeight  = $(mainImageId).height();

	// Collection of custom data(data-sub-image-id)
	const subImageIdNums = $('div[data-sub-image-id]').map(function () {
		return $(this).attr('data-sub-image-id');
	});
	const firstSubImageId  = "#sub-prototype-image" + subImageIdNums[0];
	const secondSubImageId = "#sub-prototype-image" + subImageIdNums[1];
	const subImageWidth    = $('.list-group-item').width();
	const subImageHeight   = $('.list-group-item').height();

	const reader          =  new FileReader();

	function previewImage(idName){
		$(idName + ' input[type=file]').change(function(){
			// get an image file
			const file = $(this).prop('files')[0];

			if(file.type.match('image.*')) {

				reader.onload = function() {
					let idNameImage = $(idName + ' img');

					// set src tag into id Name
					idNameImage.attr('src', reader.result);
					idNameImage.addClass("image-preview");

					if(idName.match('#main-')) idNameImage.width(mainImageWidth).height(mainImageHeight); 
					if(idName.match('#sub-')) idNameImage.width(subImageWidth).height(subImageHeight);
			}
	
			reader.readAsDataURL(file);
			}
		});
	}

	previewImage(mainImageId);
	previewImage(firstSubImageId);
	previewImage(secondSubImageId);

	$('.main-prototype-image').width(mainImageWidth).height(mainImageHeight);
	$('.sub-prototype-image').width(subImageWidth).height(subImageHeight);

});
