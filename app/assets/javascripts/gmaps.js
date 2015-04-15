var drawMap = function(mapOptions) {
  var handler = Gmaps.build('Google');
  handler.buildMap({
   provider: {
    zoom: mapOptions.zoom,
    scrollwheel: false
  },
  internal: {id: 'map'}}, function() {
    markers = handler.addMarkers(mapOptions.markers,
      {animation: google.maps.Animation.DROP}
      );
    markers2 = handler.addMarkers(mapOptions.markers,
      {animation: google.maps.Animation.DROP}
      );

    // dont need the below 2 lines as I am forcing the map to center on Seattle, line 14
    //handler.bounds.extendWith(markers);
    //handler.fitMapToBounds();
    handler.map.centerOn({lat: mapOptions.center[0], lng: mapOptions.center[1]});
  });

}
