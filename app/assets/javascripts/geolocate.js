$(function(){
    var latField = $('#lat_field');
    var longField = $('#long_field');
    var setFormLatLong = function(position){
        latField.val(position.coords.latitude);
        longField.val(position.coords.longitude);
        $('#checkin_submit').prop('disabled', false); // enables button after location is found

        // maybe also add ajax call to find nearby locations
    }

// eventually add note if they don't accept geolocate, that the form requires and to allow and/or make a redirect with a message


    if(latField.length > 0 && longField.length > 0){
        if(navigator.geolocation){
            navigator.geolocation.getCurrentPosition(setFormLatLong);
        }
    }
});