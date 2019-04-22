<!DOCTYPE html>
<html>
<head>
 	<meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
	<title>User Management</title>
	 <link rel="icon" type="image/png" href="../image/logo.ico">
	 


<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>

  	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
 	 <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
	<script src="../bootstrap/bootstrap.min.js"></script>
	
	
   <!-- Bootstrap -->
    <link href="../datatables/css/bootstrap.min.css" rel="stylesheet">
	 <link href="../datatables/css/dataTables.bootstrap.min.css" rel="stylesheet">

    <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
      <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->

<link rel="stylesheet" href="../css/main.css" type="text/css">


</head>
<body>
<header>
		<nav>	
			<ul>
			<li><a href="index.jsp" title="Back to home"><img src="../image/icon/home.png" width="30px" height="30px"/> home</a></li>
			<li><a href="burried.jsp" title="Burried Clients"><img src="../image/icon/buried.png" width="30px" height="30px"/>  Buried Client Management</a></li>
			<li><a href="user_management.jsp" title="Buried Management" class="active"> <img src="../image/icon/user.png" width="30px" height="30px"/>User Management</a></li>
			<li><a href="find.jsp" title="Map of Cemetery"><img src="../image/icon/find.png" width="30px" height="30px"/> Find Grave</a></li>
			<li style="float:right">
						<div class="dropdown-header">
							<img src="../image/icon/account.png" width="30px" height="30px"/>
							<button id="label" type="button" data-toggle="dropdown" aria-haspopup="true" aria-epanded="false" class="btn-primary"> 
								My Account
								<span class="caret"></span>
							</button>
							<ul class="dropdown-menu" aria-labelledby="dlabel">
							<a href="admin_edit_profile.jsp"> <img src="../image/icon/settings.png" width="30px" height="30px"/> Profile</a>
						
							<a href="../signin/signin.jsp"> <img src="../image/icon/logout.png" width="30px" height="30px"/> Sign Out</a>
							
							</ul>
						</div>
					</li>
		</ul>
		</nav>
</header>
<br/>
	<div class="container list">
	<%@ page import="com.Memorialsystem.Dao.*,com.Memorialsystem.tables.*,java.util.*"%>
		<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
			<%List<signup> list=viewuserDao.getAllRecords();
			  request.setAttribute("list",list);
			%>
			<h2>LIST OF USER AND EMPLOYEE </h2>
			<a href="adduser.jsp" style="padding:5px; color:#303233; text-decoration:none; font-size:16px;"><button class="search-btn"><b>CREATE</b></button></a>
			<br/><br/><br/>
					<table class="table table table-striped table-bordered table-hover list" id="mydata">
						
						<thead>
							<tr>
								
								<th>FIRST NAME</th>
								<th>LASTNAME</th>
								<th>USERNAME</th>
								<th>PASSWORD</th>
								<th>ROLE</th>
								<th>CONTACT</th>
								<th>RELATIVE</th>
								<th>EDIT</th>
								<th>DELETE</th>
								<th>STATUS</th>
							</tr>
						</thead>
							<tfoot>
							<tr>
								
								<th>FIRST NAME</th>
								<th>LASTNAME</th>
								<th>USERNAME</th>
								<th>PASSWORD</th>
								<th>ROLE</th>
								<th>CONTACT</th>
								<th>RELATIVE</th>
								<th>EDIT</th>
								<th>DELETE</th>
								<th>STATUS</th>
							</tr>
						</tfoot>

					<c:forEach items="${list}" var="u">
						<tr >
							
							<td>${u.getFname()}</td>
							<td>${u.getLname()}</td>
							<td>${u.getUname()}</td>
							<td>${u.getPassword()}</td>
							<td>${u.getRole()}</td>
							<td>${u.getContact()}</td>
							<td>${u.getRelative()}</td>
							<td><a href="edituser.jsp?id=${u.getId()}"><img src="../image/icon/edit.png" height="30" width="30"></a></td>
							<td><a href="deleteuser.jsp?id=${u.getId()}"><img src="../image/icon/delete.png" height="30" width="30"></a></td>
							<td>
								<c:if test="${signupDao.isUserBlocked(u)}">
									<a href="blocked_users.jsp?id=${u.getId()}&b=unblock">
									<img src="../image/icon/lock.svg" height="30" width="30">
									</a>
								</c:if>
								<c:if test="${!signupDao.isUserBlocked(u)}">
								
									<a href="blocked_users.jsp?id=${u.getId()}&b=block">
									<img src="../image/icon/lock-open.svg" height="30" width="30">
									</a>
									
								</c:if>
								
							</td>
							
						</tr>
						</c:forEach>
						
					</table>
					
				
	</div>
	  <!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
     <script src="../datatables/js/jquery.js"></script>
    <!-- Include all compiled plugins (below), or include individual files as needed -->
    <script src="../datatables/js/bootstrap.min.js"></script>
	<script src="../datatables/js/jquery.dataTables.min.js"></script>
	<script src="../datatables/js/dataTables.bootstrap.min.js"></script>
	<script>
	$('#mydata').dataTable();
	
	</script>
	<br/><br>
	  <jsp:include page="footer.jsp"></jsp:include>
</body>
</html>