<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>



<!DOCTYPE html>
<html>
<head>
<title>E-COMMERCE</title>
<%@include file="componet/allcss.jsp"%>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet"
	href="https://fonts.googleapis.com/css?family=Raleway">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
	<link rel="stylesheet" href="componet/style.css">
<style>

/* Full height image header */
.bgimg-1 {
	margin-top: 20px;
	background-position: center;
	background-size: cover;
	background-image: url("img/ecom1.jfif");
	height: 50vh;
	width: 100%;
	background-repeat: no-repeat; 
}

body {
	background-color: #eee
}

.mt-100 {
	margin-top: 80px;
}

.card {
	border-radius: 7px !important;
	border-color: #e1e7ec;
	position: relative;
	height: 380px;
}

.mb-30 {
	margin-bottom: 30px !important;
}

.card-img-tiles {
	display: block;
	border-bottom: 1px solid #e1e7ec;
}

a {
	color: #0da9ef;
	text-decoration: none !important;
}

.card-img-tiles>.inner {
	display: table;
	width: 100%;
}

.card-img-tiles .main-img, .card-img-tiles .thumblist {
	position: relative;
	display: table-cell;
	width: 65%;
	padding: 10px;
	vertical-align: middle;
	position: relative;
}

.card-img-tiles .main-img>img:last-child, .card-img-tiles .thumblist>img:last-child
	{
	margin-bottom: 0;
}

.card-img-tiles .main-img>img, .card-img-tiles .thumblist>img {
	display: block;
	width: 100%;
	margin-bottom: 6px;
}

.thumblist {
	width: 35%;
	border-left: 1px solid #e1e7ec !important;
	display: table-cell;
	width: 65%;
	padding: 15px;
	vertical-align: middle;
	position: relative;
}

.card-img-tiles .thumblist>img {
	display: block;
	width: 100%;
	margin-bottom: 6px;
}

.btn-group-sm>.btn, .btn-sm {
	padding: .45rem .5rem !important;
	font-size: .875rem;
	line-height: 1.5;
	border-radius: .2rem;
}
</style>
</head>
<body>
	<%@include file="componet/navbar.jsp"%>

	<!-- Slider -->
	<header class="bgimg-1 w3-display-container w3-grayscale-min" id="home">
		<div class="w3-display-left w3-text-white" style="padding: 48px">
			<span class="w3-jumbo w3-hide-small">Start something that
				matters</span><br> <span
				class="w3-xxlarge w3-hide-large w3-hide-medium">Start
				something that matters</span><br> <span class="w3-large">Stop
				wasting valuable time with projects that just isn't you.</span>
			<p>
				<a href="#work"
					class="w3-button w3-white w3-padding-large w3-large w3-margin-top w3-opacity w3-hover-opacity-off">Learn
					more and start today</a>
			</p>
		</div>

	</header>

	<div class="container mt-100">



