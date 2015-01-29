$(function(){
  // I AM GOING TO ADAPT THIS FOR PASSING LOCATON ID TO SAVE FOR NEW EVENT
  // Hide #newLocation div on page load
  //$( "#newLocation" ).hide();

  // Capture Checkinable id/type when existing value selected
  $( ".nearby-location" ).click(function() {
      $( "#c_id" ).val( $(this).data("id") );
      $( "#c_type" ).val( $(this).data("type") );
  });

  // Show #newLocation div when needed
  $( "#noneOfTheAbove" ).click(function() {
    $( "#newLocation" ).toggle('slow');
    $( "#c_type" ).val( "new" );
  });


});