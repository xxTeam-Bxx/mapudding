package model;


import jakarta.servlet.http.HttpServletRequest;

public class UserBeans {
	
	private String password;
	private String username;
	
	public UserBeans(HttpServletRequest request) {
		setPassword(request.getParameter("password"));
		setUsername(request.getParameter("username"));
	}
	

	
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
}
	
