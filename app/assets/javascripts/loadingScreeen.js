$( document ).on('turbolinks:load', function() {
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
    $('section').hide();
    $('#load').show();
  });
}
