<%@page import="com.Memorialsystem.tables.*, com.Memorialsystem.Dao.*"%>
<%
	int id = Integer.parseInt(request.getParameter("id"));
	buried u = buriedDao.getRecordById(id);
	buriedDao.delete(u);
	response.sendRedirect("burried.jsp");
%>