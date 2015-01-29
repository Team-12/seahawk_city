var latitude, longitude

$(function(){
    var latField = $('#lat_field');
    var longField = $('#long_field');
    var checkin_link = $("#checkin_link")

    var setFormLatLong = function(position){
        latitude = position.coords.latitude
        longitude = position.coords.longitude
        console.log(position.coords);
        if(latField.length > 0 && longField.length > 0){
            latField.val(latitude);
            longField.val(longitude);
        }
        $("#checkin_link").attr("href", "/checkins/new?latitude="+position.coords.latitude + "&longitude=" + position.coords.longitude)
        // $('#checkin_submit').prop('disabled', false); // enables button after location is found

        // maybe also add ajax call to find nearby locations
    }

// eventually add note if they don't accept geolocate, that the form requires and to allow and/or make a redirect with a message


    // if(latField.length > 0 && longField.length > 0){
        if(navigator.geolocation){
            navigator.geolocation.getCurrentPosition(setFormLatLong);
        }
    // }
});