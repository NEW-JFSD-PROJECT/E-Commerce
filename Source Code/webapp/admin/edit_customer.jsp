<%@page import="com.entity.Customer"%>
<%@page import="com.dao.CustomerDao"%>

<%@page import="java.util.List"%>
<%@page import="com.db.DBConn"%>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Edit Doctor</title>
<%@include file="../componet/allcss.jsp"%>
<%@page isELIgnored="false"%>
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

			<div class="col-md-4 offset-md-4">
				<div class="card paint-card">
					<div class="card-body">
						<p class="fs-3 text-center">Edit Customer Details</p>
						<c:if test="${not empty errorMsg}">
							<p class="fs-3 text-center text-danger">${errorMsg}</p>
							<c:remove var="errorMsg" scope="session" />
						</c:if>
						<c:if test="${not empty succMsg}">
							<div class="fs-3 text-center text-success" role="alert">${succMsg}</div>
							<c:remove var="succMsg" scope="session" />
						</c:if>

						<%
						int id = Integer.parseInt(request.getParameter("id"));
						CustomerDao dao2 = new CustomerDao(DBConn.getConn());
						Customer c = dao2.getCustomerById(id);
						%>


						<form action="../updateCustomer" method="post">
							<div class="mb-3">
								<label class="form-label">Full Name</label> <input type="text"
									required name="fullname" class="form-control"
									value="<%=c.getFullname()%>">
							</div>

							<div class="col-md-6">
								<label>Gender</label> <select class="form-control" value="<%=c.getGender()%>" name="gender"
									required>
									<option value="male">Male</option>
									<option value="female">Female</option>
								</select>
							</div>

							<div class="col-md-6">
								<label for="inputEmail4" class="form-label">Age</label> <input
									required type="number" class="form-control" name="age"value="<%=c.getAge()%>">
							</div>



							<div class="col-md-6">
								<label for="inputEmail4" class="form-label">Phone No</label> <input
									maxlength="10" required type="number" class="form-control"value="<%=c.getPhno()%>"
									name="phno">
							</div>
							<div class="mb-3">
								<label for="inputEmail4" class="form-label">Email</label> <input
									required type="email" class="form-control" value="<%=c.getEmail()%>"name="email">
							</div>
							<div class="mb-3">
								<label class="form-label">Password</label> <input required
									value="<%=c.getPassword()%>" name="password" type="text"
									class="form-control">
							</div>
							<div class="mb-3">
								<label class="form-label">Full Adress</label> <input type="text"
									required name="address" class="form-control"
									value="<%=c.getAddress()%>">
							</div>
							<input type="hidden" name="id" value="<%=c.getId()%>">

							<button type="submit" class="btn btn-primary col-md-12">Update</button>
						</form>
					</div>
				</div>
			</div>




		</div>
	</div>
</body>
</html>