package com.Memorialsystem.Dao;

import java.sql.*;
import com.Memorialsystem.tables.*;

public class signupDao {
	
	public static Connection getConnection() {
		Connection con=null;
		try {
		Class.forName("com.mysql.jdbc.Driver");
		con=DriverManager.getConnection("jdbc:mysql://localhost:3306/memorialsystem","root","");
	}catch(Exception e) {System.out.print(e);}
		return con;
}
	public static int save(signup u) {
		
		int status=0;
		Connection con=getConnection();
		try {
			
			PreparedStatement ps=con.prepareStatement("insert into signup(Fname,lname,username,password,role,contact,relative) values(?,?,?,?,?,?,?)" );
			ps.setString(1,u.getFname());
			ps.setString(2,u.getLname());
			ps.setString(3,u.getUname());
			ps.setString(4,u.getPassword());
			ps.setString(5,u.getRole());
			ps.setString(6,u.getContact());
			ps.setString(7,u.getRelative());
			status=ps.executeUpdate();
			 
		        ps.close();
		       signup user = getnewuser();
		        
		        blockUser(user);
		}
		
		catch(Exception e) {System.out.print(e);}
		finally {
	    	try {
	    		con.close();
	    	}catch(SQLException e) {
	    		e.printStackTrace();
	    	}
	    }
		return status;
	}
	public static signup getRecordById(int id){  
	    signup u=null;  
	    Connection con=getConnection();  
	    try{  
	        
	        PreparedStatement ps=con.prepareStatement("select * from signup where id=?");  
	        ps.setInt(1,id);  
	        ResultSet rs=ps.executeQuery();  
	        while(rs.next()){  
	            u=new signup();  
	            u.setId(rs.getInt("id"));  
	            u.setFname(rs.getString("fname"));  
	            u.setLname(rs.getString("lname"));  
	            u.setUname(rs.getString("username"));  
	            u.setPassword(rs.getString("password"));  
	            u.setRelative(rs.getString("relative"));
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
	    return u;  
	}
	 
	public static int update(signup u){  
	    int status=0;  
	    
	    Connection con=getConnection(); 
	    try{  
	         
	        PreparedStatement ps=con.prepareStatement("update signup set Fname=?,Lname=?,username=?,password=?,contact=?,relative=? where id=?");  
	        ps.setString(1,u.getFname());  
	        ps.setString(2,u.getLname());  
	        ps.setString(3,u.getUname());  
	        ps.setString(4,u.getPassword()); 
	        ps.setString(5,u.getContact()); 
	        ps.setString(6,u.getRelative()); 
	        ps.setInt(7,u.getId());  
	        status=ps.executeUpdate();  
	        
	        ps.close();
	    }catch(Exception e){System.out.println(e);}  
	    finally {
	    	try {
	    		con.close();
	    	}catch(SQLException e) {
	    		e.printStackTrace();
	    	}}
	    return status;  
	}
	
	public static int delete(signup u){  
	    int status=0;  
	    Connection con=getConnection(); 
	    try{  
	         
	        PreparedStatement ps=con.prepareStatement("delete from signup where id=?");  
	        ps.setInt(1,u.getId());  
	        status=ps.executeUpdate();  
	        
	        ps.close();
	    }catch(Exception e){System.out.println(e);}  
	    finally {
	    	try {
	    		con.close();
	    	}catch(SQLException e) {
	    		e.printStackTrace();
	    	}}
	    return status;  
	}
	
	public static int blockUser(signup user) {
		int status = 0;
		Connection con = getConnection();
		
		try {
			
			PreparedStatement ps = con.prepareStatement("INSERT INTO blocked(ID, date) VALUES(?,?)");
			ps.setInt(1, user.getId());
			ps.setDate(2,new java.sql.Date(new java.util.Date().getTime()));
			status = ps.executeUpdate();
			
			ps.close();
		}catch(Exception e) {
			System.out.println(e);
		}
		finally {
	    	try {
	    		con.close();
	    	}catch(SQLException e) {
	    		e.printStackTrace();
	    	}}
		return status;
	}
	
	public static int unblockUser(signup user) {
		int status = 0;
		Connection con = getConnection();
		try {
			PreparedStatement ps = con.prepareStatement("DELETE FROM blocked WHERE ID=?");
			ps.setInt(1, user.getId());
			status = ps.executeUpdate();
			ps.close();
		}catch(Exception e) {
			System.out.println(e);
		}finally {
			try {
				con.close();
			}catch(SQLException e) {
				e.printStackTrace();
			}
		}
		return status;
	}
	
	public static boolean isUserBlocked(signup user) {
		int stat = 0;
		Connection con = getConnection();
		try {
			
			PreparedStatement ps = con.prepareStatement("SELECT COUNT(*) FROM blocked WHERE ID=?"); 
			ps.setInt(1, user.getId());
			ResultSet rs = ps.executeQuery();
			if (rs.next())
				stat = rs.getInt(1);
			
			ps.close();
			rs.close();
		} catch (Exception e) {
			System.out.println(e);
		}
		finally {
	    	try {
	    		con.close();
	    	}catch(SQLException e) {
	    		e.printStackTrace();
	    	}}
		if (stat > 0)
			return true;
		else
			return false;
	}
	public static signup getnewuser() {
		signup sign = new signup();
		Connection con = getConnection();
		try {
			
			PreparedStatement ps = con.prepareStatement("SELECT max(ID) FROM signup");
			ResultSet rs = ps.executeQuery();
			if(rs.next())
				sign = getRecordById(rs.getInt(1));
			
			
			ps.close();
		}catch(Exception e) {
			System.out.println(e);
		}
		return sign;
	}
	public static boolean[] getvacant() {
		
		boolean vacant[] = new boolean[315];
		Connection con = getConnection();
		try {
			for(int i=0;i<vacant.length;i++){
			PreparedStatement ps = con.prepareStatement("SELECT count(*) FROM buried where location=?");
			ps.setInt(1, i+1);
			ResultSet rs = ps.executeQuery();
			
			if(rs.next()) {
				if(rs.getInt(1)>=0&&rs.getInt(1)<2) {
					vacant[i]=true;
				}
				else { 
					vacant[i]=false;
				}
			}
				
			
			
			ps.close();
			}
		}catch(Exception e) {
			System.out.println(e);
		}
		return vacant;
	}
}
