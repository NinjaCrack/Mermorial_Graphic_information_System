package com.Memorialsystem.tables;

public class signup {

	private int id;
	private String fname,lname,uname,password,role,contact,relative;
	
	public signup() {
		
	}

	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
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
	
	public String getUname() {
		return uname;
	}
	public void setUname(String uname) {
		this.uname= uname;
	}
	
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	
	public String getRole() {
		return role;
	}
	public void setRole(String role) {
		this.role = role;
	}
	public String getContact() {
		return contact;
	}
	public void setContact(String contact) {
		this.contact = contact;
	}
	
	public String getRelative() {
		return relative;
	}
	public void setRelative(String relative) {
		this.relative = relative;
	}
}
