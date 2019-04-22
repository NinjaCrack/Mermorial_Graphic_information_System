package com.Memorialsystem.Dao;

import java.sql.*;
import com.Memorialsystem.tables.*;

public class loginDao {
	public static Connection getConnection() {
		Connection con = null;
		try {
			Class.forName("com.mysql.jdbc.Driver");
			con = DriverManager.getConnection("jdbc:mysql://localhost:3306/memorialsystem","root","");
		}catch(Exception e) {
			System.out.println(e);
		}
		return con;
	}
	
	public static String getPassword(login l) {
		String password = null;
		Connection con = getConnection();
		try {
			PreparedStatement ps = con.prepareStatement("SELECT password FROM signup WHERE username=?");
			ps.setString(1, l.getUname());
			ResultSet rs = ps.executeQuery();
			if (rs.next())
				password = rs.getString("password");
			
			
			ps.close();
			rs.close();
		}catch(Exception e) {
			System.out.println(e);
		}
		finally {
	    	try {
	    		con.close();
	    	}catch(SQLException e) {
	    		e.printStackTrace();
	    	}}
		return password;
	}
	
	public static signup getUserInfo(String username) {
		signup u = new signup();
		Connection con = getConnection();
		try {
			PreparedStatement ps = con.prepareStatement("SELECT * FROM signup WHERE username=?");
			ps.setString(1, username);
			ResultSet rs = ps.executeQuery();
			if(rs.next()) {
				u.setId(rs.getInt("id"));  
	            u.setFname(rs.getString("fname"));  
	            u.setLname(rs.getString("lname"));  
	            u.setUname(rs.getString("username"));  
	            u.setPassword(rs.getString("password"));    
	            u.setRole(rs.getString("role"));  
			}
				
			ps.close();
			rs.close();
		} catch(Exception e) {
			System.out.println(e);
		}
		finally {
	    	try {
	    		con.close();
	    	}catch(SQLException e) {
	    		e.printStackTrace();
	    	}}
		return u;
	}
}
