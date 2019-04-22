<%@page import="com.Memorialsystem.Dao.signupDao,com.Memorialsystem.tables.*"%>

<%
				int id= Integer.parseInt(request.getParameter("id"));
				signup u=signupDao.getRecordById(id);
			%>

<!DOCTYPE html>
<html>
<head>
	<title>Saint John Memorial Park</title>
	 <meta name="viewport" content="width=device-width, initial-scale=1">
	<link rel="icon" type="image/png" href="../image/logo.ico">
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
<form action="useredit.jsp?id=<%=id %>" method="post" name="signup">

			
	<table class="signpage" cellspacing="20px" cellpadding="10px" align="center">
	<tr>
	
	<td><input type="text" name="fname" class="signinput" placeholder="First Name"  value="<%=u.getFname() %>"/></td>
	</tr>
	<tr>
	
	<td><input type="text" name="lname" class="signinput"  placeholder="Last Name"  value="<%=u.getLname() %>"/></td>
	</tr>
	<tr>
	
	<td><input type="text" name="uname" class="signinput"  placeholder="UserName"  value="<%=u.getUname() %>"/></td>
	</tr>
<tr>
	
	<td><input type="password" name="password" class="signinput"  placeholder="Password"  value="<%=u.getPassword() %>"/></td>
	</tr>
	<tr>
		<td>
			<input type="text" name="contact" class="signinput"  placeholder="contact #"  id="contact"  value="<%=u.getContact()%>"/>
		</td>
	</tr>
	<tr>
		<td>
			<input type="text" name="relative" class="signinput"  placeholder="Name of relative" required value="<%=u.getRelative()%>"/>
		</td>
	</tr>
	<tr>
	<td ><a href="user_management.jsp"> <button type="button"  class="signbtn">Back </button></a>
	<input type="submit" value="Update" class="signbtn"/></td>
	</tr>
	</table>
</form>
</div>
</body>
</html>