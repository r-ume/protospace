// Making references in the code below
//http://yamakadoh.net/weblog/?p=595

$(document).on("ready page:load", function(){

	const mainImageId = "#main-prototype-image";
	const reader = new FileReader();

	function previewImage(idName){
		$(idName + ' input[type=file]').change(function(){
			// get an image file
			const file = $(this).prop('files')[0];

			if(file.type.match('image.*')) {
				reader.onload = function() {
					// set src tag into id Name
					$(idName + ' img').attr('src', reader.result).width(730).height(500);
					$(idName + ' img').addClass("image-preview");
			}
	
			reader.readAsDataURL(file);
			}
		});
	}

	previewImage(mainImageId);
});
