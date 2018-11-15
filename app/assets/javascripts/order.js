var disabled_stuff = function(){
  $("#order_order_name[type=text]").prop("disabled", true);
  $("#order_order_phone[type=text]").prop("disabled", true);
  $("textarea#order_order_address").prop("disabled", true);
};

var enabled_stuff = function(){
  $("#order_order_name[type=text]").prop("disabled", false);
  $("#order_order_phone[type=text]").prop("disabled", false);
  $("textarea#order_order_address").prop("disabled", false);
};

var toggle_stuff = function(){
  $("#btnNext").toggle(1000);
  $("#btnBack").toggle(1000);
  $("#cart-overview").toggle(1000);
  $("#btnGroup").toggle(1000);
};

var set_background_blond = function(){
  let blond = "#FAFFBD";
  $("#order_order_name[type=text]").css("background-color", blond);
  $("#order_order_phone[type=text]").css("background-color", blond);
  $("textarea#order_order_address").css("background-color", blond);
};

var set_background_white = function(){
  $("#order_order_name[type=text]").css("background-color", "white");
  $("#order_order_phone[type=text]").css("background-color", "white");
  $("textarea#order_order_address").css("background-color", "white");
};

var set_billing_address = function(){
    $("#order_order_name[type=hidden]").val($("#order_order_name[type=text]").val());
    $("#order_order_phone[type=hidden]").val($("#order_order_phone[type=text]").val());
    $("#order_order_address[type=hidden]").val($("textarea#order_order_address").val());
};

var remove_errors_or_flash = function(){
  if ($("#flash-banner").length){
    $("#flash-banner").remove();
  }
  if($("#error_explanation")){
    $("#error_explanation").remove();
  }
};

$(document).ready(function() {
  $("#btnNext").show();
  $("#cart-overview").hide();
  $("#btnGroup").hide();

  $(document).on("click", "#btnNext", function(event) {
    event.preventDefault();
    set_billing_address();
    set_background_blond();
    disabled_stuff();
    remove_errors_or_flash();
    toggle_stuff();
  });

  $(document).on("click", "#btnEdit", function(event) {
    event.preventDefault();
    enabled_stuff();
    toggle_stuff();
    set_background_white();
  });
});

$(document).ready(function($) {
    $(".clickable-row").click(function() {
        window.location.href = $(".clickable-row").data("href");
    });
});
