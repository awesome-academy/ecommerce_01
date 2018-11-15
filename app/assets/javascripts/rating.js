$(document).ready(function() {
  var $star_rating = $(".star-rating .far");
  var SetRatingStar = function() {
    return $star_rating.each(function() {
      if (parseInt($star_rating.siblings("input.rating-value").val()) >= parseInt($(this).data("rating"))) {
        return $(this).removeClass("far fa-star").addClass("fas fa-star text-warning");
      } else {
        return $(this).removeClass("fas fa-star text-warning").addClass("far fa-star");
      }
    });
  };

  $star_rating.on("click", function() {
    $star_rating.siblings("input.rating-value").val($(this).data("rating"));
    return SetRatingStar();
  });

  SetRatingStar();
});

$(document).ready(function() {
  var elements = $(".side.right")
  var displayBar = function(){
    elements.each(function(index, el) {
      width_percent = parseInt(parseInt(el.firstElementChild.innerText) / parseInt($("#reviews")[0].value) * 100);
      $(".bar-"+(5-index))[0].style.width = width_percent + "%";
    });
  };

  displayBar();
});

$(document).on("change", ".side.right", function(event) {
  event.preventDefault();
  displayBar();
});
