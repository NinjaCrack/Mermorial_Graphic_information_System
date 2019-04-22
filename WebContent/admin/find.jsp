
<!DOCTYPE html>
<html>
<head>
	<title>Find Grave</title>
	 	 <meta name="viewport" content="width=device-width, initial-scale=100">
	<link rel="icon" type="image/png" href="../image/logo.ico">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">

<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>

  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="main.css" type="text/css">

<link rel="stylesheet" href="../css/main.css" type="text/css">
<script>
function search() {
  // Declare variables 
  var input, filter, table, tr, td1, i;
  input = document.getElementById("search");
  filter = input.value.toUpperCase();
  table = document.getElementById("result");
  tr = table.getElementsByClassName("aResult");

  // Loop through all table rows, and hide those who don't match the search query
  if (filter === null || filter === ""){
	  for (i = 0; i < tr.length; i++){
		  tr[i].style.display = "none";
	  }
  } else {
	 for (i = 0; i < tr.length; i++) {
	    td1 = tr[i].getElementsByClassName("name")[0];
	    if (td1) {
	      if (td1.innerHTML.toUpperCase().indexOf(filter) > -1) {
	        tr[i].style.display = "";
	      } else {
	        tr[i].style.display = "none";
	      }
	    } 
	 }
  }
}
</script>
<style>
.aResult{
  border: 1px solid #ddd;
  margin-top: -1px; 	
  padding: 12px;
  font-size: 18px;
  color: black;
 
  
}
table{
	width:50%;
	float:center;
	
}

.aResult:hover{
background-color: rgba(240,248,255,0.8);

}
.aResult a:hover{
text-decoration: none;}

</style>
</head>
<body>
<header>
		<nav>	
			<ul>
			<li><a href="index.jsp" title="Back to home"><img src="../image/icon/home.png" width="30px" height="30px"/> home</a></li>
			<li><a href="burried.jsp" title="Burried Clients"><img src="../image/icon/buried.png" width="30px" height="30px"/> Buried client management</a></li>
			<li><a href="user_management.jsp" title="Buried Management"><img src="../image/icon/user.png" width="30px" height="30px"/>User Management</a></li>
			<li><a href="find.jsp" title="Map of Cemetery" class="active"><img src="../image/icon/find.png" width="30px" height="30px"/> Find Grave</a></li>
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

<div align="center">
	
	<input type="search" class="search" id="search" placeholder="Search Grave" size="50px" onkeyup="search()">
			
	<table cellspacing="10"  style="background-color:rgba(240,248,255,0.8);" id="result">
		
		<%@page import="com.Memorialsystem.Dao.*, com.Memorialsystem.tables.*, java.util.*" %>
		<% 
			int idOfBurried = 0;
			try{
				idOfBurried = Integer.parseInt(request.getParameter("id"));	
			}catch(Exception e){
				System.out.println(e);
			}
			
			buried deds = null;
			if (idOfBurried != 0){
				deds = buriedDao.getRecordById(idOfBurried);
			}
			request.setAttribute("deds", deds);
		%>
		<% 
			List<buried> buried = buriedDao.getAllRecords();
			request.setAttribute("buried", buried);
		%>
		<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
		
				<c:forEach items="${buried}" var="u">
				<tr class="aResult" style="display: none">
				<td>
					<table width="100%">
						<tr>
							<td><a href="find.jsp?id=${u.getId()}"><h2 class="name"> ${u.getfirst()}  ${u.getmiddle()} ${u.getlast()}</h2></a></td>
						</tr>
						<tr>
						<td>Year Born: ${u.getborn()}</td>
						</tr>
						<tr>
						<td>Year Died: ${u.getdied()}</td>
						</tr>
						<tr>
						<td>Location: ${u.getlocation()}</td>
						</tr>
					</table>
					</td>
					</tr>
				</c:forEach>
			
	</table>
</div>

<br>

<div align="center">
	<a>
		<img  src="../maps/<c:if test="${deds.getlocation() != null}">${deds.getlocation()}</c:if><c:if test="${deds.getlocation() == null}">default</c:if>.png" width="802" height="960" usemap="1">
 	<map name="1" id="1">
 	<c:forEach var="i" begin="1" end="315">
<area coords="${modalDao.getCoordinate(i)}"  href="" data-toggle="modal" data-target="#myModal${i}">
		<div class="modal fade" id="myModal${i}" role="dialog">
		    <div class="modal-dialog">
		      <!-- Modal content-->
		          <button type="button" class="close" data-dismiss="modal"></button>
		        <div class="modal-body">   
		<img alt="" src="../land_maps/${i}.jpg" width="600" height="500">
			</div>        
		        </div>
		      </div>
</c:forEach>
</map>
	</a>
	</div>
	<br>
 <jsp:include page="footer.jsp"></jsp:include>
</body>
</html>