
<%@page import="com.dao.ManagerDao"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="com.db.DBConn"%>
<%@page import="com.dao.ProductDao"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Manager DashBoard</title>
<%@include file="../componet/allcss.jsp" %>
<link rel="stylesheet" href="../componet/style.css">
</head>
<body>
<%@include file="navbar.jsp" %>

	<%
	
	ManagerDao dao = new ManagerDao(DBConn.getConn());
	%>
<div class="container p-5">
		<div class="row">
			<div class="col-md-4 offset-md-2">
				<div class="card paint-card">
					<div class="card-body text-center text-success">
						
						<i class="fa-brands fa-product-hunt fa-3x"></i><br>
						<p class="fs-4 text-center">
							Product <br><%=dao.countProduct()%>
						</p>
					</div>
				</div>
			</div>


			<div class="col-md-4">
				<div class="card paint-card">
					<div class="card-body text-center text-success">
							<i class="fas fa-user-circle fa-3x"></i></i><br>
						<p class="fs-4 text-center">
							Customer <br><%=dao.countCustomer()%>
						</p>
					</div>
				</div>
			</div>

		</div>
	</div>
</body>
</html>