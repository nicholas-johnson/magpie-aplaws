
$(function() {
  $(".faq li").addClass("closed");
  $(".faq li:first").removeClass("closed");
  $(".faq li:first").addClass("open");
  $(".faq .answer").each(function() {
    $(this).attr("height", "" + $(this).height() + "px");
  });
  $(".faq .closed .answer").hide();
  $(".faq .question").click(function() {
    var el = $(this)
    if (el.closest('li').hasClass("closed")) {
      rollUp($(".faq .open .answer"));
      $(".faq .open").addClass("closed");
      $(".faq li").removeClass("open");
      el.closest('li').removeClass("closed");
      el.closest('li').addClass("open");
      rollDown(el.siblings('.answer'));
    }
  });
});

function rollUp(el) {
  el.each(function() {
    $(this).css("height", $(this).attr("height"));
    $(this).animate({height:"0px"}, 300, "swing", function() {
      $(this).hide();
    });
  })
}

function rollDown(el) {
  el.each(function() {
    $(this).css("height", "0px");
    $(this).animate({height:$(this).attr("height")}, 300, "swing");
  })
}
