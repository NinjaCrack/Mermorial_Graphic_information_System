<%@page import = "com.Memorialsystem.Dao.*,com.Memorialsystem.tables.*,javax.servlet.http.*"%>

<%
int attempts = 3;
String account =null;
try{
	account = request.getParameter("account");
}catch(Exception e){
	System.out.println(e);
	account = request.getParameter("username");
}
try{
	attempts = Integer.parseInt(request.getParameter("attempts"));
}catch(Exception e){
	System.out.println(e);
}
login u = new login();
u.setUname(request.getParameter("username"));
u.setPassword(request.getParameter("password"));
String pass = loginDao.getPassword(u);

if (pass != null){
	if (attempts >= 3){
		signup user = loginDao.getUserInfo(u.getUname());
		signupDao.blockUser(user);
		
		response.sendRedirect("signin/attempts_blocked.jsp");
	}
		
		 else{
			attempts = 3;
			signup user = loginDao.getUserInfo(u.getUname());
			signupDao.blockUser(user);
		response.sendRedirect("../signin/attempts_blocked.jsp");
		}
}
%>
<h1>block</h1>