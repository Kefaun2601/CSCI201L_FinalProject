<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="utility.Activity" %>
    <%@ page import="utility.Coordinate" %>
    <%@ page import="utility.Helper" %>
    <%@ page import="java.util.ArrayList" %>
    <%@ page import="java.util.HashMap" %>
    <%@ page import="java.util.Iterator" %>
    <%@ page import="java.util.Map" %>
<!DOCTYPE html>
<html>
	<head>
	<meta charset="UTF-8"/>
	<title>EventSC</title>
	<link rel="stylesheet" type="text/css" id="applicationStylesheet" href="MapStyle.css"/>
	<style>
      /* Always set the map height explicitly to define the size of the div
       * element that contains the map. */
      #map {
        height: 100%;
        width: 100%;
		display: block;
		position: absolute;
		overflow: visible;
		width: 65%;
		height: 63%;
		left: 17%;
		top: 33%;
		margin-bottom: 5%;
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
    	  
    	  var map = new google.maps.Map(document.getElementById('map'), {
    	      zoom:15.5,
    	      center: new google.maps.LatLng(34.02235998929801, -118.28511714935303)
    	    });

       	var marker, i;
    	  
     	
    <%
    	HashMap<Integer, Coordinate> locations = Helper.getLocations();
    	
    	Iterator<Map.Entry<Integer, Coordinate>> it = locations.entrySet().iterator();
    	while (it.hasNext()) {  
    		Map.Entry<Integer, Coordinate> entry = (Map.Entry<Integer, Coordinate>)it.next();
			Activity activity = Helper.getActivityByID(entry.getKey());%>
    		
    		var marker, k;
   	    	marker = new google.maps.Marker({
   		        position: new google.maps.LatLng(<%= activity.getLat() %>, <%= activity.getLon() %>),
   		        map: map,
   		        url: 'details.jsp?activityID=' + <%= activity.getActivityID() %>
   		      });

   	     	var infowindow = new google.maps.InfoWindow({
   	     		content: "<b> " + <%= activity.getTitle() %> + "</b><br/>"
        		  +"Start: " + <%= activity.getStartDate() %> + " " + <%= activity.getStartTime() %> + "<br/>"
        		  +"End: " + <%= activity.getEndDate() %> + " " + <%= activity.getEndTime() %> + "<br/>"
        		  +"Description: " + <%= activity.getDescription() %>,
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
   		    	    window.location.href = this.url;
   		    	  }
   		    	 })(marker, k));
    	<%}%> 
	 
    }
    
    
    </script>
	</head>
<body>

	<div id="Map">
		<!-- header and background -->	
		<div id="Group_18">
			<svg class="Rectangle_4">
				<rect id="Rectangle_4" rx="0" ry="0" x="0" y="0" width="1920" height="955">
				</rect>
			</svg>
		</div>
		
		<div id="Group_28">
			<svg class="Rectangle_1">
				
			</svg>
			<div id="USCCardinal">
				<a href="index.jsp"><img id="UscLogo" src="img/USC_logo.png"></a>
			</div>
		</div>
		<div id="EventSc">
			<a href="index.jsp"><span style="color:white;">Event</span><span style="color:rgba(246,190,52,1);">SC</span></a>
		</div>
		<svg class="Rectangle_2">
		</svg>
		<div id="Login">
			<span><a href="login.jsp" style="color: rgba(248,240,240,1);">Login</a></span>
		</div>
		
		<div id="Group_7">
			<a href="newevent.jsp"><img id="NewEvent" src="img/new_event_button.png"></a>
		</div>
		
		<div id="Register">
			<span><a href="register.jsp" style="color: rgba(248,240,240,1);">Register</a></span>
		</div>
		
		<div id="Group_9">
			<a href="list.jsp"><img id="ListView" src="img/list_view_button.png"></a>
		</div>
		<!-- header and background end -->
		<div id="GoogleMap">
			<div id="map"></div>
		</div>
	</div>
	
	
    <script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyCB_WPm3Y2eL3aSvs64KYGkDoQ_F4RYatE&language=en&callback=initMap"
    async defer></script>
</body>
</html>