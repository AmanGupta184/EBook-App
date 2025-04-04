<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<link rel="icon" href="image/icon.png" type="image/x-icon">
<title>EBook:Contact Us</title>
<%@include file="all_component/allcss.jsp"%>
<style type="text/css">
textarea {
	width: 100%;
	border: 1px solid #ccc;
	outline: none;
	padding: 10px;
	box-sizing: border-box;
}

tr td:first-child {
	padding-right: 20px;
}

tr td {
	padding-top: 40px;
}
</style>
</head>
<body style="background-color: #f0f2f2">
	<%@include file="all_component/navbar.jsp"%>
	<div class="text-center mt-4">
		<h3>Connect with Us</h3>
	</div>
	<div class="container p-5">
		<div class="row">
			<div class="col-md-7 p-3 border bg-white">
				<div>
					<h3>Send your Request</h3>
				</div>
				<br>
				<form method="post" action="https://api.web3forms.com/submit">
					<div class="form-row">
					<input type="hidden" name="access_key"
						value="e2d4a4d5-edd6-4f27-b053-209fe53097a8">
						<input type="hidden" name="from_name" value="Nalanda Book Center">
						<div class="form-group col-md-6">
							<label for="inputEmail4">Name</label> <input type="text"
								name="name" class="form-control" id="inputName1"
								required="required">
						</div>
						<div class="form-group col-md-6">
							<label for="inputPassword4">phone</label> <input type="number"
								name="phone" class="form-control" id="inputPhone1"
								required="required">
						</div>
					</div>
					<div class="form-row">
						<div class="form-group col-md-6">
							<label for="inputEmail4">Email</label> <input type="email"
								name="email" class="form-control" id="inputEmail1"
								required="required">
						</div>
						<div class="form-group col-md-6">
							<label for="inputPassword4">Subject</label> <input type="text"
								name="subject" class="form-control" id="inputSubject1"
								required="required">
						</div>
					</div>
					<div>
						<label>Message</label>
						<textarea for="inputMessage4" type="text" name="message"
							class="form-control" cols="30" rows="3" required="required"></textarea>
					</div>
					<br>
					<div class="text-center">
						<button type="submit" class="btn btn-primary">Send Form</button>
					</div>
				</form>
			</div>

			<div class="col-md-5 p-3 border bg-primary text-white">
				<div>
					<h3>Reach Us</h3>
				</div>
				<table>
					<tr>
						<td>Email</td>
						<td>amangupta184@outlook.com</td>
					</tr>
					<tr>
						<td>Phone</td>
						<td>+91 8369929536</td>
					</tr>
					<tr>
						<td>Address</td>
						<td>SVP Nagar,Central Railway Colony,Wenden Avenue
							Road,Matunga Road,Mumbai-400019</td>
					</tr>
				</table>
			</div>
		</div>
	</div>
	<div style="margin-top: 50px">
		<%@include file="all_component/footer.jsp"%>
	</div>
</body>
</html>