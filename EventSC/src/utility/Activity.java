package utility;

public class Activity {
	private int activityID;
	private int userID;
	private String title;
	private String description;
	private float lat;
	private float lon;
	private String startDate;
	private String startTime;
	private String endDate;
	private String endTime;
	private String timeCreated;
	private String picture;
	
	public Activity(int a, int u, String t, String d, float lt, float ln, 
					String sd, String st, String ed, String et, String tc, String p)
	{
		activityID = a;
		userID = u;
		title = t;
		description = d;
		lat = lt;
		lon = ln;
		startDate = sd;
		startTime = st;
		endDate = ed;
		endTime = et;
		timeCreated = tc;
		picture = p;
	}
	
	public int getActivityID()
	{
		return activityID;
	}
	public int getUserID()
	{
		return userID;
	}
	public String getTitle()
	{
		return title;
	}
	public String getDescription()
	{
		return description;
	}
	public float getLat()
	{
		return lat;
	}
	public float getLon()
	{
		return lon;
	}
	public String getStartDate()
	{
		return startDate;
	}
	public String getStartTime()
	{
		return startTime;
	}
	public String getEndDate()
	{
		return endDate;
	}
	public String getEndTime()
	{
		return endTime;
	}
	public String getTimeCreated()
	{
		return timeCreated;
	}
	public String getPicture()
	{
		return picture;
	}
}
