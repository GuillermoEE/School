
$(document).on("turbolinks:load", function(){
  console.log("Ready");

  $('#load').hide();
  loadScreen();
});

function loadScreen(){
  $('#loading').click(function(){
    $('section').hide();
    $('#load').show();
  });
  $('#gen').click(function(){
    
    $('#actionsBox').hide();
    $('#load').show();
  });

  $('#loading1').click(function(){
  $('section').hide();
    alert("Cargando , Por favor espere");
    $('#load').show();
});

}
