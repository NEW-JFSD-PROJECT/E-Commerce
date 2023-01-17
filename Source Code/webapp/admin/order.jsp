
<%@page import="com.entity.Order"%>
<%@page import="java.util.List"%>
<%@page import="com.db.DBConn"%>
<%@page import="com.dao.OrderDao"%>
<%@page import="com.entity.Customer"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Order Product</title>
<%@include file="../componet/allcss.jsp"%>
<link rel="stylesheet" href="../componet/style.css">
</head>
<body>


	<%@include file="navbar.jsp"%>
	<div class="container p-1">
		<h3 class="text-center text-primary">Your Order</h3>

		<table class="table table-striped mt-3">
			<thead class="bg-primary text-white">
				<tr>
					<th scope="col">Order Id</th>
					<th scope="col">Customer Name</th>
					<th scope="col">Mobile Num</th>
					<th scope="col">Email</th>
					<th scope="col">Adress</th>
					<th scope="col">Product Name</th>
					<th scope="col">Category</th>
					<th scope="col">Price</th>
					<th scope="col">Payment Type</th>
					<th scope="col">Status</th>
				</tr>
			</thead>
			<tbody>
				<%
				OrderDao dao = new OrderDao(DBConn.getConn());
				List<Order> list = dao.getAllOrder();
				for (Order o : list) {
				%>

				<tr>
				<%if(!"noselect".equals(o.getPayment())){ %>
					<th scope="row"><%=o.getOrder_id()%></th>
					<td><%=o.getUser_name()%></td>
					<td><%=o.getPhone()%></td>
					<td><%=o.getEmail()%></td>
					<td><%=o.getAdress()%></td>
					<td><%=o.getProduct_name()%></td>
				
					
					<td><%=o.getCategory()%></td>
					<td><%=o.getPrice()%></td>
						
					<td><%=o.getPayment()%></td>
					<td><%=o.getStastus()%></td>
					<%} %>

				</tr>
				<%
				}
				%>
			</tbody>
		</table>


	</div>

</body>
</html>