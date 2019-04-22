<%@page import = "com.Memorialsystem.Dao.buriedDao,com.Memorialsystem.tables.buried,javax.swing.*"%>

<%
	buried u = new buried();
	u.setfirst(request.getParameter("first"));
	u.setmiddle(request.getParameter("middle"));
	u.setlast(request.getParameter("last"));
	u.setborn(request.getParameter("born"));
	u.setdied(request.getParameter("died"));
	u.setlocation(Integer.parseInt(request.getParameter("location")));
	
	int s = buriedDao.countburied(u.getlocation());
	
	if(s<2){
	
	int i = buriedDao.save(u);
	if (i > 0)
		response.sendRedirect("burried.jsp");
	else
		response.sendRedirect("failed");}
	else{
		JOptionPane.showMessageDialog(null,"Sorry, The grave has exceed its limit of the number of buried");
		response.sendRedirect("add_buried.jsp");
	}
%>