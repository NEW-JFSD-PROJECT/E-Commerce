<%@page import="com.entity.Order"%>
<%@page import="com.dao.OrderDao"%>

<%@page import="com.db.DBConn"%>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Order Comment PAge</title>
<style type="text/css">
.paint-card {
	box-shadow: 0 0 10px 0 rgba(0, 0, 0, 0.3);
}

.backImg {
	background: linear-gradient(rgba(0, 0, 0, .4), rgba(0, 0, 0, .4)),
		url("../img/hospital.jpg");
	height: 20vh;
	width: 100%;
	background-size: cover;
	background-repeat: no-repeat;
}
</style>
<%@include file="../componet/allcss.jsp"%>
<link rel="stylesheet" href="../componet/style.css">
</head>
<body>
	<c:if test="${empty managerobj }">
		<c:redirect url="../manager_login.jsp"></c:redirect>
	</c:if>


	<%@include file="navbar.jsp"%>
	<div class="container-fulid backImg p-5">
		<p class="text-center fs-2 text-white"></p>
	</div>
	<div class="container p-3">
		<div class="row">

			<div class="col-md-6 offset-md-3">
				<div class="card paint-card">
					<div class="card-body">
						<p class="text-center fs-4">Order Stastus Update</p>

						<%
						int id = Integer.parseInt(request.getParameter("id"));
						OrderDao dao = new OrderDao(DBConn.getConn());

						Order o = dao.getAllOrder(id);
						%>
						<form class="row" action="../updateStatus" method="post">
						<div class="col-md-6">
								<label>Order Id</label> <input type="text" readonly
									value="<%=o.getOrder_id()%>" class="form-control">
							</div>
							<div class="col-md-6">
								<label>Customer Name</label> <input type="text" readonly
									value="<%=o.getUser_name()%>" class="form-control">
							</div>

							<div class="col-md-6">
								<label>Email</label> <input type="text" value="<%=o.getEmail()%>"
									readonly class="form-control">
							</div>


							<div class="col-md-6">
								<br> <label>Mob No</label> <input type="text" readonly
									value="<%=o.getPhone()%>" class="form-control">
							</div>

							<div class="col-md-6">
								<br> <label>Product Name</label> <input type="text" readonly
									value="<%=o.getProduct_name()%>" class="form-control">
							</div>
							
							<div class="col-md-6">
								<br> <label>Product Price</label> <input type="text" readonly
									value="<%=o.getPrice()%>" class="form-control">
							</div>
							<div class="col-md-6">
								<br> <label>Payment Type</label> <input type="text" readonly
									value="<%=o.getPayment()%>" class="form-control">
							</div>
							

							<div class="col-md-12">
								<br> <label>Comment</label>
								<input type="text" required name="comm" class="form-control" row="3"
									value="<%=o.getStastus()%>">
							</div>

							<input type="hidden" name="id" value="<%=o.getId()%>"> 

							<button class=" mt-3 btn btn-primary col-md-6 offset-md-3">Submit</button>

						</form>

					</div>
				</div>
			</div>
		</div>
	</div>






</body>
</html>