<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Home_Page</title>
		<style>
			body,html {
				height: 100%;
				margin:0;
			}
			#google{
				position:fixed;
				top:545px;
				left:1150px;
				height:50px;
				width:50px;
				border-radius:8px;
			}
			#map {
		      	postion: relative;
		      	left:12.5%;
		      	top:25%;
		      	width: 75%;
		        height: 75%;
		      }
			div, label {
			  font-family: Avenir Next; 
			}
			
			.background{
				background-color:black;
			}
			#search{
				position: fixed;
			}
			::placeholder{
				color: lightgrey;
			}
			.searchbox{
			background-color:grey;
			opacity:0.7;
			border: 1px solid white;
			height: 55px;
			font-family: AvenirNext-Italic;
			font-size: 30px;
			padding-right:75px;
			padding-left:10px;
			}
			
			#overlay {
				  position: fixed;
				  display: none;
				  width: 100%;
				  height: 100%;
				  top: 0;
				  left: 0;
				  right: 0;
				  bottom: 0;
				  background-color: rgba(0,0,0,0.5);
				  z-index: 2;
				  cursor: pointer;
				}
		</style>
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
		    	
		        map = new google.maps.Map(document.getElementById('map'), {
		          center: myLatlng,
		          zoom: 16
		        });
		
		        google.maps.event.addListener(map,'click', function(event) {
		        	document.getElementById('latitude').value = event.latLng.lat();
		            document.getElementById('longitude').value =  event.latLng.lng();
		            });
		      }
		</script>
	</head>
	<body class="background">
		
		<div id="overlay" onclick="off()">
			<div id="map"></div>
		</div>
		
		<div id="map_button"><button id='google' onclick='on()'></button></div>
		<form  action="searchName"style="position: absolute;top:540px;left:580px; color: white;" method="GET">
			<div id="search">
				<input type='text' class='searchbox'name='latitude' id='latitude'placeholder='Latitude'style='width:170px;margin-right: 15px'> 
				<input type='text' class='searchbox' id='longitude' name='longitude' placeholder='Longitude'style='width:170px;'> 
			</div>
		</form>
		
		
	    <script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyCB_WPm3Y2eL3aSvs64KYGkDoQ_F4RYatE&callback=initMap"
	    async defer></script>
	</body>
</html>