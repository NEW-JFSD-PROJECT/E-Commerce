<%@page import="org.apache.jasper.tagplugins.jstl.core.ForEach"%>
<%@page import="com.entity.Cart"%>
<%@page import="com.entity.Customer"%>
<%@page import="com.dao.CartDaoImpl"%>
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
<title>View Cart</title>
<%@include file="componet/allcss.jsp"%>
<link rel="stylesheet" href="componet/style.css">
<style type="text/css">
.paint-card {
	box-shadow: 0 0 10px 0 rgba(0, 0, 0, 0.3);
}
</style>
</head>
<body>
	<%@include file="componet/navbar.jsp"%>

	<c:if test="${empty customerobj }">
		<c:redirect url="customer_login.jsp"></c:redirect>
	</c:if>







	<div class="container">
		<div class="row p-2">


			<div class="col-md-6">
				<div class="card paint-card">
					<div class="card-body">
						<c:if test="${not empty succmsg }">
							<p class="text-center text-success fs-3">${succmsg}</p>
							<c:remove var="succmsg" scope="session" />
						</c:if>

						<c:if test="${not empty failed }">
							<p class="text-center text-danger fs-3">${failed}</p>
							<c:remove var="failed" scope="session" />
						</c:if>
						<h3 class="text-success text-center">Your Selected Item</h3>

						<table class="table table-striped">
							<thead>
								<tr>
									<th scope="col">Product Name</th>
									<th scope="col">Category</th>
									<th scope="col">Price</th>
									<th scope="col">Action</th>

								</tr>
							</thead>
							<tbody>
								<%
								Customer c1 = (Customer) session.getAttribute("customerobj");
								CartDaoImpl dao = new CartDaoImpl(DBConn.getConn());
								List<Cart> cart = dao.getProductByCustomer(c1.getId());
								double totalprice = 0.00;
								for (Cart c : cart) {
									totalprice = c.getTotalPrice();
								%>
								<tr>
									<th scope="row"><%=c.getpName()%></th>
									<td><%=c.getpCategory()%></td>
									<td><%=c.getPrice()%></td>
									<td><a
										href="remove_book?pid=<%=c.getPid()%>&&cid=<%=c.getCustomerId()%>"
										class="btn btn-sm btn-danger">Remove</a></td>
								</tr>

								<%
								}
								%>
								<tr>
									<td>Total Price:</td>
									<td></td>
									<td></td>
									<td><%=totalprice%></td>
								</tr>
							</tbody>
						</table>

					</div>
				</div>
			</div>
			<div class="col-md-6">
				<div class="card paint-card">
					<div class="card-body">
						<c:if test="${not empty msg }">
							<p class="text-center text-danger fs-3">${msg}</p>
							<c:remove var="msg" scope="session" />
						</c:if>

						<c:if test="${not empty Failedmsg }">
							<p class="text-center text-danger fs-3">${Failedmsg}</p>
							<c:remove var="Failedmsg" scope="session" />
						</c:if>
					
						<h3 class="text-success text-center">Yours Details For Order</h3>
						<form class="row g-3" action="order" method="post">
							<div class="form-row">
								<input type="hidden" name="id" value="${customerobj.id }">
								<div class="form-group col-md-6">
									<label for="inputEmail4" class="form-label">Full Name</label> <input
										type="text" class="form-control" name="name"
										value="<%=c1.getFullname()%>" required>
								</div>
								<div class="form-group col-md-4">
									<label for="inputEmail4" class="form-label">Phone No</label> <input
										maxlength="10" type="number" class="form-control" name="phno"
										value="<%=c1.getPhno()%>"required>
								</div>
								<div class="form-group col-md-5">
									<label for="inputEmail4" class="form-label">Email</label> <input
										required type="email" class="form-control" name="email"
										value="<%=c1.getEmail()%>">
								</div>
								<div class="form-group col-md-7">
									<label for="inputEmail4">Full Address</label> <input
										type="text" class="form-control" name="address"
										value="<%=c1.getAddress()%>"required>
								</div>
								<div class="form-group col-md-6">
									<label for="inputEmail4" class="form-label">Land Mark</label> <input
										type="text" class="form-control" name="land"required>
								</div>
								<div class="form-group col-md-6">
									<label for="inputEmail4" class="form-label">City</label> <input
										required type="text" class="form-control" name="city">
								</div>
								<div class="form-froup col-md-6">
									<label for="inputEmail4" class="form-label">State</label> <input
										required type="text" class="form-control" name="state">
								</div>
								<div class="form-group col-md-6">
									<label for="inputEmail4" class="form-label">Pin Code</label> <input
										required type="text" class="form-control" name="pin">
								</div>
								<div class="form-group mb-3">
									<label>
										<h6>Select your Payment Option</h6>
									</label> <br> <select name="payment">

										<option value="noselect">--Please select your Payment
											Option--</option>
										<option value=credit_card>Credit Card</option>
										<option value=upi>UPI</option>
										<option value=net_banking>Net Banking</option>
										<option value=cod>CASH ON DELIVERY</option>

									</select>


								</div>




								<button type="submit"
									class="btn bg-primary text-white col-md-12">Order</button>
						</form>
					</div>
				</div>
			</div>


		</div>
	</div>
</body>
</html>