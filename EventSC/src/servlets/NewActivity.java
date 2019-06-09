package servlets;

import java.io.IOException;
import java.util.ArrayList;
import java.util.concurrent.ThreadLocalRandom;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import utility.DBConnection;

@WebServlet("/NewActivity")
public class NewActivity extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	private static ArrayList<String> profileImagePaths = new ArrayList<String>() {
		{
			add("img/event_icon1.png");
			add("img/event_icon2.png");
			add("img/event_icon3.png");
			add("img/event_icon4.png");
			add("img/event_icon5.png");
			add("img/event_icon6.png");
			add("img/event_icon7.png");
		}
	};
	
	public static int randomInt(int min, int max) {
		// min and max are inclusive
		return ThreadLocalRandom.current().nextInt(min, max + 1);
	}

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int userID = Integer.parseInt(request.getParameter("userID"));
		String title = request.getParameter("title");
		String description = request.getParameter("description");
		float lat = Float.parseFloat(request.getParameter("lat"));
		float lon = Float.parseFloat(request.getParameter("lon"));
		String startDate = request.getParameter("startDate");
		String startTime = request.getParameter("startTime");
		String endDate = request.getParameter("endDate");
		String endTime = request.getParameter("endTime");
		
		String randomImage = profileImagePaths.get(randomInt(0, profileImagePaths.size()-1));
		
		DBConnection db = new DBConnection();
		db.getConnection();
		
		String query = "INSERT INTO Activities (userID, ";
		if (title != null) query += "title, ";
		if (description != null) query += "description, ";
		query += "lat, lon, ";
		if (startDate != null) query += "startDate, ";
		if (startTime != null) query += "startTime, ";
		if (endDate != null) query += "endDate, ";
		if (endTime != null) query += "endTime, ";
		query += "picture, ";
		query = query.substring(0, query.length()-2);
		
		query += ") VALUES (" + userID + ", ";
		if (title != null) query += "\"" + title + "\", ";
		if (description != null) query += "\"" + description + "\", ";
		query += lat + ", " + lon + ", ";
		if (startDate != null) query += "\"" + startDate + "\", ";
		if (startTime != null) query += "\"" + startTime + "\", ";
		if (endDate != null) query += "\"" + endDate + "\", ";
		if (endTime != null) query += "\"" + endTime + "\", ";
		query += "\"" + randomImage + "\", ";
		query = query.substring(0, query.length()-2);
		query += ");";
		
		db.executeUpdate(query);
	}

}
