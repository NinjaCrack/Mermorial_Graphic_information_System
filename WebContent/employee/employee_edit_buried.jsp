<%@page import="com.Memorialsystem.Dao.buriedDao,com.Memorialsystem.tables.buried"%>

<%
				int id = Integer.parseInt(request.getParameter("id"));
				buried u=buriedDao.getRecordById(id);
			%>
<!DOCTYPE html>
<html>
<head>
	<title>Edit Buried Client</title>
	 <meta name="viewport" content="width=device-width, initial-scale=1">
	<link rel="icon" type="image/png" href="../image/logo.ico">

<link rel="stylesheet" href="../css/main.css" type="text/css">
</head>
<body>
<div class="divsign">
<form  action="employee_buried_edit.jsp?id=<%=id%>" method="post" name="signup">
	<table class="signpage" cellspacing="20px" cellpadding="10px" align="center">
	<tr>
	
	<td><input type="text" name="first" class="signinput" placeholder="Firstname" required value="<%=u.getfirst() %>"/></td>
	</tr>
	<tr>
	
	<td><input type="text" name="middle" class="signinput"  placeholder="Middlename" required value="<%=u.getmiddle() %>"/></td>
	</tr>
	<tr>
	<td><input type="text" name="last" class="signinput"  placeholder="Lastname" required value="<%=u.getlast() %>"/></td>
	</tr>
	<tr>
	<td><input type="number" min="1500" max="2018" name="born" class="signinput"  placeholder="Year Born" required value="<%=u.getborn() %>"/></td>
	</tr>
	<tr>
	<td><input type="number" min="1500" max="2018" name="died" class="signinput"  placeholder="Year Died" required value="<%=u.getdied() %>"/></td>
	</tr>
	<tr>
	<td><input type="number" min="1" max="315" name="location" class="signinput"  placeholder="Location" required value="<%=u.getlocation() %>"/></td>
	</tr>
	
	<tr>
	<td ><a href="employee_burried.jsp"> <button type="button"  class="signbtn">Back </button></a>
	<input type="submit" value="Update" class="signbtn"/></td>
	</tr>
	</table>
</form>
</div>
</body>
</html>