var number_of_images = 3; // Modify this parameter to change number of images

var current_image = 1;
var next_image = 2;
var preload = number_of_images;

$(function(){
  $('div.random_image').css('height', $('#random_image').height() + 'px');
  $('#random_image').after($('#random_image').clone().attr('id', "random_image_swapper"));
  $('#random_image_swapper').attr('src', $('#random_image_swapper').attr('src').replace(String(current_image), String(next_image)));
  $('div.random_image').css('position','relative');
  $('#random_image_swapper').css('display', 'none').css('position', 'absolute').css('top', '0').css('left', '0');
  preloadImages();
})

preloadImages = function() {
  for(var i = 2; i <= number_of_images; i++) {
    var a = $(new Image()).load(function() {
      if (--preload <= 1) {
        setTimeout('changeImage()', 3000)
      }
    }).attr('src', $('#random_image').attr('src').replace(String(current_image), String(i)));
  }
}

changeImage = function() {
  $('#random_image_swapper').fadeIn(1000, function(){
    $('#random_image').attr('src', $('#random_image').attr('src').replace(String(current_image), String(next_image)));
    $('#random_image_swapper').css('display', 'none');
    if (++current_image > number_of_images) {current_image = 1}
    if (++next_image > number_of_images) {next_image = 1}
    $('#random_image_swapper').attr('src', $('#random_image_swapper').attr('src').replace(String(current_image), String(next_image)));
  });
  setTimeout('changeImage()', 5000);
}