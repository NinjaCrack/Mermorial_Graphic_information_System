package com.Memorialsystem.tables;

public class login {

	private int id;
	private String uname,password;
	
	
	public login() {}
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getUname(){
		return uname;
	}
	public void setUname(String uname) {
		this.uname = uname;
	}
	public String getPassword(){
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
}
