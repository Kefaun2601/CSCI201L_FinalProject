<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="runshigu_FInalProject.Activity" %>
    <%@ page import="java.util.ArrayList" %>
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
        height: 90%;
      }
      /* Optional: Makes the sample page fill the window. */
      html, body {
        height: 100%;
        margin: 0;
        padding: 0;
      }
      #content{
  		width:300px;    
      }
      
    </style>
    
    

    <script>
    
    function initMap() {
    	  var myLatlng = {lat: -25.363, lng: 131.044};
    	  
    	  var map = new google.maps.Map(document.getElementById('map'), {
    	      zoom:16,
    	      center: new google.maps.LatLng(34.02235998929801, -118.28511714935303)
    	    });

    	  var locations = [
     	      ['Bondi Beach', -33.890542, 151.274856, 4],
     	      ['Coogee Beach', -33.923036, 151.259052, 5],
     	      ['Cronulla Beach', -34.028249, 151.157507, 3],
     	      ['Manly Beach', -33.80010128657071, 151.28747820854187, 2],
     	      ['Maroubra Beach', -33.950198, 151.259302, 1]
     	    ];
       	var marker, i;
    	  
       	
    	  /*
    	  those are not useful code
    	  	var infowindow = new google.maps.InfoWindow({
  			content: '<a href="/businesses/' + business.id + '">' + business.business_name + '</a><br/>' + 'Phone: ' + business.phone
			});
    	  
    	  object.onclick = function(){myScript};//for link in the content
    	  
    	  */
    	  
     	   
     	
    <%ArrayList<Activity> temp = Activity.getter();//do something to adjust for the getter
    	int count=temp.size();
    	for (int i = 0; i < count; i++) {  
			String tempName=temp.get(i).getTitle();
			String tempDescription =temp.get(i).getDescription();
			float templat=temp.get(i).getLat();
			float templon=temp.get(i).getLon();
			String tempStart=temp.get(i).getStartDate()+" "+temp.get(i).getStartTime();
			String tempEnd=temp.get(i).getEndDate()+" "+temp.get(i).getEndTime();%>
    		
    		var marker,k;
    	    	marker = new google.maps.Marker({
    		        position: new google.maps.LatLng('<%=templat%>', '<%=templon%>'),
    		        map: map,
    		        //url: ''
    		      });

    	     	var infowindow = new google.maps.InfoWindow({
    	     		content: "<b> "+'<%=tempName%>'+"</b><br/>"
	        		  +"StartTime: "+'<%=tempStart%>'+"<br/>"
	        		  +"EndTime: "+'<%=tempEnd%>'+"<br/>"
	        		  +"Description: "+'<%=tempDescription%>',
	        		  maxWidth: 400
    	     	});
    	     	
    		      google.maps.event.addListener(marker, 'click', (function(marker,k) {
    		        return function() {
    		          infowindow.open(map, marker);
    		        }
    		      })(marker, k));
    		      
    		      google.maps.event.addListener(marker,'dblclick', (function(marker,k) {
    		    	  return function(){
    		    	    map.setZoom(15);
    		    	    map.setCenter(marker.getPosition());
    		    	    //window.location.href = this.url;
    		    	  }
    		    	 })(marker, k));
    	<%}%> 
	 
    }
    
    
    </script>
  </head>
  <body>
    <div id="map"></div>
    <script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyCB_WPm3Y2eL3aSvs64KYGkDoQ_F4RYatE&callback=initMap"
    async defer></script>
  </body>
</html>