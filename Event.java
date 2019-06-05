package runshigu_FInalProject;


import java.util.Vector;

public class Event {
	public String name;
	public String description;
	public double lat;
	public double lon;
	public static Vector<Event> getter(){
		Vector<Event> result=new Vector<Event>();
		for(int i=0;i<1;i++) {
			Event temp=new Event();
			temp.name= i+"name";
			temp.description="temp" +i;
			result.add(temp);
		}
		result.get(0).lat=-35.890542;
		result.get(0).lon=151.274856;
		return result;
	}
}
