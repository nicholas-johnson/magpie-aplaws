var default_text = "search";

$(function() {
  $(".search_field").focus(function() {
    if ($(this).val() == default_text) {
      $(this).val("");
    }
  });
  $(".search_field").blur(function() {
    if ($(this).val() == "") {
      $(this).val(default_text);
    }
  })
})