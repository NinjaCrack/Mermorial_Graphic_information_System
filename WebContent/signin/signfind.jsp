<!DOCTYPE html>
<html>
<head>
	<title>Find Grave</title>
	 	 <meta name="viewport" content="width=device-width, initial-scale=1">
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
			<li><a href="signin.jsp" title="Back to home"><img src="../image/icon/home.png" width="30px" height="30px"/> home</a></li>
			
			<li><a href="signfind.jsp" title="Map of Cemetery" class="active"><img src="../image/icon/find.png" width="30px" height="30px"/> Find Grave</a></li>
			<li><a href="signabout.jsp" title="Who are we"><img src="../image/icon/about.png" width="30px" height="30px"/> About Us</a></li>

			<li style="float:right">
			 	<a href="../signin/signup.jsp"> <button type="button"   class="signup">Sign up </button></a>
			</li>
			<li style="float:right">
			 <div>
  <!-- Trigger the modal with a button -->
  <button type="button" class="sign" data-toggle="modal" data-target="#myModal">Sign in</button>
  <!-- Modal -->
  <div class="modal fade" id="myModal" role="dialog">
    <div class="modal-dialog">
      <!-- Modal content-->
      <div class="modal-content" id="modal">
        <div class="modal-header">
          <h4>Sign in</h4>
          <button type="button" class="close" data-dismiss="modal">&times;</button>
        </div>
        <div class="modal-body">  
	<table align="center">
	<tr>
	<td Style="font-size:30px" align="center">St. John Cemetery San Juan</td>
	</tr>
		<td align="center"><b>Mermorial Park Geographic Information System</b></td>
	</table>
	</br>
	<form action="../login.jsp" class="form-horizontal">
	<div class="form-group">
		<label class="col-sm-1 control label" for="InputEmail3">
	</label>
	<div class="col-sm-10">
	<input type="text" class="form-control" id="InputEmail3" placeholder="Username" name="username" required>
	</div>
	</div>
	<div class="form-group">
<label class="col-sm-1" for="InputPassword3">
	</label>
	<div class="col-sm-10">
	<input type="password" class="form-control" id="InputPassword3" placeholder="Password" name="password" required>
</div>
</div>
		<div class="form-group">
		<div class="col-sm-offset-1 col-sm-10"> 
		
	<div class="checkbox">
		<label>
		
		</label>
			</div>
		</div>
	</div>
	<div class="form-group">
		<div class="col-sm-offset-8 cols-sm-10">
	<button type="submit" class="btn btn-default" value="Sign in">Sign in</button>
	</div>
	</div>
</form>
	
	</div>
        <div class="modal-footer">
          <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
        </div>
        </div>
      </div>
    </div>
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
							<td><a href="signfind.jsp?id=${u.getId()}"><h2 class="name"> ${u.getfirst()}  ${u.getmiddle()} ${u.getlast()}</h2></a></td>
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