<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Product Order Sucess</title>
<%@include file="componet/allcss.jsp"%>
<link rel="stylesheet" href="componet/style.css">
</head>
<body style="background-color: #f0f1f2">
	<%@include file="componet/navbar.jsp"%>


	<div class="container text-center mt-3">
		<i class="fas fa-check-circle fa-5x text-success"></i>
		<h1>Thank You</h1>
		<h2>Your Order Succesfully</h2>
		<h5>With In 7 Days Your Product Will Be Delivered In Your Adress</h5>
		<a href="index.jsp" class="btn btn-sm btn-primary mt-3">Home</a>
		<a href="view_order.jsp" class="btn btn-sm btn-danger mt-3">View Order</a>
	</div>

</body>
</html>