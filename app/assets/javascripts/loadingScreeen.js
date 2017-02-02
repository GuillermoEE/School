$(document).ready(function(){
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
}
