package utility;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

public class Helper {
	
	// Database Connection Username
	private static final String dbusername = DBCredentials.getUsername();
	// Database Connection Password
	private static final String dbpassword = DBCredentials.getPassword();

	/*
	 *  returns an arraylist of activity objects
	 */
	public static ArrayList<Activity> getAllActivities()
	{
		//ArrayList
		ArrayList<Activity> activities = new ArrayList<Activity>();
		
		//Database variables
		Connection conn = null;
		Statement st = null;
		ResultSet rs = null;
		
		try 
		{
			// With driver version 8: com.mysql.cj.jdbc.Driver
			// With driver version 5: com.mysql.jdbc.Driver
			Class.forName("com.mysql.jdbc.Driver");
			
			//Establishes connection with database
			conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/CSCI201L_FinalProject?user="
												+ dbusername + "&password=" + dbpassword);
			
			//Creates an SQL Query
			st = conn.createStatement();
			rs = st.executeQuery("SELECT * FROM Activities;");
			
			//Loops over result set from query
			while(rs.next())
			{
				//Row data parsed into variables
				int activityID = rs.getInt("activityID");
				int userID = rs.getInt("userID");
				String title = rs.getString("title");
				String description = rs.getString("description");
				float lat = rs.getFloat("lat");
				float lon = rs.getFloat("lon");
				String startDate = rs.getString("startDate");
				String startTime = rs.getString("startTime");
				String endDate = rs.getString("endDate");
				String endTime = rs.getString("endTime");
				String timeCreated = rs.getString("timeCreated");
				String picture = rs.getString("picture");
				
				//New Activity object created with row data
				Activity activity = new Activity(activityID, userID, title, description, 
						lat, lon, startDate, startTime, endDate, endTime, timeCreated, picture);
				
				//Added to ArrayList of Activities
				activities.add(activity);
			}
			
		} catch (SQLException sqle)
		{
			System.out.println("sqle: " + sqle.getMessage());
		} catch (ClassNotFoundException cnfe)
		{
			System.out.println("cnfe: " + cnfe.getMessage());
		}
		
		return activities;
	}
	
}
