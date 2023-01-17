<%@page import="com.entity.Customer"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page import="com.entity.product"%>
<%@page import="com.dao.ProductDao"%>
<%@page import="java.util.List"%>
<%@page import="com.db.DBConn"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>View Details</title>
<%@include file="componet/allcss.jsp"%>
<link rel="stylesheet" href="componet/style.css">
<style type="text/css">
/* body {
	background-color: #000
}


label.radio {
	cursor: pointer
}

label.radio
input {
	position: absolute;
	top: 0;
	left: 0;
	visibility: hidden;
	pointer-events: none
}

label.radio span {
	padding: 2px 9px;
	border: 2px solid #ff0000;
	display: inline-block;
	color: #ff0000;
	border-radius: 3px;
	text-transform: uppercase
}

label.radio
input:checked+span {
	border-color: #ff0000;
	background-color: #ff0000;
	color: #fff
}
 */
body {
	background-color: #000
}

.card {
	border: none
}

.product {
	background-color: #eee
}

.brand {
	font-size: 13px
}

.act-price {
	color: red;
	font-weight: 700
}

.dis-price {
	text-decoration: line-through
}

.about {
	font-size: 14px
}

.color {
	margin-bottom: 10px
}

label.radio {
	cursor: pointer
}

label.radio input {
	position: absolute;
	top: 0;
	left: 0;
	visibility: hidden;
	pointer-events: none
}

label.radio span {
	padding: 2px 9px;
	border: 2px solid #ff0000;
	display: inline-block;
	color: #ff0000;
	border-radius: 3px;
	text-transform: uppercase
}

label.radio input:checked+span {
	border-color: #ff0000;
	background-color: #ff0000;
	color: #fff
}

.btn-danger {
	background-color: #ff0000 !important;
	border-color: #ff0000 !important
}

.btn-danger:hover {
	background-color: #da0606 !important;
	border-color: #da0606 !important
}

.btn-danger:focus {
	box-shadow: none
}

.cart i {
	margin-right: 10px
}
</style>
</head>
<body style="background-color: #f0f1f2">
<%@include file="componet/navbar.jsp"%>

						<c:if test="${not empty addcart }">
							<p class="text-center text-success fs-5">${addcart}</p>
							<c:remove var="addcart" scope="session" />
						</c:if>

						<c:if test="${not empty failed }">
							<p class="text-center text-danger fs-5">${failed}</p>
							<c:remove var="failed" scope="session" />
						</c:if>


	<%
	Customer c = (Customer) session.getAttribute("customerobj");
	%>
	

	<%
	int pid = Integer.parseInt(request.getParameter("pid"));
	ProductDao dao = new ProductDao(DBConn.getConn());
	product p = dao.getProductById(pid);
	%>


	<div class="container mt-5 mb-5">
		<div class="row d-flex justify-content-center">
			<div class="col-md-10">
				<div class="card">
					<div class="row">
						<div class="col-md-6">
							<div class="images p-3">
								<div class="text-center p-4">
									<img id="main-image" src="product/<%=p.getPimage()%>"
										width="250" />
								</div>
							</div>
						</div>
						<div class="col-md-6">
							<div class="product p-4">
								<div class="d-flex justify-content-between align-items-center">
									<div class="d-flex align-items-center">
										<i class="fa fa-long-arrow-left"></i> <span class="ml-1"><a
											style="color: red" href="all_appliance.jsp">Back</a></span>
									</div>
								</div>
								<div class="mt-4 mb-3">
									<span class="text-uppercase text-muted brand"><%=p.getPcategory()%></span>
									<%
									if (null != p.getPsubcategory()) {
									%>
									<div class="mt-4 mb-3">
										<span class="text-uppercase text-muted brand"><%=p.getPsubcategory()%></span>

										<%
										}
										%>

										<h5>
											<span class="text-success"><%=p.getPname()%></span>
										</h5>
										<div class="price d-flex flex-row align-items-center">
											<span class="act-price"><i
												class="fa-sharp fa-solid fa-indian-rupee-sign"></i> <%=p.getPprice()%></span>
										</div>
									</div>
									<h4 class="mt-3">
										Category:<span class="text-success"><%=p.getPcategory()%></span>
									</h4>



									<%
									if (null != p.getPcolor()) {
									%>
									<h4>
										Color:<span class="text-success"><%=p.getPcolor()%></span>
									</h4>

									<%
									}
									%>
									<%
									if (null != p.getPdecs()) {
									%>
									<li class="about"><%=p.getPdecs()%></li>

									<%
									}
									%>

									<div class="cart mt-4 align-items-center">
										<%
				if (c == null) {
				%>
				<a href="customer_login.jsp"  class="btn btn-danger btn-sm ml-2"><i
					class="fa-sharp fa-solid fa-cart-shopping"></i> Add to cart</a>

				<%
				} else {
				%>
				
				<a  href="cartservlet?pid=<%=p.getPid()%>&&cid=<%=c.getId()%>"
					class="btn btn-danger btn-sm ml-2"><i
					class="fa-sharp fa-solid fa-cart-shopping"></i> Add to cart</a>
   				

				<%
				}
				%>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<hr>
	<%@include file="componet/footer.jsp"%>
</body>
</html>