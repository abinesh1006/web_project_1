package bean;

public class userBean {
	private String firstName;
	private String lastName;
	private String email;
	private long mobileNumber;
	private String password;
	
	public userBean() {
		super();
		// TODO Auto-generated constructor stub
	}
	public userBean(String firstName, String lastName, String email, long mobileNumber, String password) {
		super();
		this.firstName = firstName;
		this.lastName = lastName;
		this.email = email;
		this.mobileNumber = mobileNumber;
		this.password = password;
	}
	public String getFirstName() {
		return firstName;
	}
	public void setFirstName(String firstName) {
		this.firstName = firstName;
	}
	public String getLastName() {
		return lastName;
	}
	public void setLastName(String lastName) {
		this.lastName = lastName;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public long getMobileNumber() {
		return mobileNumber;
	}
	public void setMobileNumber(long mobileNumber) {
		this.mobileNumber = mobileNumber;
	}
	public String getpassword(){
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	
	
}
