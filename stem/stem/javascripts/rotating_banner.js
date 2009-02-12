var current_image = 1;
var number_of_images = 3; // Modify this parameter to change number of images

$(function(){
  $('div.random_image').css('height', $('#random_image').height() + 'px');
  $('#random_image').after($('#random_image').clone().attr('id', "random_image_swapper"));
  //$('#random_image_swapper').fadeOut(0);
  //$('#random_image').css('position', 'absolute');
  //$('#random_image_swapper').css('position', 'absolute');
  
  setTimeout('changeImage()', 500);
/*  var i = Math.floor(Math.random() * number_of_images) + 1;
  $('#random_image').attr('src', $('#random_image').attr('src').replace(/1/, i)); */
})

preloadImages = function(number_of_images) {
  for(var i = 0; i < number_of_images; i++) {
    $('<img />').attr('src', $('#random_image').attr('src').replace(String(current_image), String(i)));
    jQuery("<img>").attr("src", i);
  }
}

changeImage = function() {
  $('#random_image_swapper').attr('src', $('#random_image_swapper').attr('src').replace(String(current_image), String(++current_image)));
  $('#random_image_swapper').fadeOut(0, function(){
    $('#random_image_swapper').fadeIn(1000);
  });
  
  setTimeout('changeImage()', 5000);
}