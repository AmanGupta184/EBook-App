<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<link rel="icon" href="image/icon.png" type="image/x-icon">
<title>Admin:Add Books</title>
<%@include file="allcss.jsp"%>
</head>
<body style="background-color: #f0f2f2">
	<%@include file="navbar.jsp"%>
	<c:if test="${empty userobj}">
		<c:redirect url="../login.jsp" />
	</c:if>
	<div class="container">
		<div class="row">
			<div class="col-md-4 offset-md-4">
				<div class="card mt-3">
					<div class="card-body">
						<h3 class="text-center">Add Books</h3>
						<c:if test="${not empty succMsg }">
							<p class="text-center text-success">${succMsg }</p>
							<c:remove var="succMsg" scope="session" />
						</c:if>
						<c:if test="${not empty failMsg }">
							<p class="text-center text-danger">${failMsg }</p>
							<c:remove var="failMsg" scope="session" />
						</c:if>
						<form method="post" action="../add_books"
							enctype="multipart/form-data">
							<div class="form-group">
								<label for="exampleInputEmail1">Book Name*</label> <input
									type="text" name="bname" class="form-control"
									id="exampleInputEmail1" aria-describedby="emailHelp"
									required="required">
							</div>
							<div class="form-group">
								<label for="exampleInputEmail1">Author Name*</label> <input
									type="text" name="author" class="form-control"
									id="exampleInputEmail1" aria-describedby="emailHelp"
									required="required">
							</div>
							<div class="form-group">
								<label for="exampleInputEmail1">Price*</label> <input
									type="number" name="price" class="form-control"
									id="exampleInputEmail1" aria-describedby="emailHelp"
									required="required">
							</div>
							<div class="form-group">
								<label for="inputState">Book Category*</label> <select
									name="bookCategory" class="form-control" id="inputState"
									required="required">
									<option selected>--Select--</option>
									<option value="TextBook">TextBook</option>
									<option value="Story">Story</option>
									<option value="Novel">Novel</option>
									<option value="Manual">Practical Manual</option>
									<option value="Anime">Anime Manga</option>
								</select>
							</div>
							<div class="form-group">
								<label for="inputState">Category*</label> <select
									name="category" class="form-control" id="inputState"
									required="required">
									<option selected>--Select--</option>
									<option value="New">New Book</option>
								</select>
							</div>
							<div class="form-group">
								<label for="inputState">Book Status*</label> <select
									name="status" class="form-control" id="inputState"
									required="required">
									<option selected>--Select--</option>
									<option value="Active">Active</option>
									<option value="Inactive">Inactive</option>
								</select>
							</div>
							<div class="form-group">
								<label for="exampleFormControlFile1">Upload Photo</label> <input
									type="file" name="img" class="form-control-file"
									id="exampleFormControlFile1" required="required">
							</div>
							<div class="text-center">
								<button type="submit" class="btn btn-primary">Add</button>
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
	<div style="margin-top: 30px">
		<%@include file="footer.jsp"%>
	</div>
</body>
</html>