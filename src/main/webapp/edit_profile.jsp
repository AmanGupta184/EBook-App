<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<link rel="icon" href="image/icon.png" type="image/x-icon">
<title>Edit Profile</title>
<%@include file="all_component/allcss.jsp"%>
</head>
<body style="background-color: #f0f2f2">
	<%@include file="all_component/navbar.jsp"%>
	<c:if test="${empty userobj }">
		<c:redirect url="login.jsp"></c:redirect>
	</c:if>
	<c:if test="${not empty succMsg }">
		<div class="alert alert-success text-center">${succMsg }</div>
		<c:remove var="succMsg" scope="session" />
	</c:if>
	<c:if test="${not empty failMsg }">
		<div class="alert alert-danger text-center">${failMsg }</div>
		<c:remove var="failMsg" scope="session" />
	</c:if>
	<div class="container mt-3">
		<div class="row">
			<div class="col-md-4 offset-md-4">
				<div class="card">
					<div class="card-body">
						<h5 class="text-center text-primary">Edit Profile</h5>
						<form method="post" action="update_profile">
							<input type="hidden" name="id" value="${userobj.id}">
							<div class="form-group">
								<label for="exampleInputEmail1">Enter Full Name</label> <input
									name="fname" type="text" class="form-control"
									id="exampleInputEmail1" aria-describedby="emailHelp"
									value="${userobj.name}">
							</div>
							<div class="form-group">
								<label for="exampleInputEmail1">Email address</label> <input
									type="email" name="email" class="form-control"
									id="exampleInputEmail1" aria-describedby="emailHelp"
									value="${userobj.email}">
							</div>
							<div class="form-group">
								<label for="exampleInputEmail1">Phone No</label> <input
									type="number" name="phone" class="form-control"
									id="exampleInputEmail1" aria-describedby="emailHelp"
									value="${userobj.phone}">

							</div>
							<div class="form-group">
								<label for="exampleInputPassword1">Password</label> <input
									type="password" name="password" class="form-control"
									id="exampleInputPassword1">
							</div>
							<div class="text-center">
								<button type="submit" class="btn btn-primary">Update</button>
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
	<div style="margin-top: 130px">
		<%@include file="all_component/footer.jsp"%>
	</div>
</body>
</html>