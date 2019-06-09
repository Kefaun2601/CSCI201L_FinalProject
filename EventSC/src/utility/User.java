package utility;

public class User {
	private int userID;
	private String email;
	private String fname;
	private String lname;
	private String phone;
	private String profilepic;
	private int gradyear;
	private String major;
	
	public User(int userId, String email, String fname, String lname, String phone, String profilepic, int gradyear, String major){
		this.userID = userId;
		this.email = email;
		this.fname = fname;
		this.lname = lname;
		this.phone = phone;
		this.profilepic = profilepic;
		this.gradyear = gradyear;
		this.major = major;
	}
	
	//For all the setters, need database connection!!!
	//For all the setters, need database connection!!!
	//For all the setters, need database connection!!!
	
	public int getUserID() {
		return userID;
	}
	public void setUserID(int userID) {
		this.userID = userID;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getFname() {
		return fname;
	}
	public void setFname(String fname) {
		this.fname = fname;
	}
	public String getLname() {
		return lname;
	}
	public void setLname(String lname) {
		this.lname = lname;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getProfilepic() {
		return profilepic;
	}
	public void setProfilepic(String profilepic) {
		this.profilepic = profilepic;
	}
	public int getGradyear() {
		return gradyear;
	}
	public void setGradyear(int gradyear) {
		this.gradyear = gradyear;
	}
	public String getMajor() {
		return major;
	}
	public void setMajor(String major) {
		this.major = major;
	}

	
	
}