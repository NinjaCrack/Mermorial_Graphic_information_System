package com.servlet;

import java.io.IOException;
import java.io.InputStream;
import java.sql.*;

import javax.servlet.*;
import javax.servlet.annotation.*;
import javax.servlet.http.*;

import com.Memorialsystem.Dao.buriedDao;
import com.Memorialsystem.tables.buried;

/**
 * Servlet implementation class uploadServlet
 */

@SuppressWarnings("serial")
@WebServlet("/uploadServlet")
@MultipartConfig(maxFileSize = 16177215)    // upload file's size up to 16MB

public class addPicture extends HttpServlet {
	
	public static Connection getConnection() {
		Connection con=null;
		try {
			Class.forName("com.mysql.jdbc.Driver");
			con=DriverManager.getConnection("jdbc:mysql://localhost:3306/memorialsystem","root","");
		}catch(Exception e) {System.out.print(e);}
		return con;
	}
	
	
       
	protected void doPost(HttpServletRequest request,HttpServletResponse response) throws ServletException, IOException {		
		Connection con=getConnection();
		// gets values of text fields
		String id=request.getParameter("id");
		buried ee=buriedDao.getRecordById(Integer.parseInt(id));
        
        InputStream inputStream = null; // input stream of the upload file
        
        // obtains the upload file part in this multipart request
        Part filePart = request.getPart("photo");
        if (filePart != null) {
            // prints out some information for debugging
            System.out.println(filePart.getName());
            System.out.println(filePart.getSize());
            System.out.println(filePart.getContentType());
             
            // obtains input stream of the upload file
            inputStream = filePart.getInputStream();
            String message = null;  // message will be sent back to client
            
            try {
                // constructs SQL statement
                
                PreparedStatement statement = con.prepareStatement("update buried set photo=?  where ID=?");
                
                if (inputStream != null) {
                    // fetches input stream of the upload file for the blob column
                    statement.setBlob(1, inputStream);
                }
                statement.setInt(2,ee.getId());
                // sends the statement to the database server
                int row = statement.executeUpdate();
                statement.close();
                if (row > 0) {
                    message = "File updated and saved into database";
                }
            } catch (SQLException ex) {
                message = "ERROR: " + ex.getMessage();
                ex.printStackTrace();
            } finally {
            	try {
            		con.close();
            	} catch(SQLException e) {
            		e.printStackTrace();
            	}
            }
            
                // sets the message in request scope
                request.setAttribute("Message", message);
                 
                // forwards to the message page
                response.sendRedirect("admin/edit_buried.jsp?id="+ee.getId());
        }            
	} 
}