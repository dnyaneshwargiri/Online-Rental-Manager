<%@page import="javafx.scene.control.Alert"%>
<%@page import="src.Methods"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<%@page import="java.sql.*"%>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">	
	<title> Tenant Registration </title>
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
	<%! Methods m=new Methods(); %>

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
							<div class="dropdown-menu ">
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

	<div class="container-fluid">									<!-- Container 1 start -->
		<div class="row">									<!-- Row 1 start -->

			<div class="col-md-2 col-xs-4">
				<!-- COL 1 -->
			<div class="input-group">	
				<div class="list-group">
					<a href="landingPage.jsp" class="list-group-item list-group-item-warning list-group-item-action "> Update / Remove </a> 
					<a href="TenantRegistration.jsp" class="list-group-item list-group-item-warning list-group-item-action active">Register</a> 
					<a href="rentDue.jsp" class="list-group-item list-group-item-warning list-group-item-action">View</a>
				</div>
			</div>
			</div>

			<div class="col-md-4 col-xs-8" > 								<!-- COL 2 -->
				<table class="table table-bordered table-hover table-condensed"
					style="border-style: double;">
					<tr class="success">
						<div class="list-group-item list-group-item-info text-center">
							Available Rooms
						</div>
						
					</tr>

					<%
						int i,j,k;
						String rs[]=new String[9];
						rs= m.getAvailable_rooms();
						for(i=0,j=3,k=6;i<3 && j<6&&k<9;i++,j++,k++)
						{
							if(!rs[i].isEmpty()||!rs[j].isEmpty()||!rs[k].isEmpty())
							{
					%>
					<tr>
						<td><%= rs[i]%></td>	
						<td><%= rs[j]%></td>
						<td><%= rs[k]%></td>
					</tr>	
					<%
							}
						}
					%>
					
				</table>
			</div>
			
			<div class="col-md-2 col-xs-0"> </div>
		
			<div  class="col-md-4 col-xs-12">				<!-- COL 3 -->
				<div class="panel panel-success">			<!-- Panel start -->

					<div class="panel-heading">Create New Tenant</div>

					<div class="panel-body">
						<form action = "TenantRegistraion" method="post">
				          
							<label for="roomno">Room No</label>
							<div class=" input-group">
								<input class="form-control " type="num" placeholder="e.g. 101" data-toggle="collapse" id="roomno" name="roomno" required>			
								<span class="input-group-addon">
								<i class="glyphicon glyphicon-text-width"></i></span>
							</div>
							<br>
							<label for="uname">User Name</label>
							<div class=" input-group">
								<input class="form-control "  type="text" placeholder="e.g. Sanket" id="uname" name="uname" required>
								<span class="input-group-addon">
								<i class="glyphicon glyphicon-user"></i></span>
							</div>

							<br>
							<label for="lname">Last Name</label>
							<div class=" input-group">	
								<input class="form-control "  type="text" placeholder="e.g. Sanap" id="lname" name="lname" required>
								<span class="input-group-addon">
								<i class="glyphicon glyphicon-user"></i></span>
							</div>
							<br>
							<label for="email">Email Id</label>
							<div class=" input-group">
								<input class="form-control  " type="email" placeholder="e.g name@gmail.com" id="email" name="emailid" required>
								<span class="input-group-addon">
								<i class="glyphicon glyphicon-log-in"></i></span>
							</div>
							<br>
							<label for="contact">Contact No.</label>
							<div class=" input-group">
								<input class="form-control " type="tel" placeholder="e.g. 9876543210" id="contact" name="contactno" required>
								<span class="input-group-addon">
								<i class="glyphicon glyphicon-phone"></i></span>
							</div>
							<br>
							<label for="rent">Rent</label>
							<div class=" input-group">
								<input class="form-control "  type="tel" placeholder="e.g. 8000" id="rent" name="rent" required>	
								<span class="input-group-addon">$</span>
							</div>
							<br>
							<input class="form-control btn btn-success" type="submit" onclick="notice()" value="Submit">
						
						</form>	
					</div>
					
					<div class="panel-footer">
							<p class="text-center text-danger">Check All Details and Submit</p>
					</div>
			
				</div>	
			</div>															<!-- Panel End -->	

	</div>																	<!-- ROW 1 END -->																	
	
	</div>																	<!-- Container 1 End -->

	<script type="text/javascript">
	 
	 function showhide(id) {
	       	var e = document.getElementById(id);
	       	e.style.display = (e.style.display == 'block') ? 'none' : 'block';
	     }
	</script>

	<script src="js/jquery.min.js"> </script>
	<script src="js/bootstrap.min.js"> </script>
</body>
</html>