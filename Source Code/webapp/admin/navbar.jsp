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
			<form class="form-inline my-2 my-lg-0">
				<input class="form-control mr-sm-2" type="search"
					placeholder="Search" aria-label="Search">
				<button class="btn btn-primary my-2 my-sm-0" type="submit">Search</button>
			</form>
		</div>
		
		<div class="col-md-3">
	
				<div class="dropdown">
					<button class="btn btn-success dropdown-toggle" type="button"
							id="dropdownMenuButton1" data-bs-toggle="dropdown"
							aria-expanded="false">
							<i class="fa-solid fa-circle-user"></i> Admin
						</button>
					<ul class="dropdown-menu" aria-labelledby="dropdownMenuButton1">
						<li><a class="dropdown-item" href="../adminLogout">Logout</a></li>
					</ul>
				</div>
			
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
				<li class="nav-item"><a class="nav-link active" href="manager.jsp">Add Maanger</a></li>
				<li class="nav-item"><a class="nav-link active" href="view_manager.jsp">View Manager</a></li>
				<li class="nav-item"><a class="nav-link active" href="view_product.jsp">View Products</a></li>
				<li class="nav-item"><a class="nav-link active" href="view_customer.jsp">View Customers</a></li>
				<li class="nav-item"><a class="nav-link active" href="order.jsp">All Order</a></li>
				<li class="nav-item"><a class="nav-link active" href="contact.jsp">All Contact Us</a></li>

		</ul>
		<form class="form-inline my-2 my-lg-0">

			<a href="../contactus.jsp" class="btn btn-light ">	<i class="fa-solid fa-phone"></i> Contact Us</a>
		</form>
	</div>
</nav>