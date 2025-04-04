<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<link rel="icon" href="image/icon.png" type="image/x-icon">
<title>EBook:Login</title>
<%@include file="all_component/allcss.jsp"%>
</head>
<body style="background-color: #f0f2f2">
	<%@include file="all_component/navbar.jsp"%>
	<div class="container mt-5">
		<div class="row">
			<div class="col-md-4 offset-md-4">
				<div class="card">
					<h3 class="text-center">Login Page</h3>
					<c:if test="${not empty succMsg }">
						<h5 class="text-center text-success">${succMsg }</h5>
						<c:remove var="succMsg" scope="session" />
					</c:if>
					<c:if test="${not empty failMsg }">
						<h5 class="text-center text-danger">${failMsg }</h5>
						<c:remove var="failMsg" scope="session" />
					</c:if>
					<div class="card-body">
						<form method="post" action="login">
							<div class="form-group">
								<label for="exampleInputEmail1">Email address*</label> <input
									type="email" name="email" class="form-control"
									id="exampleInputEmail1" aria-describedby="emailHelp"
									required="required">
							</div>
							<div class="form-group">
								<label for="exampleInputPassword1">Password*</label> <input
									type="password" name="password" class="form-control"
									id="exampleInputPassword1" required="required">
							</div>
							<div class="text-center">
								<button type="submit" class="btn btn-primary">Login</button>
							</div>
							<div class="text-center">
								<a href="register.jsp">Create Account</a>
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
	<div style="margin-top: 230px">
		<%@include file="all_component/footer.jsp"%>
	</div>
</body>
</html>