<%@ page import="java.util.ArrayList" %>
<%@ page import="utility.Helper" %>
<%@ page import="utility.Activity" %>
<%@ page import="java.util.Comparator" %>
<%@ page import="java.util.Collections" %>

<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8"/>
	<meta http-equiv="X-UA-Compatible" content="IE=edge"/>
	<title>EventSC</title>
	<link rel="stylesheet" type="text/css" id="applicationStylesheet" href="ListViewStyle.css"/>
</head>
<body>

	<%! // comparator functions
	private static class NameComp implements Comparator<Integer>{
		public int compare(Integer one, Integer two) {
			Activity aOne = Helper.getActivityByID(one);
			Activity aTwo = Helper.getActivityByID(two);
			if (aOne.getTitle().compareTo(aTwo.getTitle()) > 0) {
				return 1;
			} else if (aOne.getTitle().compareTo(aTwo.getTitle()) < 0) {
				return -1;
			}
			else {
				return 0;
			}
		}
	}
	private static class DateComp implements Comparator<Integer>{
		public int compare(Integer one, Integer two) {
			Activity aOne = Helper.getActivityByID(one);
			Activity aTwo = Helper.getActivityByID(two);
			String aOneStr = aOne.getStartDate() + " " + aOne.getStartTime();
			String aTwoStr = aTwo.getStartDate() + " " + aTwo.getStartTime();
			if (aOneStr.compareTo(aTwoStr) > 0) {
				return 1;
			} else if (aOneStr.compareTo(aTwoStr) < 0) {
				return -1;
			}
			else {
				return 0;
			}
		}
	}
	%>

	<%
	int userID = -1;
	if (session.getAttribute("userID") != null) {
		String userIDStr = "" + session.getAttribute("userID");
		if (userIDStr != null && !userIDStr.trim().equals("")) {
			userID = Integer.parseInt(userIDStr.trim());
		}
	}
	
	
	%>
	<table id ="list" cellspacing="12px">
		<tbody>
			<%
			ArrayList<Integer> ids = Helper.getActivityIDs();
			
			String sortCriteria = request.getParameter("sort");
			if (sortCriteria != null && sortCriteria.trim().length() > 0) {
				sortCriteria = sortCriteria.trim().toLowerCase();
				if (sortCriteria.equals("namecomp")) Collections.sort(ids, new NameComp());
				else if (sortCriteria.equals("datecomp")) Collections.sort(ids, new DateComp());
			}
			else {
				Collections.sort(ids, new NameComp());
			}
			
			for (int i = 0; i < ids.size(); i++) {
				Activity activity = Helper.getActivityByID(ids.get(i));
			%>
			<tr class="row">
				<td class="icon">
					<img src="<%= activity.getPicture() %>">
					<span class="EventName"><a href="details.jsp?activityID=<%= activity.getActivityID() %>" style="color: rgba(100,95,95,1);"><%= activity.getTitle() %></a></span> <br>
					<span class="info">
										Start: <%= activity.getStartDate() + " " + activity.getStartTime() %><br/>
								</span>
					<span class="info">
										End: <%= activity.getEndDate() + " " + activity.getEndTime() %><br/>
								</span>
					<span class="info">
										Description: <%= (activity.getDescription().length() > 60) ? activity.getDescription().substring(0,60) + "..." : activity.getDescription() %><br/>
								</span>
				</td>
			</tr>
			<% } %>
		</tbody>
	</table>

	<div id="List_View">
	
		<div id="Group_18">
			<svg class="Rectangle_4">
				<rect id="Rectangle_4" rx="0" ry="0" x="0" y="0" width="1920" height="955">
				</rect>
			</svg>
		</div>
	
		<svg class="Rectangle_7">
		</svg>
	
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
		
		<% 
			if(userID != -1){
		%>
			<div id="Login">
				<span><a href="profile.jsp" style="color: rgba(248,240,240,1);">Profile</a></span>
			</div> 
			
			<div id="Register">
				<span><a href="index.jsp" id="signout" style="color: rgba(248,240,240,1);">Logout</a></span>
			</div>
		<%		
			}
			else if(userID == -1){
		%>
			<div id="Login">
				<span><a href="login.jsp" style="color: rgba(248,240,240,1);">Login</a></span>
			</div>
			<div id="Register">
				<span><a href="register.jsp" style="color: rgba(248,240,240,1);">Register</a></span>
			</div>
		<% 
			}
		%>
		
	
		<div id="Group_7">
			<a href="newevent.jsp"><img id="NewEvent" src="img/new_event_button.png"></a>
		</div>
		<div id="Group_9">
			<a href="index.jsp"><img id="Map" src="img/map_view_button.png"></a>
		</div>
		<div id="Group_12">
			<% if(sortCriteria != null && sortCriteria.trim().length() > 0 && sortCriteria.toLowerCase().equals("datecomp")) { %>
				<a href="list.jsp?sort=namecomp"><img id="Filter_Name" src="img/sortByName.png"></a>
			<% } else { %>
				<a href="list.jsp?sort=datecomp"><img id="Filter_Date" src="img/SortByTime.png"></a>
			<% } %>
		</div>
	</div>
	
	
	<script>
		document.getElementById("signout").onclick = function(event) {
		    event.preventDefault();
		    
		    var xhttp = new XMLHttpRequest();
			xhttp.open("GET", "Logout", false);
			xhttp.send();
		    
		    window.location = "index.jsp";
		};
	</script>
	
</body>
</html>