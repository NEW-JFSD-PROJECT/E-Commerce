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

								<li class="nav-item"><a data-toggle="pill"
									href="#credit-card" class="nav-link active "> <i
										class="fas fa-credit-card mr-2"></i> Credit Card
								</a></li>
								<li class="nav-item"><a data-toggle="pill" href="#upi"
									class="nav-link ">UPI</a></li>
								<li class="nav-item"><a data-toggle="pill"
									href="#net-banking" class="nav-link "> <i
										class="fas fa-mobile-alt mr-2"></i> Net Banking
								</a></li>
								<li class="nav-item"><a data-toggle="pill" href="#cod"
									class="nav-link ">Cash On Delivery</a></li>

							</ul>

						</div>
						<!-- End -->
						<!-- Credit card form content -->
						<div class="tab-content">
							<!-- credit card info-->
							<div id="credit-card" class="tab-pane fade show active pt-3">
								<form action="card" method="post">
									<div class="form-group">
										<label for="username">
											<h6>Card Owner</h6>
										</label> <input type="text" name="name" placeholder="Card Owner Name"
											required class="form-control ">
									</div>
									<div class="form-group">
										<label for="cardNumber">
											<h6>Card number</h6>
										</label>
										<div class="input-group">
											<input type="text" name="cardNumber" maxlength="16"
												placeholder="Valid card number" class="form-control "
												required>
											<div class="input-group-append">
												<span class="input-group-text text-muted"> <i
													class="fab fa-cc-visa mx-1"></i> <i
													class="fab fa-cc-mastercard mx-1"></i> <i
													class="fab fa-cc-amex mx-1"></i>
												</span>
											</div>
										</div>
									</div>
									<div class="row">
										<div class="col-sm-8">
											<div class="form-group">
												<label><span class="hidden-xs">
														<h6>Expiration Date</h6>
												</span></label>
												<div class="input-group">
													<input type="number" placeholder="MM" name="month"
														class="form-control" required> <input
														type="number" placeholder="YY" name="year"
														class="form-control" required>
												</div>
											</div>
										</div>
										<div class="col-sm-4">
											<div class="form-group mb-4">
												<label data-toggle="tooltip"
													title="Three digit CV code on the back of your card">
													<h6>
														CVV <i class="fa fa-question-circle d-inline"></i>
													</h6>
												</label> <input type="text" required class="form-control" name="cvv">
											</div>
										</div>
									</div>
									<div class="input-group">
										<input type="hidden" name="id" value="<%=c.getId()%>">
									</div>

									<div class="card-footer">
										<button type="submit"
											class="btn bg-primary text-white col-md-12">Confrim
											Payment</button>
									</div>
								</form>
							</div>

							<!-- End -->
							<!-- Upi info -->
							<div id="upi" class="tab-pane fade pt-3">

								<form action="upi" method="post">
									<div class="form-group ">
										<label for="Select Your Bank">
											<h6>Select your UPI ID</h6>
										</label> <select class="form-control" name="upiname"
											required="required">
											<option selected disabled>--Please select your UPI
												ID--</option>
											<option>GOOGLE PAY</option>
											<option>PAYTM</option>
											<option>AMAZON PAY</option>
											<option>PHONE PAY</option>
											<option>FREECHARGE</option>
											<option>MOBIKWIK</option>
										</select>

									</div>
									<div class="form-group">
										<label for="username">
											<h6>Name</h6>
										</label> <input type="text" name="name" placeholder="Name" required
											class="form-control ">
									</div>
									<div class="form-group">
										<label for="cardNumber">
											<h6>Upi Id</h6>
										</label> <input type="email" name="upiid" placeholder="Enter UPI id"
											required class="form-control ">
									</div>
									<div class="input-group">
										<input type="hidden" name="id" value="<%=c.getId()%>">
									</div>
									<div class="card-footer">
										<button type="submit"
											class="btn bg-primary text-white col-md-12">Pay
											Using Upi</button>
									</div>
								</form>
							</div>

							<!-- End -->
							<!-- bank transfer info -->
							<div id="net-banking" class="tab-pane fade pt-3">
								<form action="bank" method="post">
									<div class="form-group ">
										<label for="Select Your Bank">
											<h6>Select your Bank</h6>
										</label> <select class="form-control" id="ccmonth" name="bankname">
											<option value="" selected disabled>--Please select
												your Bank--</option>
											<option>HDFC BANK</option>
											<option>STATE BANK OF INDIA</option>
											<option>ICICI BANK</option>
											<option>AXIS BANK</option>
											<option>KOTAK MAHINDRA BANK</option>
											<option>CANARA</option>
										</select>
									</div>
									<div class="form-group">
										<label for="username">
											<h6>User Id</h6>
										</label> <input type="text" name="userid" placeholder="Enter User ID"
											required class="form-control ">
									</div>
									<div class="form-group">
										<label>
											<h6>Password</h6>
										</label> <input type="password" name="password"
											placeholder="Enter Password" required class="form-control ">
									</div>
									<div class="input-group">
										<input type="hidden" name="id" value="<%=c.getId()%>">
									</div>

									<div class="card-footer">
										<button type="submit"
											class="btn bg-primary text-white col-md-12">Proceed
											Payment</button>
									</div>


								</form>
							</div>
							<!-- Cod -->

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
						</div>
						<!-- End -->
						<!-- End -->
					</div>
				</div>
			</div>
		</div>
</body>
</html>