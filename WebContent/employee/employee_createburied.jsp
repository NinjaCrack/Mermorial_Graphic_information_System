<%@page import = "com.Memorialsystem.Dao.buriedDao,com.Memorialsystem.tables.buried"%>

<%
	buried u = new buried();
	u.setfirst(request.getParameter("first"));
	u.setmiddle(request.getParameter("middle"));
	u.setlast(request.getParameter("last"));
	u.setborn(request.getParameter("born"));
	u.setdied(request.getParameter("died"));
	u.setlocation(Integer.parseInt(request.getParameter("location")));
	int i = buriedDao.save(u);
	if (i > 0)
		response.sendRedirect("employee_burried.jsp");
	else
		response.sendRedirect("failed");
%>