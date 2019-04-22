package com.Memorialsystem.Dao;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

import com.Memorialsystem.tables.buried;
import com.Memorialsystem.tables.signup;


public class buriedDao {
	public static Connection getConnection() {
		Connection con=null;
		try {
		Class.forName("com.mysql.jdbc.Driver");
		con=DriverManager.getConnection("jdbc:mysql://localhost:3306/memorialsystem","root","");
	}catch(Exception e) {System.out.print(e);}
		return con;
	}
public static int save(buried u) {
		
		int status=0;
		Connection con=getConnection();
		try {
			
			PreparedStatement ps=con.prepareStatement("insert into buried(firstname,middlename,lastname,born,died,location) values(?,?,?,?,?,?)" );
			ps.setString(1,u.getfirst());
			ps.setString(2,u.getmiddle());
			ps.setString(3,u.getlast());
			ps.setString(4,u.getborn());
			ps.setString(5,u.getdied());
			ps.setInt(6, u.getlocation());
			status=ps.executeUpdate();
			
			ps.close();
		}catch(Exception e) {System.out.print(e);}
		finally {
	    	try {
	    		con.close();
	    	}catch(SQLException e) {
	    		e.printStackTrace();
	    	}}
		return status;
	}
public static buried getRecordById(int id){  
    buried u=null;  
    Connection con=getConnection();
    try{  
          
        PreparedStatement ps=con.prepareStatement("select * from buried where id=?");  
        ps.setInt(1,id);  
        ResultSet rs=ps.executeQuery();  
        while(rs.next()){  
            u=new buried();  
            u.setId(rs.getInt("id"));  
            u.setfirst(rs.getString("firstname"));  
            u.setmiddle(rs.getString("middlename"));  
            u.setlast(rs.getString("lastname"));  
            u.setborn(rs.getString("born"));
            u.setdied(rs.getString("died"));
            u.setlocation(rs.getInt("location"));
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
public static List<buried> getAllRecords(){  
    List<buried> list=new ArrayList<buried>();  
      
    Connection con=getConnection();
    try{  
          
        PreparedStatement ps=con.prepareStatement("select * from buried");  
        ResultSet rs=ps.executeQuery();  
        while(rs.next()){  
            buried u=new buried();  
            u.setId(rs.getInt("id"));  
            u.setfirst(rs.getString("firstname"));  
            u.setmiddle(rs.getString("middlename"));  
            u.setlast(rs.getString("lastname"));  
            u.setborn(rs.getString("born"));
            u.setdied(rs.getString("died"));
            u.setlocation(rs.getInt("location"));
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
public static int update(buried u){  
    int status=0;  
    Connection con=getConnection();
    try{  
          
        PreparedStatement ps=con.prepareStatement("update buried set firstname=?,middlename=?,lastname=?,born=?,died=?,location=? where id=?");  
        ps.setString(1,u.getfirst());  
        ps.setString(2,u.getmiddle());  
        ps.setString(3,u.getlast());  
        ps.setString(4,u.getborn());
        ps.setString(5,u.getdied());
        ps.setInt(6,u.getlocation());
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
public static int delete(buried u){  
    int status=0;  
    Connection con=getConnection();  
    try{  
        
        PreparedStatement ps=con.prepareStatement("delete from buried where id=?");  
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
public static int countburied(int loc) {
	int count=0;
	 Connection con=getConnection();
	 try{  
	        
	        PreparedStatement ps=con.prepareStatement("SELECT count(*) from buried where location=?");  
	        ps.setInt(1,loc);  
	         
	        ResultSet rs=ps.executeQuery();  
	        if(rs.next())
	        	count=rs.getInt(1);
	        ps.close();
	    }catch(Exception e){System.out.println(e);} 
	 finally {
	    	try {
	    		con.close();
	    	}catch(SQLException e) {
	    		e.printStackTrace();
	    	}}
	 return count;
}


}
