package utility;

import java.util.HashMap;

public class Helper {
	
	public static Activity getAllActivityById(int activityID) {
		return new Activity(0,0,"","",0,0,"","","","","","");
	}
	
	public static User getUserById(int userID) {
		return new User(0,"","","","","",0,"");
	}
	
	public static HashMap<Integer, Coordinate> getLocations() {
		return new HashMap<Integer, Coordinate>();
	}
	
}
