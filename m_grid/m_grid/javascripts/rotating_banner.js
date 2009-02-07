$(function(){
  
  var number_of_images = 3; // Modify this parameter to change number of images
  
  var i = Math.floor(Math.random() * number_of_images) + 1;
  $('#random_image').attr('src', $('#random_image').attr('src').replace(/1/, i));
})