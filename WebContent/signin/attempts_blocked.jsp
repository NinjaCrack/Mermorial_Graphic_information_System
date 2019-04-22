<%
	int attempts;
	String account;
	try{
		attempts = Integer.parseInt(request.getParameter("attempts"));
		account = request.getParameter("account");
	} catch (Exception e){
		attempts = 0;
		account = "";
	}
%>

<!DOCTYPE html>
<html>
<head>
	<title>St. John Memorial Park</title>
	 <meta name="viewport" content="width=device-width, initial-scale=1">
	<link rel="icon" type="image/png" href="../image/logo.ico">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>

  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="../css/main.css" type="text/css">

<script type="text/javascript">
    $(window).on('load',function(){
        $('#myModal').modal('show');
    });
</script>
</head>
<body>
<header>
		<nav>	
			<ul>
			<li><a href="signin.jsp" title="Back to home" class="active"><img src="../image/icon/home.png" width="30px" height="30px"/> home</a></li>
						<li><a href="signfind.jsp" title="Map of Cemetery"><img src="../image/icon/find.png" width="30px" height="30px"/> Find Grave</a></li>
			<li><a href="signabout.jsp" title="Who are we"><img src="../image/icon/about.png" width="30px" height="30px"/> About Us</a></li>

			<li style="float:right">
			 	<a href="../signin/signup.jsp"> <button type="button"  class="signup">Sign up </button></a>
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
	<td Style="font-size:30px" align="center">St. John Cemetery SanJuan</td>
	</tr>
		<td align="center"><b>Memorial Park Geographic Information System</b></td>
	</table>
	</br>
	<form action="../login.jsp?account=<%=account%>&attempts=<%=attempts%>" method="post" class="form-horizontal">
	
	<div class="alert alert-danger alert-dismissible fade show" role="alert">

  <strong>sorry!</strong> your account was currently blocked for some various reason.<br><br>Please wait for the admin to unblock it
</div>
	<div class="form-group">
		<label class="col-sm-1 control label" for="InputEmail3">
	</label>
	<div class="col-sm-10">
	<input type="text" class="form-control" id="InputEmail3" name="username" placeholder="Username" required>
	</div>
	</div>
	<div class="form-group">
<label class="col-sm-1" for="InputPassword3">
	</label>
	<div class="col-sm-10">
	<input type="password" class="form-control" name="password" id="InputPassword3" placeholder="Password" required>
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
</br>
<div id="myCarousel" class="carousel slide" data-ride="carousel" align="center">
  <!-- Indicators -->
  <ol class="carousel-indicators">
    <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
    <li data-target="#myCarousel" data-slide-to="1"></li>
    <li data-target="#myCarousel" data-slide-to="2"></li>
    <li data-target="#myCarousel" data-slide-to="3"></li>
    <li data-target="#myCarousel" data-slide-to="4"></li>
    <li data-target="#myCarousel" data-slide-to="5"></li>
    <li data-target="#myCarousel" data-slide-to="6"></li>
    <li data-target="#myCarousel" data-slide-to="7"></li>
    <li data-target="#myCarousel" data-slide-to="8"></li>
    <li data-target="#myCarousel" data-slide-to="9"></li>
  </ol>

  <!-- Wrapper for slides -->
  <div class="carousel-inner">
    <div class="item active">
      <img src="../image/pic1.jpg" alt="St. John Cemetery" width="700px">
    </div>

    <div class="item">
      <img src="../image/pic2.jpg"  alt="St. John Cemetery" width="400px">
    </div>

    <div class="item">
      <img src="../image/pic3.jpg"  alt="St John Cemetery" width="400px">
    </div>
    <div class="item">
      <img src="../image/pic4.jpg"  alt="St John Cemetery" width="700px">
    </div>
    <div class="item">
      <img src="../image/pic5.jpg"  alt="St John Cemetery" width="400px">
    </div>
    <div class="item">
      <img src="../image/pic6.jpg"  alt="St John Cemetery" width="700px">
    </div>
    <div class="item">
      <img src="../image/pic7.jpg"  alt="St John Cemetery" width="700px">
    </div>
    <div class="item">
      <img src="../image/pic8.jpg"  alt="St John Cemetery" width="400px">
    </div>
    <div class="item">
      <img src="../image/pic9.jpg"  alt="St John Cemetery" width="400px">
    </div>
    <div class="item">
      <img src="../image/pic10.jpg"  alt="St John Cemetery" width="700px">
    </div>
  </div>

  <!-- Left and right controls -->
  <a class="left carousel-control" href="#myCarousel" data-slide="prev">
    <span class="glyphicon glyphicon-chevron-left"></span>
    <span class="sr-only">Previous</span>
  </a>
  <a class="right carousel-control" href="#myCarousel" data-slide="next">
    <span class="glyphicon glyphicon-chevron-right"></span>
    <span class="sr-only">Next</span>
  </a>
</div>
<br/>

<article><pre style="font-size:20px;background-color: rgba(240,248,255,0.8)">
			St  John Cemetery is the only public cemetery in San Juan city that is newly 
		renovated and secured government approved facility; a facility that is specifically designed
		 and improved with the needed facility for a public cemetery services.

		The cemetery offer services such as sale of graves, plots and other spaces, cemetery maintenance
		 and upkeep, mausoleum operation, crematory operation and other related services.
		St John cemetery is owned by public government thru the donations of Mayor Ibona administration 
		and Ortigas company, the public cemetery are going to be a customer-centric cemetery that will 
		arrange services in accordance with the wishes of surviving friends and family of the deceased. 

		We will go all the way out to give our clients a lasting and pleasant memory of their bereaved 
		family members and friend. St John Cemetery also has a slot for World War II veterans and 
		currently improving its service more on Technology being up to date cause now you can easily 
		find grave thru internet making it easier for others to find missing grave

</pre> </article>
</body>
</html>