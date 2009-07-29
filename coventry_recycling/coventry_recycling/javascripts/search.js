var default_text = "search";

$(function() {
  $("#search .submit").hide();
  $("#search .search").addClass("greyed_out");
  $("#search .search").focus(function() {
    if ($(this).val() == default_text) {
      $(this).val("");
      $(this).removeClass("greyed_out");
    }
  });
  $("#search .search").blur(function() {
    if ($(this).val() == "") {
      $(this).val(default_text);
      $(this).addClass("greyed_out");
    }
  })
})