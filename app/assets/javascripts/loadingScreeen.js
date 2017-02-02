$(document).ready(function(){
  $('#load').hide();
  loadScreen();
});

function loadScreen(){
  $('#loading').click(function(){
    $('#request_section').hide();
    $('#load').show();
  });
}
