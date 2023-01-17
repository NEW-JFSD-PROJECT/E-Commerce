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
<title>All Product</title>
<%@include file="componet/allcss.jsp"%>
<link rel="stylesheet" href="componet/style.css">
<style type="text/css">
body, h1, h2, h3, h4, h5, h6 {
	font-family: "Raleway", sans-serif
}

.bread-crumb {
	cursor: pointer;
}

.bread-crumb:hover {
	text-decoration: underline;
}

.blockmobile {
	position: relative;
	background-color: #fff;
	width: 25%;
	height: 400px;
	border: 2px solid #E0E0E0;
	box-shadow: 0 3px 6px 0 rgba(0, 0, 0, 0.2);
	cursor: pointer;
	margin-bottom: 25px;
}
.blockElectronics {
	position: relative;
	background-color: #fff;
	width: 24%;
	height: 450px;
	border: 2px solid #E0E0E0;
	box-shadow: 0 3px 6px 0 rgba(0, 0, 0, 0.2);
	cursor: pointer;
	margin-bottom: 25px;
}


.blockproduct {
	position: relative;
	background-color: #fff;
	width: 25%;
	height: 520px;
	border: 2px solid #E0E0E0;
	box-shadow: 0 3px 6px 0 rgba(0, 0, 0, 0.2);
	cursor: pointer;
	margin-bottom: 25px;
}
.blockElectric {
	position: relative;
	background-color: #fff;
	width: 24%;
	height: 450px;
	border: 2px solid #E0E0E0;
	box-shadow: 0 3px 6px 0 rgba(0, 0, 0, 0.2);
	cursor: pointer;
	margin-bottom: 25px;
}

.blockhome {
	position: relative;
	background-color: #fff;
	width: 22%;
	height:480px;
	border: 2px solid #E0E0E0;
	box-shadow: 0 3px 6px 0 rgba(0, 0, 0, 0.2);
	cursor: pointer;
	margin-bottom: 25px;
}





.fashionimage {
	width: 150px;
	height: 200px;
}

.mobileimage {
	width: 150px;
	height: 200px;
}

.electronicsimage {
	width: 250px;
	height: 200px;
}
.electricmage {
	width: 250px;
	height: 200px;
}
.homeimage {
	width: 170px;
	height:150px;
}
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

.blockappliance {
	position: relative;
	background-color: #fff;
	width: 25%;
	height: 450px;
	border: 2px solid #E0E0E0;
	box-shadow: 0 3px 6px 0 rgba(0, 0, 0, 0.2);
	cursor: pointer;
	margin-bottom: 25px;
}

.applianceimage {
	width: 150px;
	height: 200px;
}

.blockbaby {
	position: relative;
	background-color: #fff;
	width: 22%;
	height: 400px;
	border: 2px solid #E0E0E0;
	box-shadow: 0 3px 6px 0 rgba(0, 0, 0, 0.2);
	cursor: pointer;
	margin-bottom: 25px;
}

.babyimage {
	width: 150px;
	height: 200px;
}

.blockbeauty {
	position: relative;
	background-color: #fff;
	width: 22%;
	height: 520px;
	border: 2px solid #E0E0E0;
	box-shadow: 0 3px 6px 0 rgba(0, 0, 0, 0.2);
	cursor: pointer;
	margin-bottom: 25px;
}

