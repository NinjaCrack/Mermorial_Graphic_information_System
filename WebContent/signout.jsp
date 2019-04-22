<%@page import="com.Memorialsystem.Dao.signupDao,com.Memorialsystem.tables.*,javax.servlet.http.*"%>
<%
				Cookie[] cookie = request.getCookies();
				if(cookie != null){
					
					for (Cookie tempCookie: cookie){
						if("cookies".equals(tempCookie.getName())){
							tempCookie.setMaxAge(0);
							response.addCookie(tempCookie);
							break;
						}
					}
				}
			response.sendRedirect("signin/signin.jsp");
%>