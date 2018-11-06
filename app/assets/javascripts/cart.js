$(document).ready(function($){

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

  $(".btn-remove").ready(function($) {
    $(".btn-remove").on("click", function(event){
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
  });
});


