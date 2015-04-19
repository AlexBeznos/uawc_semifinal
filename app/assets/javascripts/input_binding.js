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

$(document).on('page:load', function(){
  window['rangy'].initialized = false;
});

$(document).ready(function() {
  $('.textarea').wysihtml5({
    toolbar: {
      "font-styles": true, // Font styling, e.g. h1, h2, etc.
      "emphasis": true, // Italics, bold, etc.
      "lists": true, // (Un)ordered lists, e.g. Bullets, Numbers.
      "html": true, // Button which allows you to edit the generated HTML.
      "link": true, // Button to insert a link.
      "image": true, // Button to insert an image.
      "color": false, // Button to change color of font
      "blockquote": true // Blockquote
    }
  });
});
