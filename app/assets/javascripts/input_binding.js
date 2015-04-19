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

  $('.textarea').wysihtml5({
      "font-styles": true, //Font styling, e.g. h1, h2, etc. Default true
      "emphasis": true, //Italics, bold, etc. Default true
      "lists": true, //(Un)ordered lists, e.g. Bullets, Numbers. Default true
      "html": false, //Button which allows you to edit the generated HTML. Default false
      "link": true, //Button to insert a link. Default true
      "image": true, //Button to insert an image. Default true,
      "color": true, //Button to change color of font
      "blockquote": true //Blockquote
  });
});
