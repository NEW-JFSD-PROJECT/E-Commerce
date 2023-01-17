
<%@page import="com.entity.contact"%>
<%@page import="com.dao.contactDao"%>
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
<title>Contactus Message</title>
<%@include file="../componet/allcss.jsp"%>
<link rel="stylesheet" href="../componet/style.css">
</head>
<body>


	<%@include file="navbar.jsp"%>
	<div class="container p-1">
	<c:if test="${not empty errorMsg}">
							<p class="fs-3 text-center text-danger">${errorMsg}</p>
							<c:remove var="errorMsg" scope="session" />
						</c:if>
						<c:if test="${not empty succMsg}">
							<div class="fs-3 text-center text-success" role="alert">${succMsg}</div>
							<c:remove var="succMsg" scope="session" />
						</c:if>
		<h3 class="text-center text-primary">Contactus Message</h3>

		<table class="table table-striped mt-3">
			<thead class="bg-primary text-white">
				<tr>
					
					<th scope="col">Customer Name</th>
					
					<th scope="col">Email</th>
					<th scope="col">Number</th>
					
					<th scope="col">Message</th>
						<th scope="col">Action</th>
				</tr>
			</thead>
			<tbody>
				<%
				contactDao dao = new contactDao(DBConn.getConn());
				List<contact> list = dao.getAllContact();
				for (contact o : list) {
				%>

				<tr>
				
					<th scope="row"><%=o.getName()%></th>
					<td><%=o.getEmail()%></td>
					<td><%=o.getNumber()%></td>
					<td><%=o.getMsg()%></td>
					<td> <a
										href="../deletecontact?id=<%=o.getId()%>"
										class="btn btn-sm btn-danger">Delete</a></td>
				
				</tr>
				<%
				}
				%>
			</tbody>
		</table>


	</div>

</body>
</html>