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
<form  action="../uploadServlet?id=<%=id%>" method="post" enctype="multipart/form-data" name="signup">
	<table class="signpage" cellspacing="20px" cellpadding="10px" align="center">
		<tr>
			<td></td>
		</tr>
		<tr>
			<td>
				<input type="file" id="photo" name="photo" class="signinput">
			</td>
		</tr>
		<tr>
			<td>
				<button class="signbtn">Submit Photo</button>
				<a href="edit_buried.jsp?id=<%=id%>"><button type="button" class="signbtn">Cancel</button></a>
			</td>
		</tr>
	</table>
</form>
</div>
</body>
</html>