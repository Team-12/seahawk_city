
$(function(){
    var checkin_link = $(".checkin_link")
    checkin_link.hide();

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
        var latitude = position.coords.latitude
        var longitude = position.coords.longitude

        checkin_link.attr("href", "/checkins/new?latitude="+position.coords.latitude + "&longitude=" + position.coords.longitude);
        checkin_link.show();
        $('.checkin_searching').hide();
    }

// eventually add note if they don't accept geolocate, that the form requires and to allow and/or make a redirect with a message


    if(checkin_link.length > 0){
        if(navigator.geolocation){
            navigator.geolocation.getCurrentPosition(setFormLatLong);
        }
    }
});