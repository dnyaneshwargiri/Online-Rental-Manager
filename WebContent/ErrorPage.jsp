<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Error Page</title>

<link rel="stylesheet" href="css/bootstrap.min.css">
<link rel="stylesheet" href="css/styles.css" type="text/css" />
<meta name="viewport" content="width=device-width=, inital-scale=1.0">
</head>
<body>

	<%
		if (session.getAttribute("username") == null) {
			response.sendRedirect("index.html");
		}
	%>

<!-- navigation Bar START -->

	<nav  class="navbar navbar-inverse" style="background-color: olive;">  
		<div class="container">
			
			<div class="navbar-header ">
				<div class="navbar-brand">
					<h1 style="color: white;">${username} <small style="color:inactivecaption;">(Owner)</small> </h1>
				</div>	
				<button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#xyz" >
					<span class="icon-bar"></span>
					<span class="icon-bar"></span>
					<span class="icon-bar"></span>
				</button>
			</div>
			
			<div class="collapse navbar-collapse" id="xyz"> 
				<ul class="nav navbar-nav navbar-right">
					<li><a href="landingPage.jsp">Home</a></li>	
							
					<li class="dropdown">
						<a class="dropdown-toggle" data-toggle="dropdown">Help  <span class="caret"></span></a>
							<div class="dropdown-menu">
								<div class="well text-info text-center">
									<p>Hi this is sample text for an idea </p>
									<p>This is second line for more idea</p>
								</div>
							
							</div>
					</li>
									
					<li class="dropdown">
						<a class="dropdown-toggle" data-toggle="dropdown">LogOut</a>
							<div class="dropdown-menu">
								<div class="well  text-info">
									<p>Do You Confirm to LogOut?</p>
									<a class=" text-center text-danger" style="padding-right: 1cm;" href="LogOut"><b>Yes</b></a> 
									<a class=" text-center text-success" href="#"><b>No</b></a>
								</div>
							</div>
					</li>
					
				</ul>
			
			</div>
	
		</div>
	</nav>
	
<!-- navigation Bar END-->

	<div class="container">
		<div class="row">													<!-- ROW 1 START -->
			<div class="col-md-8 col-xs-12">											<!-- COL 1 -->
			<div class=" list-group ">
				<p class=" list-group-item text-danger list-group-item-danger"><b>Oops !!!</b>   <small>Something Went Wrong . . .</small></p>	
			</div>
			</div>									
												
			
		</div>																<!-- ROW 1 END -->
	
	</div>																	<!-- Container 1 END -->

	<div class="container">
		<div class="row">
			<div class="col-md-8">
				<a class="btn btn-warning" href="landingPage.jsp">Try Again</a>
			</div>
			<div class="col-md-4"></div>
		</div>
	
	</div>
	

	<script src="js/jquery.min.js"> </script>
	<script src="js/bootstrap.min.js"> </script>

</body>
</html>