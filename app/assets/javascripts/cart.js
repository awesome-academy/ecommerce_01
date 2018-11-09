$(document).on("change", ".quantity-in-cart", function(event) {
  event.preventDefault();
  let element = event.target
    $.ajax({
        url: "/cart",
        method: "put",
        data: {
          product_id: element.offsetParent.id,
          quantity: element.value
      }
    });
});

$(document).on("click", ".btn-remove", function(event) {
  event.preventDefault();
  let el = event.target;
  var id = el.parentElement.previousElementSibling.previousElementSibling.id;
  $.ajax({
    url: "/cart",
    method: "delete",
    data: {
      product_id: id
    },
    success: function(){
        el.parentElement.parentElement.remove();
        location.reload();
    }
  });
});
