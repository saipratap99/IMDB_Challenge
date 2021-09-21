// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

require("@rails/ujs").start()
require("turbolinks").start()
require("@rails/activestorage").start()
require("channels")


// Uncomment to copy all static images under ../images to the output folder and reference
// them with the image_pack_tag helper in views (e.g <%= image_pack_tag 'rails.png' %>)
// or the `imagePath` JavaScript helper below.
//
// const images = require.context('../images', true)
// const imagePath = (name) => images(name, true)

$(document).ready(function () {
  // alert("hello");
  let search_box = $('#search-bar');

  search_box.keyup(function(){
    console.log($(this).val());
    $.ajax({
      type: "GET",
      url: "/search",
      data: {query: $(this).val()},
      success: ()=>{console.log("Success");},
      error: ()=>{console.log("Error!");}
    });
  });

  $('.close-btn').click(()=>{
    $(".query-res").empty();
    $("#search-res").css("display","none");
  });


});
