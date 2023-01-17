<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page isELIgnored="false"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<%@include file="componet/allcss.jsp"%>
<link rel="stylesheet" href="componet/style.css">
<title>Contact Us</title>
<style type="text/css">
body {
	color: #fff
}

.right_conatct_social_icon {
	background: linear-gradient(to top right, #1325e8 -5%, #8f10b7 100%);
}

.contact_us {
	background-color: #f1f1f1;
	padding: 120px 0px;
}

.contact_inner {
	background-color: #fff;
	position: relative;
	box-shadow: 20px 22px 44px #cccc;
	border-radius: 25px;
}

.contact_field {
	padding: 60px 340px 90px 100px;
}

.right_conatct_social_icon {
	height: 100%;
}

.contact_field h3 {
	color: #000;
	font-size: 40px;
	letter-spacing: 1px;
	font-weight: 600;
	margin-bottom: 10px
}

.contact_field p {
	color: #000;
	font-size: 13px;
	font-weight: 400;
	letter-spacing: 1px;
	margin-bottom: 35px;
}

.contact_field .form-control {
	border-radius: 0px;
	border: none;
	border-bottom: 1px solid #ccc;
}

.contact_field .form-control:focus {
	box-shadow: none;
	outline: none;
	border-bottom: 2px solid #1325e8;
}

.contact_field .form-control::placeholder {
	font-size: 13px;
	letter-spacing: 1px;
}

.contact_info_sec {
	position: absolute;
	background-color: #2d2d2d;
	right: 1px;
	top: 18%;
	height: 340px;
	width: 340px;
	padding: 40px;
	border-radius: 25px 0 0 25px;
}

.contact_info_sec h4 {
	letter-spacing: 1px;
	padding-bottom: 15px;
}

.info_single {
	margin: 30px 0px;
}

.info_single i {
	margin-right: 15px;
}

.info_single span {
	font-size: 14px;
	letter-spacing: 1px;
}

button.contact_form_submit {
	background: linear-gradient(to top right, #1325e8 -5%, #8f10b7 100%);
	border: none;
	color: #fff;
	padding: 10px 15px;
	width: 100%;
	margin-top: 25px;
	border-radius: 35px;
	cursor: pointer;
	font-size: 14px;
	letter-spacing: 2px;
}

.socil_item_inner li {
	list-style: none;
}

.socil_item_inner li a {
	color: #fff;
	margin: 0px 15px;
	font-size: 14px;
}

.socil_item_inner {
	padding-bottom: 10px;
}

.map_sec {
	padding: 50px 0px;
}

.map_inner h4, .map_inner p {
	color: #000;
	text-align: center
}

.map_inner p {
	font-size: 13px;
}

.map_bind {
	margin-top: 50px;
	border-radius: 30px;
	overflow: hidden;
}
</style>
</head>
<body>
	<%@include file="componet/navbar.jsp"%>
	<c:if test="${not empty errorMsg}">
		<div class="alert alert-success text-center" role="alert">${errorMsg}</div>

		<c:remove var="errorMsg" scope="session" />
	</c:if>
	<c:if test="${not empty sucMsg}">
		<div class="alert alert-success  text-center" role="alert">${sucMsg}</div>
		<c:remove var="sucMsg" scope="session" />
	</c:if>

	<section class="contact_us">
		<div class="container">
			<div class="row">
				<div class="col-md-10 offset-md-1">
					<div class="contact_inner">
						<div class="row">
							<div class="col-md-10">
								<div class="contact_form_inner">
									<div class="contact_field">
										<h3>Contatc Us</h3>
										<p>Feel Free to contact us any time. We will get back to
											you as soon as we can!.</p>


										<form action="contact" method="post">
											<input type="text" class="form-control form-group"
												placeholder="Name" name="name"> <input type="text"
												class="form-control form-group" placeholder="Email"
												name="email">
												<input
										maxlength="10" type="number" class="form-control" name="phno"
										placeholder="Phone Number">
											<textarea class="form-control form-group"
												placeholder="Message" name="msg"></textarea>
											<button class="contact_form_submit">Send</button>
											
										</form>
									</div>
								</div>
							</div>
							<div class="col-md-2">
								<div class="right_conatct_social_icon d-flex align-items-end">
									<div class="socil_item_inner d-flex">
										<li><a href="#"><i class="fab fa-facebook-square"></i></a></li>
										<li><a href="#"><i class="fab fa-instagram"></i></a></li>
										<li><a href="#"><i class="fab fa-twitter"></i></a></li>
									</div>
								</div>
							</div>
						</div>
						<div class="contact_info_sec">
							<h4>Contact Info</h4>
							<div class="d-flex info_single align-items-center">
								<i class="fas fa-headset"></i> <span>+91 8009 054294</span>
							</div>
							<div class="d-flex info_single align-items-center">
								<i class="fas fa-envelope-open-text"></i> <span>info@flightmantra.com</span>
							</div>
							<div class="d-flex info_single align-items-center">
								<i class="fas fa-map-marked-alt"></i> <span>1000+ Travel
									partners and 65+ Service city across India, USA, Canada & UAE</span>
							</div>

						</div>
					</div>
				</div>
			</div>
		</div>
	</section>

	<section class="map_sec">
		<div class="container">
			<div class="row">
				<div class="col-md-10 offset-md-1">
					<div class="map_inner">
						<h4>Find Us on Google Map</h4>
						<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit.
							Tempore quo beatae quasi assumenda, expedita aliquam minima
							tenetur maiores neque incidunt repellat aut voluptas hic dolorem
							sequi ab porro, quia error.</p>
						<div class="map_bind">

							<iframe
								src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d30688417.89504741!2d64.41490197220115!3d20.128007356841444!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x30635ff06b92b791%3A0xd78c4fa1854213a6!2sIndia!5e0!3m2!1sen!2sin!4v1673539689663!5m2!1sen!2sin"
								width="100%" height="450" frameborder="0" style="border: 0;"
								allowfullscreen="" aria-hidden="false" tabindex="0"></iframe>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>


</body>
</html>