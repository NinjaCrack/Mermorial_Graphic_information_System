package com.Memorialsystem.Dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class modalDao {
	public static Connection getConnection() {
		
		Connection con=null;
		try {
		Class.forName("com.mysql.jdbc.Driver");
		con=DriverManager.getConnection("jdbc:mysql://localhost:3306/memorialsystem","root","");
	}catch(Exception e) {System.out.print(e);}
		return con;
}
	
	public static String getCoordinate(int location) {
		String loc=null;
		Connection con=getConnection(); 
try{  
	        
	        PreparedStatement ps=con.prepareStatement("SELECT coords from maps where location=?");  
	        ps.setInt(1,location);  
	        ResultSet rs=ps.executeQuery();  
	        while(rs.next()){  
	            loc = rs.getString("coords");
	            
	        }
	        rs.close();
	        ps.close();
	    }
	    
	    catch(Exception e){System.out.println(e);}
			finally {
				try {
					con.close();
				}catch(SQLException e) {
					e.printStackTrace();
				}}
	return loc;
	}
}
