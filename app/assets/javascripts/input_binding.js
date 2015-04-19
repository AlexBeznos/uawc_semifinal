$(document).on("ready page:load", function() {
  function show_a_form() {
    var type = $("#advertisment_kind").val();

    if(type == "collection"){
      $(".collection").show('fast');
    } else if(type == "advice" || type == "question"){
      $(".advice").show('fast');
    } else if(type == "product"){
      $(".product").show('fast');
    }
  }

  show_a_form();
  $('#advertisment_kind').change(function() {
    $('.collection, .advice, .product').hide();
    show_a_form();
  });

  $('.main-sidebar').height($(document).height());
});
