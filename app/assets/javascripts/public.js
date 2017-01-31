// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.

$( document ).on('turbolinks:load', function() {

  //Calculamos los grupos posibles (Exactamente de la misma forma que en public_controller.rb)

  //Ejecutamos un metodo GET con AJAX
  var groups = $.ajax({
    method: 'GET',
    dataType: 'json',
    url: '/specialities',
    success: function(data, status){//El parametro data tiene un array con todos los registros de /specialities

      //Este array contiene todos los grupos posibles
      var groups = [];

      //Calculamos todos los grupos posibles
      $.each(data, function(index){
        //Grupos de la mañana
        if(data[index].morningTurn){
          var i;
          for(i = 1; i <= data[index].morningClasses; i++){
            groups.push({speciality: data[index].name, turn: 'M', group: i});//Agregamos el grupo al array
          }//end of the for cycle
        }//end of if o.morningTurn condition

        //Grupos en la tarde
        if(data[index].eveningTurn){
          var i;
          for(i = 1; i <= data[index].eveningClasses; i++){
            groups.push({speciality: data[index].name, turn: 'V', group: i});//Agregamos el grupo al array
          }//end of the for cycle
        }//end of if o.morningTurn condition

      });//end of the jQuery.each method

      var i;
      for (i = 1; i <= groups.length; i++) {
        $('#select_group_'+i).click(function(event){

          $('#list_m').slideUp(400);
          $('#list_v').slideUp(400);
          setTimeout(function(){
            $('#group_'+event.currentTarget.id.slice(13)).slideDown(400);
          }, 600);

        });//end of click method
        //console.log("Click event created for the group with id group_"+i+" in button with id select_group_"+i);
      }//end of the for cycle

    }//end of the success' function
  });//end of ajax method

  $('#ver_matutino').click(function(){
    $('#list_v').slideUp(400);
    $('.group').slideUp(400);
    setTimeout(function(){
      $('#list_m').slideDown(400);
    }, 600);
  });//end of click method

  $('#ver_vespertino').click(function(){
    $('#list_m').slideUp(400);
    $('.group').slideUp(400);
    setTimeout(function(){
      $('#list_v').slideDown(400);
    }, 600);
  });//end of click method

});//end of jQuery ready function
