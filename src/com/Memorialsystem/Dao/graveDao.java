package com.Memorialsystem.Dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.Memorialsystem.tables.grave;

public class graveDao {
	public static Connection getConnection() {
		Connection con=null;
		try {
		Class.forName("com.mysql.jdbc.Driver");
		con=DriverManager.getConnection("jdbc:mysql://localhost:3306/memorialsystem","root","");
	}catch(Exception e) {System.out.print(e);}
		return con;
	}
	
	
	public static List<grave> getAllRecords(){  
	    List<grave> list=new ArrayList<grave>();  
	      
	    Connection con=getConnection();
	    try{  
	          
	        PreparedStatement ps=con.prepareStatement("select * from grave");  
	        ResultSet rs=ps.executeQuery();  
	        while(rs.next()){  
	            grave u=new grave();  
	            u.setId(rs.getInt("ID"));  
	            u.setArea(rs.getDouble("area"));
	            u.setPrice(rs.getDouble("price"));

	            list.add(u);  
	        }  
	        ps.close();
	        rs.close();
	    }catch(Exception e){System.out.println(e);} 
	    finally {
	    	try {
	    		con.close();
	    	}catch(SQLException e) {
	    		e.printStackTrace();
	    	}}
	    return list; 
	}
	public static grave getRecordById(int id){  
	    grave u=null;  
	    Connection con=getConnection();
	    try{  
	          
	        PreparedStatement ps=con.prepareStatement("select * from grave where id=?");  
	        ps.setInt(1,id);  
	        ResultSet rs=ps.executeQuery();  
	        while(rs.next()){  
	            u=new grave();  
	            u.setId(rs.getInt("ID"));  
	            u.setArea(rs.getDouble("area"));
	            u.setPrice(rs.getDouble("price")); 
	           
	        }  
	        ps.close();
	        rs.close();
	    }catch(Exception e){System.out.println(e);}  
	    finally {
	    	try {
	    		con.close();
	    	}catch(SQLException e) {
	    		e.printStackTrace();
	    	}}
	    return u;  
	}
}
