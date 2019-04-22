<%@page import="com.Memorialsystem.Dao.buriedDao"%>

	<jsp:useBean id="u" class="com.Memorialsystem.tables.buried"></jsp:useBean>
	<jsp:setProperty property="*" name="u"/>

<%
	u.setId(Integer.parseInt(request.getParameter("id")));
	int i=buriedDao.update(u);
	response.sendRedirect("employee_burried.jsp");
%>