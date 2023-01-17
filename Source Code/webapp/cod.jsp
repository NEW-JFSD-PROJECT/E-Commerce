<%@page import="com.entity.Customer"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Payment Page</title>
<%@include file="componet/allcss.jsp"%>
<link rel="stylesheet" href="componet/style.css">
<style type="text/css">
body {
	background: #f5f5f5
}

.rounded {
	border-radius: 1rem
}

.nav-pills .nav-link {
	color: #555
}

.nav-pills .nav-link.active {
	color: white
}

input[type="radio"] {
	margin-right: 5px
}

.bold {
	font-weight: bold
}
</style>
<script type="text/javascript">
	$(function() {
		$('[data-toggle="tooltip"]').tooltip()
	})
</script>
</head>
<body>
	<%@include file="componet/navbar.jsp"%>

	<%
	Customer c = (Customer) session.getAttribute("customerobj");
	%>

	<div class="container py-5">
		<!-- For demo purpose -->
		<div class="row mb-4">
			<div class="col-lg-8 mx-auto text-center">
				<h1 class="display-6">Payment Forms</h1>
			</div>
		</div>
		<!-- End -->
		<div class="row">
			<div class="col-lg-6 mx-auto">
				<div class="card ">
					<div class="card-header">
						<a href="cart.jsp" class="btn btn-sm btn-danger ">BACK</a>
						<div class="bg-white shadow-sm pt-4 pl-2 pr-2 pb-2">

							<!-- Credit card form tabs -->
							<ul role="tablist"
								class="nav bg-light nav-pills rounded nav-fill mb-3">

								<li class="nav-item"><a data-toggle="pill" href="#cod"
									class="nav-link ">Cash On Delivery</a></li>
						</div>
						<!-- End -->
						<!-- Credit card form content -->
						<div class="tab-content">
							<!-- credit card info-->
									<div id="cod" class="tab-pane fade pt-3">
								<form action="cod" method="post">
									<div class="form-group ">
										 <select class="form-control" id="" name="cod">
											<option value="" selected disabled>--select
												--</option>
											<option>CASH ON DELIVERY</option>
											
										</select>
									</div>
									<div class="card-footer">
										<button type="submit"
											class="btn bg-primary text-white col-md-12">Proceed
											Payment</button>
									</div>
									<div class="input-group">
										<input type="hidden" name="id" value="<%=c.getId()%>">
									</div>
									

								</form>
							</div>


							<!-- End -->
							
				</div>
			</div>
		</div>
</body>
</html>