var init_stuff = function(){
  $("#sidebar, #content, #sidebar-virtual").addClass("active");
  $(".collapse.in").addClass("in");
  $("a[aria-expanded=true]").attr("aria-expanded", "false");
};
$(document).ready(function () {
    init_stuff();
});

$(document).ready(function () {
  $("#sidebar-virtual").on("mouseenter", function () {
    $("#sidebar, #content, #sidebar-virtual").toggleClass("active");
    $(".collapse.in").toggleClass("in");
    $("a[aria-expanded=true]").attr("aria-expanded", "false");
  });
});


