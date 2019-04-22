<!DOCTYPE html>
<html>
<head>
	<title>Add Buried Client</title>
	 <meta name="viewport" content="width=device-width, initial-scale=1">
	<link rel="icon" type="image/png" href="../image/logo.ico">

<link rel="stylesheet" href="../css/main.css" type="text/css">
</head>
<body>
<div class="divsign">
<form action="admin_createburied.jsp" method="post" name="signup">
	<table class="signpage" cellspacing="20px" cellpadding="10px" align="center">
	<tr>
	
	<td><input type="text" name="first" class="signinput" placeholder="Firstname" required/></td>
	</tr>
	<tr>
	
	<td><input type="text" name="middle" class="signinput"  placeholder="Middlename" required/></td>
	</tr>
	<tr>
	<td><input type="text" name="last" class="signinput"  placeholder="Lastname" required/></td>
	</tr>
	<tr>
	<td><input type="date" name="born" class="signinput"  placeholder="Year Born" required/></td>
	</tr>
	<tr>
	<td><input type="date" name="died" class="signinput"  placeholder="Year Died" required/></td>
	</tr>
	<tr>
	<td><input type="number" min="1" max="315" name="location" class="signinput"  placeholder="Location" required/></td>
	</tr>
	<tr>
	<td ><a href="burried.jsp"> <button type="button"  class="signbtn">Back </button></a>
	<input type="submit" value="Create" class="signbtn"/></td>
	</tr>
	</table>
</form>
</div>
</body>
</html>