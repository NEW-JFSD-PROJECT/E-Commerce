<%@page import="com.entity.Manager"%>
<%@page import="com.dao.ManagerDao"%>



<%@page import="java.util.List"%>
<%@page import="com.db.DBConn"%>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>View Manager</title>
<%@include file="../componet/allcss.jsp"%>
<link rel="stylesheet" href="../componet/style.css">
<style type="text/css">
.paint-card {
	box-shadow: 0 0 10px 0 rgba(0, 0, 0, 0.3);
}
</style>
</head>
<body>
	<%@include file="navbar.jsp"%>
	<div class="container-fluid p-3">
		<div class="row">


			<div class="col-md-12">
				<div class="card paint-card">
					<div class="card-body">
						<p class="fs-3 text-center">Manager Details</p>
						<c:if test="${not empty errorMsg}">
							<p class="fs-3 text-center text-danger">${errorMsg}</p>
							<c:remove var="errorMsg" scope="session" />
						</c:if>
						<c:if test="${not empty succMsg}">
							<div class="fs-3 text-center text-success" role="alert">${succMsg}</div>
							<c:remove var="succMsg" scope="session" />
						</c:if>
						<table class="table">
							<thead>
								<tr>
									<th scope="col">Full Name</th>
									<th scope="col">DOB</th>
									<th scope="col">Age</th>
									<th scope="col">Email</th>
									<th scope="col">Mob No</th>
									<th scope="col">Password</th>
									<th scope="col">Action</th>
								</tr>
							</thead>
							<tbody>
								<%
								ManagerDao dao2 = new ManagerDao(DBConn.getConn());
								List<Manager> list2 = dao2.getAllManager();
								for (Manager m : list2) {
								%>
								<tr>
									<td><%=m.getFullName()%></td>
									<td><%=m.getDob()%></td>
									<td><%=m.getAge()%></td>
									<td><%=m.getEmail()%></td>
									<td><%=m.getMobNo()%></td>
									<td><%=m.getPassword()%></td>
									<td><a href="edit_manager.jsp?id=<%=m.getId()%>"
										class="btn btn-sm btn-primary">Edit</a> <a
										href="../deleteManager?id=<%=m.getId()%>"
										class="btn btn-sm btn-danger">Delete</a></td>
								</tr>
								<%
								}
								%>



							</tbody>
						</table>

					</div>
				</div>
			</div>

		</div>
	</div>
</body>
</html>