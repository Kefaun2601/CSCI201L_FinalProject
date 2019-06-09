<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="utility.Activity" %>
    <%@ page import="java.util.ArrayList" %>
    <%@ page import="utility.Helper" %>
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
    	ArrayList<Activity> temp = Helper.getAllActivities();
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
    		        url: 'details.jsp?activityID='+'<%=temp.get(i).getActivityID()%>'
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
			<img id="UscLogo" src="USCCardinal.png">
		</div>
	</div>
	<div id="EventSc">
		<span style="">Event</span><span style="color:rgba(246,190,52,1);">SC</span>
	</div>
	<svg class="Rectangle_2">
	</svg>
	<div id="Login">
		<span>Login</span>
	</div>
	
	<div id="Group_7">
		<img id="NewEvent" src="new_event.png">
		
	</div>
	<div id="Group_9">
		<img id="Filter" src="filter.png">
		
	</div>
	<div id="Register">
		<span>Register</span>
	</div>
	<div id="Group_12">
		<img id="ListView" src="list_view.png">
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