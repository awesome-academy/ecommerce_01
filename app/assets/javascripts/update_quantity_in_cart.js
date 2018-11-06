$(".quantity-in-cart").ready(function($){
  $(this).on("change",function(event){
    element = event.target
    $.ajax({
      url: "/cart",
      method: "put",
      data: {
        product_id: element.offsetParent.id,
        quantity: element.value
      }
    });
  });
});
