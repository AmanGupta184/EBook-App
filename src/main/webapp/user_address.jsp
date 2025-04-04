<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<link rel="icon" href="image/icon.png" type="image/x-icon">
<title>Edit Address</title>
<%@include file="all_component/allcss.jsp"%>
</head>
<body>
	<%@include file="all_component/navbar.jsp"%>
	<c:if test="${empty userobj }">
		<c:redirect url="login.jsp"></c:redirect>
	</c:if>
	<div class="container mt-3">
		<div class="row p-3">
			<div class="col-md-6 offset-md-3">
				<div class="card">
					<div class="card-body">
						<h5 class="text-center text-success">Add Address</h5>
						<form>
							<div class="form-row">
								<div class="form-group col-md-6">
									<label for="inputPassword4">Address</label> <input type="text"
										class="form-control" id="inputPassword4">
								</div>
								<div class="form-group col-md-6">
									<label for="inputEmail4">LandMark</label> <input type="text"
										class="form-control" id="inputEmail4">
								</div>
							</div>
							<div class="form-row">
								<div class="form-group col-md-5">
									<label for="inputPassword4">City</label> <input type="password"
										class="form-control" id="inputPassword4">
								</div>
								<div class="form-group col-md-4">
									<label for="inputEmail4">State</label> <input type="text"
										class="form-control" id="inputEmail4">
								</div>
								<div class="form-group col-md-3">
									<label for="inputPassword4">PinCode</label> <input type="text"
										class="form-control" id="inputPassword4">
								</div>
							</div>
							<div class="text-center">
								<a href="" class="btn btn-warning text-white">Add Address</a>
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
	<div style="margin-top: 218px">
		<%@include file="all_component/footer.jsp"%>
	</div>
</body>
</html>