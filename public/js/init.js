$(document).ready(func() {
  Materialize.updateTextFields();
  $('select').material_select();
  $('input#input_text, textarea#textarea1').characterCounter();
  $(".button-collapse").sideNav();
});
