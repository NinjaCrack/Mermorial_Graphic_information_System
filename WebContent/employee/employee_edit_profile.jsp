<%@page import="com.Memorialsystem.Dao.signupDao,com.Memorialsystem.tables.*,javax.servlet.http.*"%>

<%
				int id = 0;
				Cookie[] cookie = request.getCookies();
				if(cookie != null){
					
					for (Cookie tempCookie: cookie){
						if("cookies".equals(tempCookie.getName())){
							
							id = Integer.parseInt(tempCookie.getValue());
							break;
						}
					}
				}
				signup user = signupDao.getRecordById(id);
			
%>

<!DOCTYPE html>
<html>
<head>
	<title>Saint John Memorial Park</title>
	 <meta name="viewport" content="width=device-width, initial-scale=1">
	<link rel="icon" type="image/png" href="../image/logo.ico">

<link rel="stylesheet" href="../css/main.css" type="text/css">

<script src="../bootstrap/jquery-1.7.2.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery.maskedinput/1.4.1/jquery.maskedinput.js"></script>
<link rel="stylesheet" href="../css/main.css" type="text/css">
	
	<script>
		$(document).ready(function($){
			
			$('#contact').mask("+63 999-999-9999",{placeholder:"+63 XXX-XXX-XXXX"});
			
			
		});

	</script>
</head>
<body>
<div class="divsign">
<form action="employee_useredit.jsp?id=<%=id %>" method="post" name="signup">

			
	<table class="signpage" cellspacing="20px" cellpadding="10px" align="center">
	<tr>
	
	<td><input type="text" name="fname" class="signinput" placeholder="First Name"  value="<%=user.getFname()%>"/></td>
	</tr>
	<tr>
	
	<td><input type="text" name="lname" class="signinput"  placeholder="Last Name"  value="<%=user.getLname()%>"/></td>
	</tr>
	<tr>
	
	<td><input type="text" name="uname" class="signinput"  placeholder="UserName"  value="<%=user.getUname()%>"/></td>
	</tr>
<tr>
	
	<td><input type="password" name="password" class="signinput"  placeholder="Password"  value="<%=user.getPassword()%>"/></td>
	</tr>
		<tr>
		<td>
			<input type="text" name="contact"  class="signinput" placeholder="contact #"  id="contact" required value="<%=user.getContact()%>"/>
		</td>
	</tr>
	<tr>
		<td>
			<input type="text" name="relative" class="signinput"  placeholder="Name of relative" required value="<%=user.getRelative()%>"/>
		</td>
	</tr>
	<tr>
	<td ><a href="employee_index.jsp"> <button type="button"  class="signbtn">Back </button></a>
	<input type="submit" value="Update" class="signbtn"/></td>
	</tr>
	</table>
</form>
</div>
</body>
</html>