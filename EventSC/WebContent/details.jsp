<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="utility.Activity" %>
    <%@ page import="java.util.ArrayList" %>
    <%@ page import="utility.Helper" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8"/>
	<meta http-equiv="X-UA-Compatible" content="IE=edge"/>
	<title>EventSC</title>
	<link rel="stylesheet" type="text/css" id="applicationStylesheet" href="DetailStyle.css"/>
	<%  //String parameter=request.getParameter("activityID");
		//int activityID=Integer.parseInt(parameter);
		ArrayList<Activity> temp = Helper.getAllActivities();
		String tempName="";
		String tempDescription="";
		float templat=0;
		float templon=0;
		String tempStart="";
		String tempEnd="";
		for(int i=0;i<temp.size();i++){
			if(true)//ajust it after setup all links which should be (temp.get(i).getActivityID()==activityID)
			{
				tempName=temp.get(i).getTitle();
				tempDescription =temp.get(i).getDescription();
				templat=temp.get(i).getLat();
				templon=temp.get(i).getLon();
				tempStart=temp.get(i).getStartDate()+" "+temp.get(i).getStartTime();
				tempEnd=temp.get(i).getEndDate()+" "+temp.get(i).getEndTime();
				
				break;
			}
		}
	
	%>
	<script>
			
			function on() {
				  document.getElementById("overlay").style.display = "block";
				}

			function off() {
				  document.getElementById("overlay").style.display = "none";
			}
			var map;
		      function initMap() {
		    	  var latitude = 34.02235998929801; 
		          var longitude = -118.28511714935303; 
		          
		    	var myLatlng = {lat: latitude, lng: longitude};
		    	var marker=new google.maps.Marker({
    		        position: new google.maps.LatLng('<%=templat%>', '<%=templon%>'),
    		        map: map
    		      });
		    	
		        map = new google.maps.Map(document.getElementById('map'), {
		          center: myLatlng,
		          zoom: 16
		        });
		
		        google.maps.event.addListener(map,'click', function(event) {
		            off();
		            });
		      }
		</script>
</head>
<body>

<div id="Detail_Page">
	<div id="Group_18">
		<svg class="Rectangle_4">
			
		</svg>
	</div>
	
	<div id="Group_28">
		<svg class="Rectangle_1">
			
		</svg>
		<div id="USCCardinal">
			<img id="UscLogo" src="USCCardinal_A2_Rectangle_25_pattern.png">
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
	<svg class="Rectangle_2">
		
	</svg>
	
	
	<div id="Register">
		<span>Register</span>
	</div>

	<div id="Group_13">
		<img id="Backtomap" src="Group 13@2x.png">
		
	</div>
	<div id="Group_16">
		
		<div id="Group_30">

			<div id="EventIcon">
				<img id="EventPic" src="iconfinder_calendar_1287530_A2_Rectangle_7_pattern.png">
			</div>
			<div id="Event_Name">
				<span><%=tempName %></span>
			</div>
			<div id="DATE__TIME__Location_">
				<span>START: <%=tempStart %><br/>END:<%=tempEnd %><br/>Location:</span>
			</div>
			<div id="Lorem_ipsum_dolor_sit_amet__co">
				<span><%=tempDescription %></span>
			</div>
			<div id="Initiator_">
				<span style="">Initiator</span>
			</div>
			<div id="Interested">
				<span>Interested</span>
			</div>
			<div id="initiatorPic">
				<img id="initiatorProfile" src="iconfinder_JD-04_2625523.png" width="100%" height="100%">
			</div>
			<div id="User1Pic">
				<img id="User1Profile" src="iconfinder_JD_06_2625478_A3_Rectangle_15_pattern.png" width="100%" height="100%">
			</div>
			<div id="User2Pic">
				<img id="User2Profile" src="iconfinder_JD_08_2625520_A3_Rectangle_17_pattern.png" width="100%" height="100%">
			</div>
			<div id="User3Pic">
				<img id="User3profile" src="iconfinder_JD-09_2625479.png" width="100%" height="100%">
			</div>
			
		</div>
	</div>
	<div id="map_button"><img src='img/map_icon.png' alt='GoogleIcon.png' id='google' onclick='on()'></div>
</div>
<div id="overlay">
			<div id="map"></div>
		</div>
<script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyCB_WPm3Y2eL3aSvs64KYGkDoQ_F4RYatE&language=en&callback=initMap"
    async defer></script>
</body>
</html>