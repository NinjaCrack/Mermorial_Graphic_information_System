<%@page import = "com.Memorialsystem.Dao.signupDao,com.Memorialsystem.tables.signup,javax.servlet.http.*,javax.swing.*"%>

<%
	signup u = new signup();
	
	u.setFname(request.getParameter("fname"));
	u.setLname(request.getParameter("lname"));
	u.setUname(request.getParameter("uname"));
	u.setPassword(request.getParameter("password"));
	u.setRole(request.getParameter("role"));
	u.setContact(request.getParameter("contact"));
	u.setRelative(request.getParameter("relative"));
	
	
	int i = signupDao.save(u);
	if (i > 0){
		response.sendRedirect("signin.jsp");
		
	}
	else
		response.sendRedirect("failed");
%>