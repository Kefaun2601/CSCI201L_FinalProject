package runshigu_FInalProject;


import java.util.ArrayList;

public class Activity {
	private String title;
	private String description;
	private float lat;
	private float lon;
	private String startDate;
	private String startTime;
	private String endDate;
	private String endTime;
	public static ArrayList<Activity> getter(){
		ArrayList<Activity> result=new ArrayList<Activity>();
		for(int i=0;i<2;i++) {
			Activity temp=new Activity();
			temp.title= i+"name";
			temp.description="tempaklsfjal ksjfa slkfj  slkfsaflsakfdlsak faslfndsaf"+
					"ksbjasabijf nakcjc sfasdf savasfwfkjn fasasd"
					+ "fasdfff fffffffff ffffffff fffffffffff"
					+ "ffffffffff fffffff ffffffff fffff";
			result.add(temp);
		}
		result.get(0).lat=(float) 34.0225556;
		result.get(0).lon=(float) -118.28846454620361;
		result.get(1).lat=(float) 34.02019024;
		result.get(1).lon=(float) -118.28649044036865;
		result.get(0).startDate="20190304";
		result.get(0).startTime="08:00";
		result.get(0).endDate="20190304";
		result.get(0).endTime="08:00";
		result.get(1).startDate="20190304";
		result.get(1).startTime="08:00";
		result.get(1).endDate="20190304";
		result.get(1).endTime="08:00";
		return result;
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
}