<!-- Fashion -->
		<div class="row">
			<div class="col-md-4 col-sm-6">
				<div class="card mb-30">
					<a class="card-img-tiles" href="#" data-abc="true">
						<div class="inner">
							<div class="main-img">
								<img src="img/fashion.jfif" alt="Category">
							</div>
							<div class="thumblist">
								<img src="img/fashion.jfif" alt="Category"><img
									src="img/fashion.jfif" alt="Category">
							</div>
						</div>
					</a>
					<div class="card-body text-center">
						<h4 class="card-title">Fashion</h4><br>
						<a class="btn btn-outline-primary btn-sm" href="all_fashion.jsp" data-abc="true">View
							Products</a>
					</div>
				</div>
			</div>
			<!-- Mobile -->
			
			<div class="col-md-4 col-sm-6">
				<div class="card mb-30">
					<a class="card-img-tiles" href="#" data-abc="true">
						<div class="inner">
							<div class="main-img">
								<img src="img/phone.jpg" alt="Category">
							</div>
							<div class="thumblist">
								<img src="img/phone.jpg" alt="Category"><img
									src="img/phone.jpg" alt="Category">
							</div>
						</div>
					</a>
					<div class="card-body text-center">
						<h4 class="card-title">Mobiles</h4><br>
				
						<a class="btn btn-outline-primary btn-sm" href="all_mobile.jsp" data-abc="true">View
							Products</a>
					</div>
				</div>
			</div>
			
			<!-- Electronics -->
			
			<div class="col-md-4 col-sm-6">
				<div class="card mb-30">
					<a class="card-img-tiles" href="#" data-abc="true">
						<div class="inner">
							<div class="main-img">
								<img src="img/electronic.jfif" alt="Category">
							</div>
							<div class="thumblist">
								<img src="img/electronic.jfif" alt="Category"><img
									src="img/electronic.jfif" alt="Category">
							</div>
						</div>
					</a>
					<div class="card-body text-center">
						<h4 class="card-title">Electronics</h4><br>
						
						<a class="btn btn-outline-primary btn-sm" href="all_Electronics.jsp" data-abc="true">View
							Products</a>
					</div>
				</div>
			</div>
			
			<!-- Electric -->
			
				<div class="col-md-4 col-sm-6">
				<div class="card mb-30">
					<a class="card-img-tiles" href="#" data-abc="true">
						<div class="inner">
							<div class="main-img">
								<img src="img/electric.jfif" alt="Category">
							</div>
							<div class="thumblist">
								<img src="img/electric.jfif" alt="Category"><img
									src="img/electric.jfif" alt="Category">
							</div>
						</div>
					</a>
					<div class="card-body text-center">
						<h4 class="card-title">Electric</h4><br>
						
						<a class="btn btn-outline-primary btn-sm" href="all_electric.jsp" data-abc="true">View
							Products</a>
					</div>
				</div>
			</div>
			
			<!-- Home -->
			
				<div class="col-md-4 col-sm-6">
				<div class="card mb-30">
					<a class="card-img-tiles" href="#" data-abc="true">
						<div class="inner">
							<div class="main-img">
								<img src="img/home.jfif" alt="Category">
							</div>
							<div class="thumblist">
								<img src="img/home.jfif" alt="Category"><img
									src="img/home.jfif" alt="Category">
							</div>
						</div>
					</a>
					<div class="card-body text-center">
						<h4 class="card-title">Home</h4><br>
						
						<a class="btn btn-outline-primary btn-sm" href="all_home.jsp" data-abc="true">View
							Products</a>
					</div>
				</div>
			</div>
			
			<!-- Appliance -->
			<div class="col-md-4 col-sm-6">
				<div class="card mb-30">
					<a class="card-img-tiles" href="#" data-abc="true">
						<div class="inner">
							<div class="main-img">
								<img src="img/appliance.jfif" alt="Category">
							</div>
							<div class="thumblist">
								<img src="img/appliance.jfif" alt="Category"><img
									src="img/appliance.jfif" alt="Category">
							</div>
						</div>
					</a>
					<div class="card-body text-center">
						<h4 class="card-title">Appliance</h4><br>
						
						<a class="btn btn-outline-primary btn-sm" href="all_appliance.jsp" data-abc="true">View
							Products</a>
					</div>
				</div>
			</div>
			<!-- Baby_Kids -->
			<div class="col-md-4 col-sm-6">
				<div class="card mb-30">
					<a class="card-img-tiles" href="#" data-abc="true">
						<div class="inner">
							<div class="main-img">
								<img src="img/baby.jfif" alt="Category">
							</div>
							<div class="thumblist">
								<img src="img/baby.jfif" alt="Category"><img
									src="img/baby.jfif" alt="Category">
							</div>
						</div>
					</a>
					<div class="card-body text-center">
						<h4 class="card-title">Baby_Kids</h4><br>
						
						<a class="btn btn-outline-primary btn-sm" href="all_baby_kids.jsp" data-abc="true">View
							Products</a>
					</div>
				</div>
			</div>
			
			
			<!-- Beauty & More -->
			<div class="col-md-4 col-sm-6">
				<div class="card mb-30">
					<a class="card-img-tiles" href="#" data-abc="true">
						<div class="inner">
							<div class="main-img">
								<img src="img/beauty.png" alt="Category">
							</div>
							<div class="thumblist">
								<img src="img/beauty.png" alt="Category"><img
									src="img/beauty.png" alt="Category">
							</div>
						</div>
					</a>
					<div class="card-body text-center">
						<h4 class="card-title">Beauty & More</h4><br>
						
						<a class="btn btn-outline-primary btn-sm" href="all_beauty_more.jsp" data-abc="true">View
							Products</a>
					</div>
				</div>
			</div>
			
			<!-- Two Wheeler -->
			<div class="col-md-4 col-sm-6">
				<div class="card mb-30">
					<a class="card-img-tiles" href="#" data-abc="true">
						<div class="inner">
							<div class="main-img">
								<img src="img/two.png" alt="Category">
							</div>
							<div class="thumblist">
								<img src="img/two.png" alt="Category"><img
									src="img/two.png" alt="Category">
							</div>
						</div>
					</a>
					<div class="card-body text-center">
						<h4 class="card-title">Two Wheeler</h4><br>
						
						<a class="btn btn-outline-primary btn-sm" href="all_two_wheeler.jsp" data-abc="true">View
							Products</a>
					</div>
				</div>
			</div>
			
			
		</div>
	</div>





	<%@include file="componet/footer.jsp"%>
</body>
</html>