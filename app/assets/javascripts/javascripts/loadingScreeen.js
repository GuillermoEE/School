$(document).ready(function(){
  $('#load').hide();
  loadScreen();
});

function loadScreen(){
  $('#importar ').click(function(){
    $('section').hide();
    $('#load').show();
  });
}
