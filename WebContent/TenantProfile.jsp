<%@page import="java.sql.ResultSet"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="src.Methods"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
	<title>Tenant Profile</title>

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

	<!-- navigation Bar START-->

			<nav class="navbar navbar-inverse" style="background-color: olive;">
				<div class="container">

					<div class="navbar-header ">
						<div class="navbar-brand">
							<h1 style="color: white;">${username}
								<small style="color: inactivecaption;">(Tenant)</small>
							</h1>
						</div>
						<button type="button" class="navbar-toggle collapsed"
							data-toggle="collapse" data-target="#xyz">
							<span class="icon-bar"></span> <span class="icon-bar"></span> <span
								class="icon-bar"></span>
						</button>
					</div>

					<div class="collapse navbar-collapse" id="xyz">
						<ul class="nav navbar-nav navbar-right">
							<li class="active"><a href="#">Home</a></li>

							<li class="dropdown">
							<a class="dropdown-toggle" data-toggle="dropdown">Info <span class="caret"></span></a>
								<div class="dropdown-menu">
									<div class="well text-info text-center">
										<p>Deposit - 25000/-</p>
										<p>Electricity Rate -8/unit</p>
									</div>

								</div>
							</li>

							<li class="dropdown"><a class="dropdown-toggle" data-toggle="dropdown">LogOut</a>
								<div class="dropdown-menu">
									<div class="well  text-info">
										<p>Do You Confirm to LogOut?</p>
										<a class=" text-center text-danger"
											style="padding-right: 1cm;" href="LogOut"><b>Yes</b></a> 
											<a class=" text-center text-success" href="#"><b>No</b></a>
									</div>
								</div>
							</li>
						</ul>
					</div>

				</div>
			</nav>

		<!-- navigation Bar END -->

	<div class="container-fluid">								<!--  Container 2 start -->
		<div class="row">										<!--  Row 2 start -->
			<div class="col-md-2 col-xs-4">						<!-- COL 1 -->
				<div class="input-group">
					<div class="list-group">
						<a href="TenantProfile.jsp"
							class="list-group-item list-group-item-warning list-group-item-action active"> Profile </a> <a href="RentDetails.jsp"
							class="list-group-item list-group-item-warning list-group-item-action">Rent / Payments </a> <a href="MeterDetails.jsp"
							class="list-group-item list-group-item-warning list-group-item-action">Meter Details </a>
					</div>
				</div>
			</div>

			<div class="col-md-4 col-xs-8">
				<div class="panel panel-info">  								<!-- Panel start -->

					<div class="panel-heading">Update</div>
					
					<div class="panel-body">
					
						<form action="UpdateLoginDetails" method="get">
						
							<label for="pass"> Password </label>
							<div class=" input-group">
								<input class="form-control  " type="text" 
									id="pass" name="password" required> 
									<span class="input-group-addon"> 
										<input class=" btn btn-xs  "
											type="submit" value= =  >		
									</span>
							</div>
							</form>
						<form action="UpdateLoginDetails" method="post">	
							<br>
							<label for="no"> Contact </label>
							<div class=" input-group">
								<input class="form-control  " type="tel" 
									id="no" name="contact" required> 
									<span class="input-group-addon"> 
										<input class=" btn btn-xs  "
											type="submit" value= =  >		
									</span>
							</div>					
						</form>
					</div>
					<div class="panel-footer"></div>
				</div>
				</div>			
			</div>
	</div>







	<script src="js/jquery.min.js"> </script>
		<script src="js/bootstrap.min.js"> </script>
</body>
</html>