<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>About</title>
<link rel="stylesheet" href="css/bootstrap.min.css">
	<link rel="stylesheet" href="css/styles.css" type="text/css" />
	<meta name="viewport" content="width=device-width=, inital-scale=1.0">

</head>
<body>
	<!-- navigation Bar -->
	<nav  class="navbar navbar-inverse" style="background-color: olive;">  
		<div class="container">
			
			<div class="navbar-header ">
				<div class="navbar-brand">
					<a style="color: white;"> ${username}</a>
				</div>	
				<button class="navbar-toggle" data-target="#xyz" data-toggle="collapse">
					<span class="icon-bar"></span>
					<span class="icon-bar"></span>
					<span class="icon-bar"></span>
				</button>
			</div>
			
			<div class="collapse navbar-collapse" id="xyz"> 
				<ul class="nav navbar-nav navbar-right">
					<li ><a href="TenantLandingPage.jsp">Home</a></li>			
					<li class="dropdown">
						<a class="dropdown-toggle" data-toggle="dropdown" href="#">About</a>
							<ul class="dropdown-menu">
								<li><a href="#">Our Locations</a>
								<li><a>Service</a></li>
								<li><a>Shops</a></li>
							</ul>
					</li>					
					<li><a href="#">History</a></li>
					<li class="active"><a href="About.jsp" >Help</a></li>
					<li><a href="LogOut">LogOut</a></li>
				</ul>
			
			</div>
	
		</div>
	</nav>
 		<!-- navigation Bar -->




<h1>
Ramchandra Niwas,Kharadi ,Pune-14.</h1>





	<script src="js/jquery.min.js"> </script>
	<script src="js/bootstrap.min.js"> </script>
</body>
</html>