$(function() {

  var checkinLink = $('.checkin_link');
  checkinLink.hide();

  var setFormLatLong = function(position) {
    var latitude = position.coords.latitude;
    var longitude = position.coords.longitude;

    checkinLink.attr('href', '/checkins/new?latitude=' + position.coords.latitude + '&longitude=' + position.coords.longitude);
    checkinLink.show();
    $('.checkin_searching').hide();
  };

  // eventually add note if they don't accept geolocate, that the form requires and to allow and/or make a redirect with a message

  if (checkinLink.length > 0) {
    if (navigator.geolocation) {
      navigator.geolocation.getCurrentPosition(setFormLatLong);
    }
  }

});