.beautyimage {
	width: 150px;
	height: 250px;
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

.toast {
	visibility: hidden;
	min-width: 300px;	
	margin-left: -125px;	
	background : #333;
	color: white;//
	text-align: center;

	padding: 10px;  
	position: fixed; 
	z-index: 1; 
	left: 50%; 
	bottom: 30px; 
	font-size: 18px;	
	box-shadow : opx pox 100px #000;
}

.toast.display {
	visibility: visible;
	animation: fadein 0.5s, fadeout 0.5s 2.5s;
}


@
keyframes fadein {
	from {bottom: 0;
	opacity: 0;
}

to {
	bottom: 30px;
	opacity: 1;
}

}
@
keyframes fadeout {
	from {bottom: 30px;
	opacity: 1;
}

to {
	bottom: 0;
	opacity: 0;
}
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
	<!-- Fashion Section -->
	<div class="container-fluid px-5 py-5 mx-auto">
		<h1 class="text-center text-uppercase">Fashion</h1>

		<div class="row justify-content-between px-4">

			<%
			ProductDao dao2 = new ProductDao(DBConn.getConn());
			List<product> list2 = dao2.getAllFashion();
			for (product p : list2) {
			%>
			<div class="blockproduct text-center">

				<img class="fashionimage" src="product/<%=p.getPimage()%>">
				<p><%=p.getPname()%></p>
				<p>
					<i class="fa-sharp fa-solid fa-indian-rupee-sign"></i><%=p.getPprice()%></p>
				<p>
					Sub-Category:
					<%=p.getPsubcategory()%></p>
				<p>
					Color:<%=p.getPcolor()%></p>
				<p>Size: S M L XL XXL</p>

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

				<a href="Fashion_view_details.jsp?pid=<%=p.getPid()%>"
					class="btn btn-success btn-sm ml-1">View Details</a>
			</div>


			<%
			}
			%>
		</div>
		<div class="text-center mt-1">
			<a href="all_fashion.jsp" class="btn btn-danger btn-sm text-white">View
				All</a>
		</div>
	</div>
	<hr>
	<!-- Mobile Section -->

	<div class="container-fluid px-5 py-5 mx-auto">
		<h1 class="text-center text-uppercase">Mobiles</h1>


		<div class="row justify-content-between px-4">

			<%
			ProductDao dao3 = new ProductDao(DBConn.getConn());
			List<product> list3 = dao3.getAllMobile();
			for (product p : list3) {
			%>
			<div class="blockmobile text-center">

				<img class="mobileimage" src="product/<%=p.getPimage()%>">
				<p><%=p.getPname()%></p>
				<p>
					<i class="fa-sharp fa-solid fa-indian-rupee-sign"></i><%=p.getPprice()%></p>

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
				%> <a
					href="mobileview_details.jsp?pid=<%=p.getPid()%>"
					class="btn btn-success btn-sm ml-1">View Details</a>
			</div>


			<%
			}
			%>
		</div>
		<div class="text-center mt-1">
			<a href="all_mobile.jsp" class="btn btn-danger btn-sm text-white">View
				All</a>
		</div>
	</div>
	<hr>
	<!-- Electronics Section -->


	<div class="container-fluid px-5 py-5 mx-auto">
		<h1 class="text-center text-uppercase">Electronics</h1>


		<div class="row justify-content-between px-4">

			<%
			ProductDao dao4 = new ProductDao(DBConn.getConn());
			List<product> list4 = dao4.getAllElectronics();
			for (product p : list4) {
			%>
			<div class="blockElectronics text-center">

				<img class="electronicsimage" src="product/<%=p.getPimage()%>">
				<p><%=p.getPname()%></p>
				<p>
					<i class="fa-sharp fa-solid fa-indian-rupee-sign"></i><%=p.getPprice()%></p>

				<p>
					Sub-Category:
					<%=p.getPsubcategory()%></p>

			
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
				%> <a
					href="electronices_view_details.jsp?pid=<%=p.getPid()%>"
					class="btn btn-success btn-sm ml-1">View Details</a>
			</div>


			<%
			}
			%>
		</div>
		<div class="text-center mt-1">
			<a href="all_Electronics.jsp"
				class="btn btn-danger btn-sm text-white">View All</a>
		</div>
	</div>
	<hr>
	<!-- Electric Section -->

	<div class="container-fluid px-5 py-5 mx-auto">
		<h1 class="text-center text-uppercase">Electric</h1>


		<div class="row justify-content-between px-4">

			<%
			ProductDao dao5 = new ProductDao(DBConn.getConn());
			List<product> list5 = dao4.getAllElectric();
			for (product p : list5) {
			%>
			<div class="blockElectric text-center">

				<img class="electricmage" src="product/<%=p.getPimage()%>">
				<p><%=p.getPname()%></p>
				<p>
					<i class="fa-sharp fa-solid fa-indian-rupee-sign"></i><%=p.getPprice()%></p>



				
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
				%> <a
					href="electric_view_details.jsp?pid=<%=p.getPid()%>"
					class="btn btn-success btn-sm ml-1">View Details</a>
			</div>


			<%
			}
			%>
		</div>
		<div class="text-center mt-1">
			<a href="all_electric.jsp" class="btn btn-danger btn-sm text-white">View
				All</a>
		</div>
	</div>
	<hr>
	<!-- Home Section -->

	<div class="container-fluid px-5 py-5 mx-auto">
		<h1 class="text-center text-uppercase">Home</h1>


		<div class="row justify-content-between px-4">

			<%
			ProductDao dao6 = new ProductDao(DBConn.getConn());
			List<product> list6 = dao4.getAllHome();
			for (product p : list6) {
			%>
			<div class="blockhome text-center">

				<img class="homeimage" src="product/<%=p.getPimage()%>">
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
				%> <a
					href="home_view_details.jsp?pid=<%=p.getPid()%>"
					class="btn btn-success btn-sm ml-1">View Details</a>
			</div>


			<%
			}
			%>
		</div>
		<div class="text-center mt-1">
			<a href="all_home.jsp" class="btn btn-danger btn-sm text-white">View
				All</a>
		</div>
	</div>
	<hr>
	<!-- Appliance Section -->

	<div class="container-fluid px-5 py-5 mx-auto">
		<h1 class="text-center text-uppercase">Appliance</h1>


		<div class="row justify-content-between px-4">

			<%
			ProductDao dao7 = new ProductDao(DBConn.getConn());
			List<product> list7 = dao7.getAllAppliance();
			for (product p : list7) {
			%>
			<div class="blockappliance text-center">

				<img class="applianceimage" src="product/<%=p.getPimage()%>">
				<p><%=p.getPname()%></p>
				<p>
					<i class="fa-sharp fa-solid fa-indian-rupee-sign"></i><%=p.getPprice()%></p>

				
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
				%> <a
					href="appliance_view_details.jsp?pid=<%=p.getPid()%>"
					class="btn btn-success btn-sm ml-1">View Details</a>
			</div>


			<%
			}
			%>
		</div>
		<div class="text-center mt-1">
			<a href="all_appliance.jsp" class="btn btn-danger btn-sm text-white">View
				All</a>
		</div>
	</div>
	<hr>

	<!-- Baby_Kids Section -->

	<div class="container-fluid px-5 py-5 mx-auto">
		<h1 class="text-center text-uppercase">Baby_Kids</h1>


		<div class="row justify-content-between px-4">

			<%
			ProductDao dao8 = new ProductDao(DBConn.getConn());
			List<product> list8 = dao8.getAllBaby_Kids();
			for (product p : list8) {
			%>
			<div class="blockbaby text-center">

				<img class="babyimage" src="product/<%=p.getPimage()%>">
				<p><%=p.getPname()%></p>
				<p>
					<i class="fa-sharp fa-solid fa-indian-rupee-sign"></i><%=p.getPprice()%></p>

				
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
				%><a
					href="baby_kids_view_details.jsp?pid=<%=p.getPid()%>"
					class="btn btn-success btn-sm ml-1">View Details</a>
			</div>


			<%
			}
			%>
		</div>
		<div class="text-center mt-1">
			<a href="all_baby_kids.jsp" class="btn btn-danger btn-sm text-white">View
				All</a>
		</div>
	</div>
	<hr>
	<!-- Beauty & More Section -->


	<div class="container-fluid px-5 py-5 mx-auto">
		<h1 class="text-center text-uppercase">Beauty & More</h1>


		<div class="row justify-content-between px-4">

			<%
			ProductDao dao9 = new ProductDao(DBConn.getConn());
			List<product> list9 = dao9.getBeauty_More();
			for (product p : list9) {
			%>
			<div class="blockbeauty text-center">

				<img class="beautyimage" src="product/<%=p.getPimage()%>">
				<p><%=p.getPname()%></p>
				<p>
					<i class="fa-sharp fa-solid fa-indian-rupee-sign"></i><%=p.getPprice()%></p>

				<p>
					Sub-Category:
					<%=p.getPsubcategory()%></p>

				
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
				%> <a
					href="beauty_view_details.jsp?pid=<%=p.getPid()%>"
					class="btn btn-success btn-sm ml-1">View Details</a>
			</div>


			<%
			}
			%>
		</div>
		<div class="text-center mt-1">
			<a href="all_beauty_more.jsp"
				class="btn btn-danger btn-sm text-white">View All</a>
		</div>
	</div>
	<hr>

	<!-- Two Wheeler Section -->

	<div class="container-fluid px-5 py-5 mx-auto">
		<h1 class="text-center text-uppercase">Two Wheeler</h1>


		<div class="row justify-content-between px-4">

			<%
			ProductDao dao10 = new ProductDao(DBConn.getConn());
			List<product> list10 = dao10.getTwo_Wheelers();
			for (product p : list10) {
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
				%> <a
					href="two_wheeler_view_details.jsp?pid=<%=p.getPid()%>"
					class="btn btn-success btn-sm ml-1">View Details</a>
			</div>


			<%
			}
			%>
		</div>
		<div class="text-center mt-1">
			<a href="all_two_wheeler.jsp"
				class="btn btn-danger btn-sm text-white">View All</a>
		</div>
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