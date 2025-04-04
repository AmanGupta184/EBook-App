<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<link rel="icon" href="image/icon.png" type="image/x-icon">
<title>HelpLine</title>
<%@include file="all_component/allcss.jsp"%>
</head>
<body style="background-color: #f0f2f2">
	<%@include file="all_component/navbar.jsp"%>
	<c:if test="${empty userobj }">
		<c:redirect url="login.jsp"></c:redirect>
	</c:if>
	<div class="container">
		<div class="row p-5">
			<div class="col-md-4 offset-md-4 text-center">
				<div class="text-success">
					<i class="fa-solid fa-phone-square-alt fa-5x"></i>
				</div>
				<div class="text-center">
					<h3>24*7 Service</h3>
					<h4>HelpLine Number</h4>
					<h5>+91 8369929536</h5>
				</div>
				<div class="text-center">
					<a href="index.jsp" class="btn btn-primary">Home</a>
				</div>
			</div>
		</div>
	</div>
</body>
</html>