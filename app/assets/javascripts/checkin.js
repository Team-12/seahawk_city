$(function(){
  
  // Hide #newLocation div on page load
  $( "#newLocation" ).hide();

  // Show #newLocation div when needed
  $( "#noneOfTheAbove" ).click(function() {
    $( "#newLocation" ).toggle('slow');
  });

  // Capture Checkinable id/type when existing value selected
  $( ".nearby-location" ).click(function() {
      $( "#c_id" ).val( $(this).data("id") );
      $( "#c_type" ).val( $(this).data("type") );
  });

});