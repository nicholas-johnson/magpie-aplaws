$(function() {
  $(".rollover img").hover(function() {
    //alert($(this).attr('src'));
    $(this).attr('src', $(this).attr('src').replace('_off', '_over'));
  },
  function() {
    $(this).attr('src', $(this).attr('src').replace('_over', '_off'));
  })
})