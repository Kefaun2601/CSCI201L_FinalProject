package utility;

public class DBCredentials {
	
	// Database Connection Username
	private static String dbusername = "root"; // CHANGE THIS FIELD
	// Database Connection Password
	private static String dbpassword = "root"; // CHANGE THIS FIELD
	
	
	//Accessors
	public static String getUsername()
	{
		return dbusername;
	}
	
	public static String getPassword()
	{
		return dbpassword;
	}
	
}
