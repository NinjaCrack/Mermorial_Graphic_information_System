<%@page import="com.Memorialsystem.Dao.*,com.Memorialsystem.tables.*" %>

<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
	<title>Buried Clients</title>
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
			<li><a href="relatives_index.jsp" title="Back to home"><img src="../image/icon/home.png" width="30px" height="30px"/> home</a></li>
			<li><a href="relatives_buried.jsp" title="Burried Clients" class="active"><img src="../image/icon/list.png" width="30px" height="30px"/> list Of Buried</a></li>
			<li><a href="relatives_find.jsp" title="Map of Cemetery"><img src="../image/icon/find.png" width="30px" height="30px"/> Find Grave</a></li>
			<li><a href="relatives_about.jsp" title="Who are we"><img src="../image/icon/about.png" width="30px" height="30px"/> About Us</a></li>
			
	<li style="float:right">
						<div class="dropdown-header">
							<img src="../image/icon/account.png" width="30px" height="30px"/>
							<button id="label" type="button" data-toggle="dropdown" aria-haspopup="true" aria-epanded="false" class="btn-primary"> 
								My Account
								<span class="caret"></span>
							</button>
							<ul class="dropdown-menu" aria-labelledby="dlabel">
							<a href="../signout.jsp">
							<img src="../image/icon/logout.png" width="30px" height="30px"/>Sign Out</a>
							<a href="relative_edit_profile.jsp">
							<img src="../image/icon/settings.png" width="30px" height="30px"/>Profile</a></ul>
						</div>
					</li>
		</ul>
		</nav>
</header>
	<br/>
	<div class="container list">
	<%@ page import="com.Memorialsystem.Dao.buriedDao,com.Memorialsystem.tables.buried,java.util.*"%>
		<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
			<%List<buried> list=buriedDao.getAllRecords();
			  request.setAttribute("list",list);
			%>
			<h2>LIST OF BURIED</h2>
			
			<br/><br/>
					<table  class="table table table-striped table-bordered table-hover list" id="mydata">
						
						<thead>
								<tr>		
							
									<th>FIRST NAME</th>
									<th>MIDDLE NAME</th>
									<th>LAST NAME</th>
									<th>DATE BORN</th>
									<th>DATE DIED</th>
									<th>LOCATION</th>												
								</tr>
						</thead>
						<tfoot>
								<tr>		
							
									<th>FIRST NAME</th>
									<th>MIDDLE NAME</th>
									<th>LAST NAME</th>
									<th>DATE BORN</th>
									<th>DATE DIED</th>
									<th>LOCATION</th>												
								</tr>
						</tfoot>
						<tbody>
								<c:forEach items="${list}" var="u">
									<tr>
										
										<td>${u.getfirst()}</td>
										<td>${u.getmiddle()}</td>
										<td>${u.getlast()}</td>
										<td>${u.getborn()}</td>
										<td>${u.getdied()}</td>
										<td>${u.getlocation()}</td>
									</tr>
								</c:forEach>
						</tbody>
					</table>
	</div>
<div class="container list">
		<%@ page import="com.Memorialsystem.Dao.buriedDao,com.Memorialsystem.tables.buried,java.util.*"%>
				
						
							
		<h2>VACANT GRAVE AND PRICES</h2>
	<table class="table-striped table-bordered table-hover list" id="vacant">
	 	
			<thead>
			<tr>
							<th style="text-align:center;"> LOCATION </th>
							<th style="text-align:center;"> AREA </th>
							<th style="text-align:center;"> PRICE </th>
							<th style="text-align:center;"> VACANT </th>
							
				</tr>
				</thead>
					<tfoot>
			<tr>
							<th style="text-align:center;">	LOCATION </th>
							<th style="text-align:center;"> AREA </th>
							<th style="text-align:center;"> PRICE </th>
							<th style="text-align:center;"> VACANT </th>
				</tr>
				</tfoot>
				<tbody style="text-align:center;">	
				<%
										 List<grave> grave = graveDao.getAllRecords();
										 request.setAttribute("grave", grave);
										 
										%>
							<c:forEach items="${grave}" var="u">
									<tr>
										<td>Location ${u.getId()}</td> 
										<td>${u.getArea()} sq. meter</td>
										<td>Php ${u.getPrice()}</td>
										<td>Vacant Slots: ${2 - buriedDao.countburied(u.getId())}</td>
									</tr>	
							</c:forEach>									
							
				</tbody>
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
		<script>
	$('#vacant').dataTable();
	
	</script>
	<br><br>
 <jsp:include page="footer.jsp"></jsp:include>
</body>
</html>