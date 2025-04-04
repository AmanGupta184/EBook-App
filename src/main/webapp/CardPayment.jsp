<%@page import="java.util.List"%>
<%@page import="com.entity.Cart"%>
<%@page import="com.entity.User"%>
<%@page import="com.DB.DBConnect"%>
<%@page import="com.DAO.CartDAOImpl"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>EBook:Card Payment</title>
<link rel="icon" href="image/icon.png" type="image/x-icon">
<%@include file="all_component/allcss.jsp"%>
<style type="text/css">
@import
	url('https://fonts.googleapis.com/css?family=Montserrat:400,700&display=swap')
	;

* {
	margin: 0;
	padding: 0;
	box-sizing: border-box;
	font-family: 'Montserrat', sans-serif;
}

body {
	display: flex;
	justify-content: center;
	align-items: center;
	min-height: 100vh;
	padding: 30px 10px;
}

.card {
	max-width: 500px;
	margin: auto;
	color: black;
	border-radius: 20 px;
}

p {
	margin: 0px;
}

.container .h8 {
	font-size: 30px;
	font-weight: 800;
	text-align: center;
}

.btn.btn-primary {
	width: 100%;
	height: 70px;
	display: flex;
	align-items: center;
	justify-content: space-between;
	padding: 0 15px;
	background-image: linear-gradient(to right, #77A1D3 0%, #79CBCA 51%, #77A1D3 100%);
	border: none;
	transition: 0.5s;
	background-size: 200% auto;
}

.btn.btn.btn-primary:hover {
	background-position: right center;
	color: #fff;
	text-decoration: none;
}

.btn.btn-primary:hover .fas.fa-arrow-right {
	transform: translate(15px);
	transition: transform 0.2s ease-in;
}

.form-control {
	color: white;
	background-color: #223C60;
	border: 2px solid transparent;
	height: 60px;
	padding-left: 20px;
	vertical-align: middle;
}

.form-control:focus {
	color: white;
	background-color: #0C4160;
	border: 2px solid #2d4dda;
	box-shadow: none;
}

.text {
	font-size: 14px;
	font-weight: 600;
}

::placeholder {
	font-size: 14px;
	font-weight: 600;
}
</style>
</head>
<body style="background-color: #f0f2f2">
	<c:if test="${empty userobj }">
		<c:redirect url="login.jsp"></c:redirect>
	</c:if>
	<c:if test="${not empty failMsg}">
		<div class="alert alert-danger text-center">${failMsg }</div>
		<c:remove var="failMsg" scope="session" />
	</c:if>
	<%
	User us = (User) session.getAttribute("userobj");
	CartDAOImpl dao = new CartDAOImpl(DBConnect.getCon());
	List<Cart> list = dao.getBookByUser(us.getId());
	Double totalPrice = 0.0d;
	for (Cart c : list) {
		totalPrice = c.getTotalPrice();
	%>
	<%
	}
	%>
	<form method="post" action="">
		<div class="container p-0">
			<div class="card px-4">
				<p class="h8 py-3">Payment Details</p>
				<div class="row gx-3">
					<div class="col-12">
						<div class="d-flex flex-column">
							<p class="text mb-1">Person Name</p>
							<input class="form-control mb-3" type="text" placeholder="Name" required="required">
						</div>
					</div>
					<div class="col-12">
						<div class="d-flex flex-column">
							<p class="text mb-1">Card Number</p>
							<input class="form-control mb-3" type="text"
								placeholder="1234 5678 435678" required="required">
						</div>
					</div>
					<div class="col-6">
						<div class="d-flex flex-column">
							<p class="text mb-1">Expiry</p>
							<input class="form-control mb-3" type="text"
								placeholder="MM/YYYY" required="required">
						</div>
					</div>
					<div class="col-6">
						<div class="d-flex flex-column">
							<p class="text mb-1">CVV</p>
							<input class="form-control mb-3 pt-2 " type="password"
								placeholder="***" required="required">
						</div>
					</div>
					<div class="col-12">
						<div class="btn btn-primary mb-3">
							<span class="ps-3">Pay Rs <%=totalPrice%></span> <span
								class="fas fa-arrow-right"></span>
						</div>
					</div>
				</div>
			</div>
		</div>
	</form>
</body>
</html>