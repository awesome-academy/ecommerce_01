$(document).on("change", ".quantity-in-cart", function(event) {
  event.preventDefault();
  let element = event.target
    $.ajax({
      url: "/cart_item",
      method: "patch",
      data: {
        product_id: element.offsetParent.id,
        quantity: element.value
      },
      success: function(data) {
        if(data.errors != undefined) {
          alert(I18n.t("js.cart.error_update",{error: data.errors}));
        }
      },
      error: function(data){
        alert(data.error);
      }
    });
});

$(document).on("click", ".btn-remove", function(event) {
  event.preventDefault();
  let el = event.target;
  var id = el.parentElement.previousElementSibling.previousElementSibling.id;
  $.ajax({
    url: "/cart_item",
    method: "delete",
    data: {
      product_id: id
    },
    success: function(){
        el.parentElement.parentElement.remove();
    },
    error: function(data){
      alert(data.error);
    }
  });
});
