<%@page import="com.entity.Customer"%>
<%@page import="com.entity.product"%>
<%@page import="com.dao.ProductDao"%>
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
<title>All Two Wheeler</title>
<%@include file="componet/allcss.jsp"%>
<link rel="stylesheet" href="componet/style.css">
<style type="text/css">
#myBtn {
	display: none;
	position: fixed;
	bottom: 20px;
	right: 30px;
	z-index: 99;
	font-size: 18px;
	border: none;
	outline: none;
	background-color: red;
	color: white;
	cursor: pointer;
	padding: 15px;
	border-radius: 4px;
}

#myBtn:hover {
	background-color: #555;
}

.blockbike {
	position: relative;
	background-color: #fff;
	width: 25%;
	height: 450px;
	border: 2px solid #E0E0E0;
	box-shadow: 0 3px 6px 0 rgba(0, 0, 0, 0.2);
	cursor: pointer;
	margin-bottom: 25px;
}

.bikeimage {
	width: 200px;
	height: 150px;
}
</style>

</head>
<body>

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
	<%@include file="componet/navbar.jsp"%>
	<button onclick="topFunction()" id="myBtn" title="Go to top">Top</button>
	<!-- Beauty & More Section -->
	<div class="container-fluid px-5 py-5 mx-auto">
		<h1 class="text-center text-uppercase">Two Wheeler</h1>


		<!--Petrol Bike-->
		<h1 class="text-center text-uppercase">Petrol Bike</h1>


			<div class="row justify-content-between px-4">

			<%
			ProductDao dao1 = new ProductDao(DBConn.getConn());
			List<product> list1 = dao1.getAllPetrolBike();
			for (product p : list1) {
			%>
			<div class="blockbike text-center">

				<img class="bikeimage" src="product/<%=p.getPimage()%>">
				<p><%=p.getPname()%></p>
				<p>
					<i class="fa-sharp fa-solid fa-indian-rupee-sign"></i><%=p.getPprice()%></p>
				<p>
					Sub-Category:
					<%=p.getPsubcategory()%></p>

				<p>
					Color:<%=p.getPcolor()%></p>

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
				%> <a href="two_wheeler_view_details.jsp?pid=<%=p.getPid()%>"
					class="btn btn-success btn-sm ml-1">View Details</a>
			</div>


			<%
			}
			%>
		</div>
		<hr>
	
			<!--Electric Bike-->
		<h1 class="text-center text-uppercase">Electric Bike</h1>


			<div class="row justify-content-between px-4">

			<%
			ProductDao dao2 = new ProductDao(DBConn.getConn());
			List<product> list2 = dao2.getAllElectricBike();
			for (product p : list2) {
			%>
			<div class="blockbike text-center">

				<img class="bikeimage" src="product/<%=p.getPimage()%>">
				<p><%=p.getPname()%></p>
				<p>
					<i class="fa-sharp fa-solid fa-indian-rupee-sign"></i><%=p.getPprice()%></p>
				<p>
					Sub-Category:
					<%=p.getPsubcategory()%></p>

				<p>
					Color:<%=p.getPcolor()%></p>

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
				%> <a href="two_wheeler_view_details.jsp?pid=<%=p.getPid()%>"
					class="btn btn-success btn-sm ml-1">View Details</a>
			</div>


			<%
			}
			%>
		</div>
		<hr>
		
		
	</div>
	<hr>


	<script>
		// Get the button
		let mybutton = document.getElementById("myBtn");

		// When the user scrolls down 20px from the top of the document, show the button
		window.onscroll = function() {
			scrollFunction()
		};

		function scrollFunction() {
			if (document.body.scrollTop > 20
					|| document.documentElement.scrollTop > 20) {
				mybutton.style.display = "block";
			} else {
				mybutton.style.display = "none";
			}
		}

		// When the user clicks on the button, scroll to the top of the document
		function topFunction() {
			document.body.scrollTop = 0;
			document.documentElement.scrollTop = 0;
		}
	</script>
	<%@include file="componet/footer.jsp"%>

</body>
</html>