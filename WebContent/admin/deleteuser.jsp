<%@page import="com.Memorialsystem.tables.*, com.Memorialsystem.Dao.*"%>

<%
	int id = Integer.parseInt(request.getParameter("id"));
	signup u = signupDao.getRecordById(id);
	signupDao.delete(u);
	response.sendRedirect("user_management.jsp");
%>