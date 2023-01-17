<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page isELIgnored="false"%>



<div class="container-fluid"
	style="height: 10px; background-color: #303f9f"></div>


<div class="container-fluid p-3">
	<div class="row">
		<div class="col-md-4 text-success ">
			<h1>
				<i class="fa-solid fa-business-time"></i> E-Commerce
			</h1>
		</div>
		<div class="col-md-5 ">
			<form class="form-inline my-2 my-lg-0" action="search.jsp" method="post">
				<input class="form-control mr-sm-2" type="search" name="search"
					placeholder="Search" aria-label="Search">
				<button class="btn btn-primary my-2 my-sm-0" type="submit">Search</button>
			</form>
		</div>
		<div class="col-md-3">
			<c:if test="${not empty customerobj }">
				<div class="dropdown">
					<button class="btn btn-success dropdown-toggle" type="button"
						id="dropdownMenuButton1" data-bs-toggle="dropdown"
						aria-expanded="false">
						<i class="fa-solid fa-circle-user"></i> ${customerobj.fullname }
					</button>
					<ul class="dropdown-menu" aria-labelledby="dropdownMenuButton1">
						<li><a class="dropdown-item" href="change_password.jsp">Change
								Password</a></li>
						<li><a class="dropdown-item" href="cLogout">Logout</a></li>
					</ul>

					<a href="cart.jsp" class="btn btn-success"><i
						class="fa-sharp fa-solid fa-cart-shopping"></i> Cart Item</a>



				</div>
			</c:if>
			<c:if test="${empty customerobj }">
				<div class="dropdown">
					<button class="btn btn-success dropdown-toggle" type="button"
						id="dropdownMenuButton" data-toggle="dropdown"
						aria-haspopup="true" aria-expanded="false">
						<i class="fa-solid fa-right-to-bracket"></i> Login
					</button>
					<div class="dropdown-menu" aria-labelledby="dropdownMenuButton">
						<a class="dropdown-item" href="admin_login.jsp">Admin Login</a> <a
							class="dropdown-item" href="manager_login.jsp">Manager Login</a>
						<a class="dropdown-item" href="customer_login.jsp">Customer
							Login</a>
					</div>
					<a href="signup.jsp" class="btn btn-primary"><i
						class="fa-solid fa-user-plus"></i> Register</a>
				</div>



			</c:if>
		</div>
	</div>
</div>







<nav class="navbar navbar-expand-lg navbar-dark bg-custom ">

	<button class="navbar-toggler" type="button" data-toggle="collapse"
		data-target="#navbarSupportedContent"
		aria-controls="navbarSupportedContent" aria-expanded="false"
		aria-label="Toggle navigation">
		<span class="navbar-toggler-icon"></span>
	</button>

	<div class="collapse navbar-collapse" id="navbarSupportedContent">
		<ul class="navbar-nav mr-auto">
			<li class="nav-item active"><a class="nav-link" href="index.jsp"><i
					class="fas fa-home"></i> Home <span class="sr-only">(current)</span></a>
			</li>
			<li class="nav-item active"><a class="nav-link"
				href="all_product.jsp"><i class="fa-brands fa-product-hunt"></i>
					Product</a></li>
					<li class="nav-item active"><c:if test="${not empty customerobj }">
			<a href="view_order.jsp" class="nav-link">Book List</a>
	

		</c:if></li>

		</ul>
		

		<a href="contactus.jsp" class="btn btn-light ">	<i class="fa-solid fa-phone"></i> Contact Us</a>

		
	</div>
</nav>