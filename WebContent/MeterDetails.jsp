<%@page import="java.sql.ResultSet"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="src.Methods"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
	<title>Meter Details</title>

	<link rel="stylesheet" href="css/bootstrap.min.css">
	<link rel="stylesheet" href="css/styles.css" type="text/css" />
	<meta name="viewport" content="width=device-width=, inital-scale=1.0">
	
</head>
<body>

	<%
		if (session.getAttribute("username") == null) {
			response.sendRedirect("index.html");
		}
		
		Methods m = new Methods();
		ResultSet rs = null;
		int tenant_id=0;
		int room_no=0;
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
							<li ><a href="#">Home</a></li>

							<li class="dropdown">
							<a class="dropdown-toggle" data-toggle="dropdown">Info
							 <span class="caret"></span></a>
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

	<div class="container-fluid">											<!--  Container 2 start -->
		<div class="row">													<!--  Row 2 start -->
			<div class="col-md-2 col-xs-4">									<!-- COL 1 -->
				<div class="input-group">
					<div class="list-group">
						<a href="TenantProfile.jsp" class="list-group-item list-group-item-warning list-group-item-action ">Profile </a> 
						<a href="RentDetails.jsp" class="list-group-item list-group-item-warning list-group-item-action ">Rent / Payments</a>
						<a href="MeterDetails.jsp" class="list-group-item list-group-item-warning list-group-item-action active">Meter Details </a>
					</div>
				</div>
			</div>
			
			<div class="col-md-4 col-xs-8"> 
				
				<table class="table table-bordered table-hover table-condensed">
					<tr class="success">
						<div class="list-group-item list-group-item-success text-center">
							Current Month  Meter
						</div>
					</tr>
					<tr class="text-center info ">
						<td>Date</td>
						<td>Reading</td>
						<td>Units</td>
						<td>Bill Amount</td>
					</tr>
					<%	
						room_no=(int) session.getAttribute("Room_no");
						tenant_id=(int)session.getAttribute("Tenant_id");
						rs = m.ShowCurrentMeter(room_no,tenant_id);
						while (rs.next()) {
					%>
					<tr class="text-center  ">
						<td><%=rs.getDate(1)%></td>
						<td><%=rs.getInt(2)%></td>
						<td><%=rs.getInt(3)%></td>
						<td><%=rs.getDouble(4) %></td>
					</tr>
					<%
						}
					%>
				</table>
			</div>
			
			<div class="col-md-0 col-xs-4"></div>
			
			<div class="col-md-4 col-xs-8">
				
				<table class="table table-bordered table-hover table-condensed">
					<tr class="success">
						<div class="list-group-item list-group-item-success text-center">
							Meter History
						</div>
					</tr>
					<tr class="text-center info ">
						<td>Date</td>
						<td>Reading</td>
						<td>Units</td>
						<td>Bill Amount</td>
					</tr>
					<%
						room_no=(int) session.getAttribute("Room_no");
						tenant_id=(int)session.getAttribute("Tenant_id");
						rs = m.showMeterHistory(room_no,tenant_id);
						while (rs.next()) {
					%>
					<tr class="text-center  ">
						<td><%=rs.getDate(1)%></td>
						<td><%=rs.getInt(2)%></td>
						<td><%=rs.getInt(3)%></td>
						<td><%=rs.getDouble(4) %></td>

					</tr>
					<%
						}
					%>

				</table>
			</div>
		</div>

	</div>







	<script src="js/jquery.min.js"> </script>
		<script src="js/bootstrap.min.js"> </script>
</body>
</html>