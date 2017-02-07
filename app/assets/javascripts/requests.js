// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.


$( document ).on('turbolinks:load', function() {

  //Iniciamos un nuevo evento en espera de click
  $('#destroy_requests').click(function(){
    //Extraemos todos los datos de Requests
    $.ajax({
      method: 'GET',
      dataType: 'json',
      url: '/requests',
      success: function(data, status){
        //Iteramos todos los registros para posteriormente eliminarlos
        $.each(data, function(index){
          //Eliminamos el dato iterado
          $.ajax({
            method: 'POST',
            url: 'requests/'+data[index].id,
            dataType: 'json',
            data: {'_method':'delete'},
            success: function(){
              if (index == data.length-1){
                setTimeout(function(){
                  window.location.replace("/requests");
                },100);
              }
            }
          });
        });
      }
    });
  });

});
// You can use CoffeeScript in this file: http://coffeescript.org/
