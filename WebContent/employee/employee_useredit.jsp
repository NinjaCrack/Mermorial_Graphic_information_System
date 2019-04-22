<%@page import="com.Memorialsystem.Dao.signupDao"%>

	<jsp:useBean id="u" class="com.Memorialsystem.tables.signup"></jsp:useBean>
	<jsp:setProperty property="*" name="u"/>

<%
	u.setId(Integer.parseInt(request.getParameter("id")));
	int i=signupDao.update(u);
	response.sendRedirect("employee_index.jsp");
%>