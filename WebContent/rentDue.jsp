<%@page import="java.sql.ResultSet"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="src.Methods"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Rent Details</title>

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
	<%! Methods m = new Methods();%>
	
	<!-- navigation Bar START-->

			<nav class="navbar navbar-inverse" style="background-color: olive;">
				<div class="container">

					<div class="navbar-header ">
						<div class="navbar-brand">
							<h1 style="color: white;">${username}
								<small style="color: inactivecaption;">(Owner)</small>
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
							<li><a href="landingPage.jsp">Home</a></li>

							<li class="dropdown">
							<a class="dropdown-toggle" data-toggle="dropdown">Help <span class="caret"></span></a>
								<div class="dropdown-menu">
									<div class="well text-info text-center">
										<p>Hi this is sample text for an idea</p>
										<p>This is second line for more idea</p>
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
	
	
	<div class="container-fluid">											<!--  Container 2 start -->
		<div class="row">													<!--  Row 2 start -->
			<div class="col-md-2 col-xs-4">									<!-- COL 1 -->
			<div class="input-group">
				<div class="list-group">
					<a href="landingPage.jsp" class="list-group-item list-group-item-warning list-group-item-action "> Update / Remove </a> 
					<a href="TenantRegistration.jsp" class="list-group-item list-group-item-warning list-group-item-action">Register</a> 
					<a href="#" class="list-group-item list-group-item-warning list-group-item-action active">View</a>
				</div>
				</div>
			</div>
			<div class="col-md-3 col-xs-8">
				<div class="input-group">
					<div class="list-group ">
							<div class=" list-group-item list-group-item-info">
								<div class="text-center info">Current Month</div>
							</div>
							<input type="button" class="form-control" data-toggle="collapse" data-target="#rentdue" value="Rent Due">
							
							<input type="button" class="form-control" data-toggle="collapse" data-target=#PaymentHistory value="Payment Details">
		
					</div>			
				</div>
			</div>	
			
			<div class="col-xs-0"></div>
			
			<div class="  col-md-5 col-xs-12 collapse" id="rentdue">
				
				<table class="table table-bordered table-hover table-condensed" >
					<tr class="text-center info ">
						<td>Room_No</td>
						<td>Tenant Id</td>
						<td>Date</td>
						<td>Meter Bill</td>
						<td>Rent</td>
						<td>Total Amount</td>
					</tr>
					<% ResultSet rs=null;
						int room_no=0;
						int tenant_id;
						rs=m.rentDue();	
						while(rs.next())
						{
							tenant_id=rs.getInt(1);
							room_no=m.getRoomNo(tenant_id);
					%>
					<tr class="text-center  ">
						<td class="danger"><%=room_no%></td>
						<td><%=rs.getInt(1) %></td>
						<td><%=rs.getDate(2)%></td>
						<td><%=rs.getDouble(3) %></td>
						<td><%=rs.getInt(4) %></td>
						<td><%=rs.getDouble(5) %></td>
					</tr>
					<% } %>
				</table>
			</div>
			
			<div class="col-xs-0"></div>
			
			<div class="  col-md-5 col-xs-12 collapse" id="PaymentHistory">
				
				<table class="table table-bordered table-hover table-condensed" >
					<tr class="text-center info ">
						<td>Room_No</td>
						<td>Payment Id</td>
						<td>Tenant Id</td>
						<td>Amount</td>
						<td>Date</td>
					</tr>
					<%  rs=null;
						room_no=0;
						tenant_id=0;
						rs=m.paymentHistory();					
						while(rs.next())
						{
							tenant_id=rs.getInt(2);
							room_no=m.getRoomNo(tenant_id);
					%>
					<tr class="text-center  ">
						<td><%=room_no %></td>
						<td><%=rs.getInt(1) %></td>
						<td><%=rs.getInt(2)%></td>
						<td><%=rs.getDouble(3) %></td>
						<td><%=rs.getDate(4) %></td>
					</tr>
					<% } %>
				</table>
			</div>
		</div>																<!-- Row 2 End -->
	</div>
			




	<script src="js/jquery.min.js"></script>
	<script src="js/bootstrap.min.js"></script>
</body>
</html>