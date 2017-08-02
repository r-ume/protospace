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

    const avatarImageId    = "#avatar-image";
    const avatarImageClass = ".avatar-image";
    const avatarImageWidth = $(avatarImageClass).width();
    const avatarImageHeight = $(avatarImageClass).height();

    const reader          =  new FileReader();

    function previewImage(idName){
        $(idName + ' input[type=file]').change(function(){

            console.log(idName);
            // get an image file
            const file = $(this).prop('files')[0];

            if(file.type.match('image*')) {
                reader.onload = function() {
                    const idNameImage = $(idName + ' img');

                    // set src tag into id Name
                    idNameImage.attr('src', reader.result);
                    idNameImage.addClass("image-preview");

                    if(idName.match('#main-')) idNameImage.width(mainImageWidth).height(mainImageHeight);
                    if(idName.match('#sub-')) idNameImage.width(subImageWidth).height(subImageHeight);
                    if(idName.match('#avatar-')) {
                        idNameImage
                            .addClass("user-image")
                            .width(avatarImageWidth)
                            .height(avatarImageHeight)
                            .css({
                                right: '18px'
                            });
                    }
                };

                reader.readAsDataURL(file);
            }
        });
    }

    previewImage(mainImageId);
    previewImage(firstSubImageId);
    previewImage(secondSubImageId);
    previewImage(avatarImageId);

    $('.main-prototype-image').width(mainImageWidth).height(mainImageHeight);
    $('.sub-prototype-image').width(subImageWidth).height(subImageHeight);
    $('.avatar-image').width(avatarImageWidth).height(avatarImageHeight);


});
