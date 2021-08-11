// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

require("@rails/ujs").start()
require("turbolinks").start()
require("@rails/activestorage").start()
require("channels")
require("jquery")
import "bootstrap"

// Uncomment to copy all static images under ../images to the output folder and reference
// them with the image_pack_tag helper in views (e.g <%= image_pack_tag 'rails.png' %>)
// or the `imagePath` JavaScript helper below.
//
// const images = require.context('../images', true)
// const imagePath = (name) => images(name, true)

$(function(){
  $("#meat1").on("click",function(){
  $("#goal").val("web");
  $("#step_1").val("HTML");
  $("#step_2").val("CSS");
  $("#step_3").val("JavaScript");
  $("#step_4").val("Ruby");
  $("#step_5").val("PHP");
  $("#step_6").val("Git");
});
  $("#meat2").on("click",function(){
  $("#goal").val("system");
  $("#step_1").val("基本情報技術者");
  $("#step_2").val("Java Level 1");
  $("#step_3").val("Git");
  $("#step_4").val("SQL");
  $("#step_5").val("Java Level 2");
  $("#step_6").val("Java Level 3");
});
  $("#meat3").on("click",function(){
  $("#goal").val("IT基礎");
  $("#step_1").val("ITパスポート");
  $("#step_2").val("基本情報技術者");
  $("#step_3").val("Linux");
  $("#step_4").val("AWS");
  $("#step_5").val("Git");
  $("#step_6").val("Java基礎");
});

});
