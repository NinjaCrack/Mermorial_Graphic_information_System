<%@page import="java.io.*,java.sql.*,java.util.*"%>
<%@page import="com.Memorialsystem.Dao.*,com.Memorialsystem.tables.*"%>
<%@page import="org.apache.commons.fileupload.*"%>
<%@page import="org.apache.commons.io.output.*"%>
<%@page import="org.apache.commons.fileupload.servlet.*"%>
<%@page import="org.apache.commons.fileupload.disk.*"%>
 
<%
   	Blob image = null;
	byte[] imgData = null ;
   	Connection con = null;
    Statement stmt = null;
    ResultSet rs = null;
    String j=request.getParameter("id");
    int i=Integer.parseInt(j);
   try{
	   con=DriverManager.getConnection("jdbc:mysql://localhost:3306/memorialsystem","root","");
	   Class.forName("com.mysql.jdbc.Driver");
		
    stmt = con.createStatement();
    rs = stmt.executeQuery("select photo from buried where ID="+i);
    	OutputStream o = response.getOutputStream();
    	 if(rs.next()) {
    	 	image = rs.getBlob(1);
    	    imgData = image.getBytes(1,(int)image.length());
    	    response.setContentType("image/jpg");
    	    o.write(imgData);
    	    o.flush();
    	    o.close();
    	 }		 
   } catch (Exception e) {out.println("Image Display Error=" + e.getMessage());} 
%>