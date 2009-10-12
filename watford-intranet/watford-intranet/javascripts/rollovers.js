$(function() {
  /* Rollovers */
  $('.rollover').hover(
    function() {
      $(this).attr('src', $(this).attr('src').replace('_off', '_over'));
    },
    function() {
      $(this).attr('src', $(this).attr('src').replace('_over', '_off'));
    }
  );
})