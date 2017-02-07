<<<<<<< HEAD
$( document ).on('turbolinks:load', function() {
  console.log("Ready");
=======
$(document).ready(function(){
>>>>>>> LaMeraMera
  $('#load').hide();
  loadScreen();
});

function loadScreen(){
  $('#loading').click(function(){
    $('section').hide();
    $('#load').show();
  });
  $('#gen').click(function(){
    $('section').hide();
    $('#load').show();
  });
<<<<<<< HEAD
=======
  $('#loading1').click(function(){
    $('section').hide();
    alert("Cargando , Por favor espere");
    $('#load').show();
  });
>>>>>>> LaMeraMera
}
