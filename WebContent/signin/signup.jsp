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
<form action="createuser.jsp" method="post" name="signup"  onsubmit="return alertName();" >
	<table class="signpage" cellspacing="20px" cellpadding="10px" align="center">
	<tr>
	
		<td>
			<input type="text" name="fname" class="signinput" placeholder="First Name" required/>
		</td>
	</tr>
	<tr>
	
		<td>
			<input type="text" name="lname" class="signinput"  placeholder="Last Name" required/>
		</td>
	</tr>
	<tr>
	
		<td>
			<input type="text" name="uname" class="signinput"  placeholder="UserName" required/>
		</td>
	</tr>
	<tr>
		<td>
			<input type="password" name="password" class="signinput"  placeholder="Password" required/>
		</td>
	</tr>
	<tr>
		<<td>
			<input type="text" name="contact" class="signinput"  placeholder="contact #"  id="contact" required/>
		</td>
	</tr>
	<tr>
		<td>
			<input type="text" name="relative" class="signinput"  placeholder="Name of relative" required/>
		</td>
	</tr>
	
	
	
	<tr>
		<td>
			<select class="signinput" name="role" style="display:none;"><option selected="selected">relative</option></select>
		</td>
	</tr>
	<tr>
		<td >
			<a href="../signin/signin.jsp"> <button type="button"  class="signbtn">Back </button></a>
			<input type="submit" value="sign up" class="signbtn"/>
		</td>
	</tr>
	</table>
</form>
</div>
<script type="text/javascript">
function alertName(){
alert("Form has been submitted! \nPlease wait for the admin to approve your account \nThank you!");
} 
</script>
</body>
</html>