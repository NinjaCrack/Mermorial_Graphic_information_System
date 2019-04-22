<%@page import = "com.Memorialsystem.Dao.*,com.Memorialsystem.tables.*,javax.servlet.http.*"%>



<%
	int attempts = 1;
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
		if (pass.equals(request.getParameter("password"))){
			signup user = loginDao.getUserInfo(u.getUname());
			if (!signupDao.isUserBlocked(user)){
				
				int ids = user.getId();
				
				Cookie cookie = new Cookie("cookies",Integer.toString(ids));
				cookie.setMaxAge(60*60*24);	
				response.addCookie(cookie);
				
				if (user.getRole().equalsIgnoreCase("admin"))
					response.sendRedirect("admin/index.jsp");
				else if (user.getRole().equalsIgnoreCase("employee"))
					response.sendRedirect("employee/employee_index.jsp");
				else
					response.sendRedirect("relatives/relatives_index.jsp");
			}else{
				
				response.sendRedirect("signin/attempts_blocked.jsp");
				
			}
		}else{
			signup user = loginDao.getUserInfo(u.getUname());
			if (request.getParameter("username").equals(account))
				attempts++;
			else
				attempts = 1;
			if (attempts >= 3){
				signupDao.blockUser(user);
				
				response.sendRedirect("signin/attempts_blocked.jsp");
			} else
				response.sendRedirect("signin/attempts.jsp?account=" + u.getUname() + "&attempts=" + attempts);
		}
	}else
		response.sendRedirect("signin/signin.jsp");
%>