<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@page import="runshigu_FInalProject.Event" %>
    <%@ page import="java.util.Vector" %>
<!DOCTYPE html>
<html>
  <head>
    <title>Maps</title>
    <meta name="viewport" content="initial-scale=1.0">
    <meta charset="utf-8">
    <style>
      /* Always set the map height explicitly to define the size of the div
       * element that contains the map. */
      #map {
        height: 100%;
      }
      /* Optional: Makes the sample page fill the window. */
      html, body {
        height: 100%;
        margin: 0;
        padding: 0;
      }
    </style>
    
    
    <% Vector<Event> temp=Event.getter();%>
    <script>
    function initMap() {
    	  var myLatlng = {lat: -25.363, lng: 131.044};
    	  
			//var vec=Packages.runshigu_FInalProject.Event.getter();
    	  
    	  
    	  var map = new google.maps.Map(document.getElementById('map'), {
    	      zoom: 10,
    	      center: new google.maps.LatLng(-33.92, 151.25)
    	    });

    	  var locations = [
     	      ['Bondi Beach', -33.890542, 151.274856, 4],
     	      ['Coogee Beach', -33.923036, 151.259052, 5],
     	      ['Cronulla Beach', -34.028249, 151.157507, 3],
     	      ['Manly Beach', -33.80010128657071, 151.28747820854187, 2],
     	      ['Maroubra Beach', -33.950198, 151.259302, 1]
     	    ];
       	var marker, i;
    	  
       	/*marker = new google.maps.Marker({
    	    position: new google.maps.LatLng(event.lat,event.lon),
    	    map: map,
    	    title: 'Click to zoom'
    	  });
    	  /*
    	  	var infowindow = new google.maps.InfoWindow({
  			content: '<a href="/businesses/' + business.id + '">' + business.business_name + '</a><br/>' + 'Phone: ' + business.phone
			});
    	  
    	  object.onclick = function(){myScript};//for link in the content
    	  
    	  */
    	  
     	   
     	var infowindow = new google.maps.InfoWindow();
     	  
    	for (i = 0; i < locations.length; i++) {  
    	      marker = new google.maps.Marker({
    	        position: new google.maps.LatLng(locations[i][1], locations[i][2]),
    	        map: map
    	      });

    	      google.maps.event.addListener(marker, 'click', (function(marker, i) {
    	        return function() {
    	          infowindow.setContent(locations[i][0]);
    	          infowindow.open(map, marker);
    	        }
    	      })(marker, i));
    	    }

    	  map.addListener('center_changed', function() {
    	    // 3 seconds after the center of the map has changed, pan back to the
    	    // marker.
    	    window.setTimeout(function() {
    	      map.panTo(marker.getPosition());
    	    }, 3000);
    	  });

    	  marker.addListener('dblclick', function() {
    	    map.setZoom(15);
    	    map.setCenter(marker.getPosition());
    	  });
    	  
    	}
    
    
    </script>
  </head>
  <body>
    <div id="map"></div>
    
    <script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyCB_WPm3Y2eL3aSvs64KYGkDoQ_F4RYatE&callback=initMap"
    async defer></script>
  </body>
</html>