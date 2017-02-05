// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.

$( document ).on('turbolinks:load', function() {

  //Iniciamos un nuevo evento en espera de click
  $('#destroy_groups').click(function(){
    clearModel("accepteds", "grupos");
  });//End of click event

});

function clearModel(model, redirect){

  console.log("Starting clear for "+model);

  //Extraemos todos los datos del modelo
  $.ajax({
    method: 'GET',
    dataType: 'json',
    url: '/'+model,
    success: function(data, status){

      console.log(model+" status: "+status);

      //Iteramos todos los registros para posteriormente eliminarlos
      $.each(data, function(index){

        //Eliminamos el dato iterado
        $.ajax({
          method: 'POST',
          url: model+'/'+data[index].id,
          dataType: 'json',
          data: {'_method':'delete'},
          success: function(){

            if (index == data.length-1){
              setTimeout(function(){
                if (redirect.length > 0){
                  window.location.replace("/"+redirect);
                }
                console.log("Modelo "+model+" ha sido vaciado");
              },100);
            }//Redirecting
          }//Succes on deleting

        });//Deletting data
      });//Iterating requested Data

    }//success on the get method

  });//Ajax get method
}
