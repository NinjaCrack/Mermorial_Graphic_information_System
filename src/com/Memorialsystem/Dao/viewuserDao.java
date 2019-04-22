package com.Memorialsystem.Dao;

import java.sql.*;  
import java.util.ArrayList;  
import java.util.List;
import com.Memorialsystem.tables.signup;


public class viewuserDao {
	
	public static Connection getConnection(){  
	    Connection con=null;  
	    try{  
	        Class.forName("com.mysql.jdbc.Driver");  
	        con=DriverManager.getConnection("jdbc:mysql://localhost:3306/memorialsystem","root","");  
	    }catch(Exception e){System.out.println(e);}  
	    return con;  
	}
	public static List<signup> getAllRecords(){  
	    List<signup> list=new ArrayList<signup>();  
	    Connection con=getConnection(); 
	    try{  
	        PreparedStatement ps=con.prepareStatement("select * from signup");  
	        ResultSet rs=ps.executeQuery();  
	        while(rs.next()){  
	            signup u=new signup();  
	            u.setId(rs.getInt("id"));  
	            u.setFname(rs.getString("fname"));  
	            u.setLname(rs.getString("lname"));  
	            u.setUname(rs.getString("username"));  
	            u.setPassword(rs.getString("password"));    
	            u.setRole(rs.getString("role")); 
	            u.setContact(rs.getString("contact")); 
	            u.setRelative(rs.getString("relative")); 
	            list.add(u);  
	        }  
	        rs.close();
	        ps.close();
	    }catch(Exception e){
	    	System.out.println(e);
	    } finally {
	    	try {
	    		con.close();
	    	}catch(SQLException e) {
	    		e.printStackTrace();
	    	}
	    }
	    return list;  
	}  
	
}
