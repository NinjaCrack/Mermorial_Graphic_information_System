<%@page import="com.Memorialsystem.Dao.*, com.Memorialsystem.tables.*"%>

<%
	int id = Integer.parseInt(request.getParameter("id"));
	String b = request.getParameter("b");
	signup user = signupDao.getRecordById(id);
	if (b.equalsIgnoreCase("block")){
		signupDao.blockUser(user);
	} else if (b.equalsIgnoreCase("unblock")){
		signupDao.unblockUser(user);
	}
	response.sendRedirect("user_management.jsp");
%>	