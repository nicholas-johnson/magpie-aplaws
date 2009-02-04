$(function(){
  var i = Math.floor(Math.random() * 3) + 1;
  $('#random_image').attr('src', $('#random_image').attr('src').replace(/1/, i));
})