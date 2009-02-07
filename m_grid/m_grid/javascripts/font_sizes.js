$(function(){
  $('#small_link').click(function() {
    var href = $('head > link').filter(':first').attr('href').replace(/medium|large/, "small");
    $('head > link').filter(':first').attr('href', href);
    return false;
  })
  $('#medium_link').click(function() {
    var href = $('head > link').filter(':first').attr('href').replace(/small|large/, "medium");
    $('head > link').filter(':first').attr('href', href);
    return false;
  })
  $('#large_link').click(function() {
    var href = $('head > link').filter(':first').attr('href').replace(/small|medium/, "large");
    $('head > link').filter(':first').attr('href', href);
    return false;
  })
});