<%@page import="org.apache.tomcat.util.descriptor.web.ErrorPage"%>
<%@page import="src.Methods"%>
<%@page import="src.TenantTableData"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<%@page import="java.sql.*"%>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
	<title>Tenant Update</title>	
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
	<%! Methods m =new Methods();
		ResultSet rs=null;
	%>
	
	<%
	ArrayList<TenantTableData> ttDatalist = new ArrayList<TenantTableData>();
	int room_no,tenant_id,meter;
	String first_name,last_name;
	int lastmonth;
	int index = Integer.parseInt(request.getParameter("rowid"));
	
	ttDatalist = m.Display_All();
	room_no=ttDatalist.get(index).getRoom_no();
	tenant_id=ttDatalist.get(index).getTenant_id();
	first_name=ttDatalist.get(index).getFirstname();
	last_name=ttDatalist.get(index).getLastname();
	meter=ttDatalist.get(index).getMeterNo();
	
	lastmonth=m.getlastmonth(meter);
	session.setAttribute("Rowid", index);
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

	<div class="container-fluid">											<!-- Container 1 start -->
		<div class="row">													<!-- Row 1 start -->	
			<div class="col-md-12 col-xs-12" >
				<div class="well text-info " >	
					<div class="row">
						<div class="col-md-4 col-xs-12">
							<div class="text-center">
								<h4>	Meter No	-<%=  meter %>	</h4>
								<h4>	Tenant Id	-<%=  tenant_id %></h4>
							</div>
						</div>
						<div class="col-md-4 col-xs-12">
							<div class="text-center">
								<h4>	Room No	-<%=  room_no %>	</h4>
							</div>
						</div>
						<div class="col-md-4 col-xs-12">	
							<div class="text-center">
								<h4>	First Name	-<%=  first_name %></h4>
								<h4>	Last Name	-<%=  last_name%></h4>
							</div>
						</div>				 
					</div>	
				</div>
			</div>
		</div>																<!-- ROW1 END -->

		<div class="row">
			<!-- ROW 2 -->
			<div class=" col-md-0 col-xs-4"></div>
			<div class="col-md-4 col-xs-8">
				<div class="panel panel-warning">
					<!-- Panel start -->

					<div class="panel-heading">Update Rent</div>

					<div class="panel-body">
						<form action="Update" method="get">

							<label for="rent">Enter New Rent </label>
							<div class=" input-group">
								<input class="form-control  " type="tel" placeholder="e.g.12000"
									id="rent" name="rent" required> <span
									class="input-group-addon"> <i
									class="glyphicon glyphicon-tag"></i></span>
							</div>
							<br> <input class="form-control btn btn-warning"
								type="submit" onclick="checkRent();" value="Submit">
						</form>
					</div>

				</div>


			</div>
			<!-- COLL 1 -->
			<div class=" col-xs-4"></div>
			<div class="col-md-4 col-xs-8">
				<!-- COL 2 -->
				<div class="panel panel-warning">
					<!-- Panel start -->

					<div class="panel-heading">Update</div>

					<div class="panel-body">
						<form action="Update" method="post">

							<label for="reading">Current Meter Reading </label>
							<div class=" input-group">
								<input class="form-control  " type="tel" placeholder=<%= m.getLastReading(meter,lastmonth) %>
									id="reading" name="meter_reading" required> <span
									class="input-group-addon"> <i
									class="glyphicon glyphicon-tag"></i></span>
							</div>
							<br> <input class="form-control btn btn-warning"
								type="submit" onclick="check();" value="Submit">
						</form>
					</div>


				</div>
				<!-- Panel END -->

			</div>
			<div class="col-md-0 col-xs-4"></div>

			<div class="col-md-4 col-xs-8">										<!-- COL 3 -->

				<div class="panel panel-success">								<!-- Panel start -->
					<div class="panel-heading">Make Payment</div>

					<div class="panel-body">
						<form action="MakePayment" method="post">
						
							<label for="amount">Enter Amount </label>
							<div class=" input-group">
								<input class="form-control  " type="tel" placeholder="e.g.8800"
									id="PaymentAmount" name="rentAmount"  required> 
								<span class="input-group-addon"> 
								<i class="glyphicon glyphicon-tag"></i></span>
							</div>
							<br> 
							<input class="form-control btn btn-success" type="submit" onclick="addRent();" value="Submit">
						</form>	
					</div>
				</div>
					  
			</div>
		</div>


		<div class="col-md-0 col-xs-4"> </div>
			<div class="col-md-4 col-xs-8">									<!-- COL 3 -->
				<div class="panel panel-danger">							<!-- Panel start -->
				
					<div class="panel-heading">Remove Account</div>
					
						<div class="panel-body">
						
							<div class="dropdown" align="right">
								<button  class=" btn btn-danger   dropdown-toggle"  data-toggle="dropdown" type="button" id="remove">Remove </button>
									<div class="dropdown-menu " id="remove">
										<div class="well  text-info">
											<p>Do You Confirm to Delete this Account ?</p>	
											<a class=" text-center text-danger" style="padding-right: 1cm;" href="TenantRemove" method="post"><b>Yes</b></a> 
											<a class=" text-center text-success" href="#"><b>No</b></a>	
										</div>						
									</div>
							</div>		
						</div>
	
				</div>				
			</div>
		</div>																	<!-- ROW 2 END -->
		
		<div class="row">
			<div class="col-md-2">
			  
			</div>
		
		</div>
																				<!-- Container 1 END -->

	<script type="text/javascript">
		function addRent()
		{
			var dueRent=document.getElementById('PaymentAmount');
	
			if(dueRent.value<=0)
			{
				alert("Check Rent Again!!!");
				
			}	
			
			var ans="yes";

			var flag="<%=m.is_paid(tenant_id)%>";
			
			var fin=flag.localeCompare(ans);
			
			if(fin==0)
				{
					alert("Already Paid !!!");
				}
			
			var currentRent=<%=m.getrent(tenant_id)%>;	
			
			if((currentRent != dueRent.value))
				{
					alert("Incomplete Amount !!!");
				}
		
		
		}	
	</script>

	<script type="text/javascript">
		
	function checkRent()
	{
		
		var rent=document.getElementById('rent').value;
		if(rent<=0)
			{
				alert("Check Rent Again !!!");
			}else
				{
				 	alert("New Rent Updated Successfully");
				}
	}
	
	</script>

	<script type="text/javascript">
		function check()
		{
			var current=document.getElementById('reading');
			var last=<%= m.getLastReading( meter,lastmonth) %>
			if (current.value < last) 
			{	
				alert("Invalid Meter Reading");
			}
		}
	</script>

	<script src="js/jquery.min.js"> </script>
	<script src="js/bootstrap.min.js"> </script>
</body>
</html>