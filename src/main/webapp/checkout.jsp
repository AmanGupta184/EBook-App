<%@page import="java.util.List"%>
<%@page import="com.entity.Cart"%>
<%@page import="com.entity.User"%>
<%@page import="com.DB.DBConnect"%>
<%@page import="com.DAO.CartDAOImpl"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<link rel="icon" href="image/icon.png" type="image/x-icon">
<title>Cart Page</title>
<%@include file="all_component/allcss.jsp"%>
</head>
<body style="background-color: #f0f2f2">
	<%@include file="all_component/navbar.jsp"%>
	<c:if test="${empty userobj }">
		<c:redirect url="login.jsp"></c:redirect>
	</c:if>
	<c:if test="${not empty failMsg}">
		<div class="alert alert-danger text-center">${failMsg }</div>
		<c:remove var="failMsg" scope="session" />
	</c:if>
	<div class="container">
		<div class="row p-2">
			<div class="col-md-6">
				<div class="card bg-white mt-3">
					<h3 class="text-center text-success">Your Selected Item</h3>
					<div class="card-body">
						<table class="table">
							<thead>
								<tr class="text-center">
									<th scope="col">Book Name</th>
									<th scope="col">Author</th>
									<th scope="col">Price</th>
									<th scope="col">Action</th>
								</tr>
							</thead>
							<tbody>
								<%
								User us = (User) session.getAttribute("userobj");
								CartDAOImpl dao = new CartDAOImpl(DBConnect.getCon());
								List<Cart> list = dao.getBookByUser(us.getId());
								Double totalPrice = 0.0d;
								for (Cart c : list) {
									totalPrice = c.getTotalPrice();
								%>
								<tr class="text-center">
									<th><%=c.getBookName()%></th>
									<td><%=c.getAuthor()%></td>
									<td><%=c.getPrice()%></td>
									<td><a
										href="removeBook?bid=<%=c.getBookId()%>&&uid=<%=c.getUserId()%>&&cid=<%=c.getCartId()%>"
										class="btn btn-danger btn-sm">Remove</a></td>
								</tr>
								<%
								}
								%>
								<tr>
									<td>Total Price</td>
									<td></td>
									<td></td>
									<td><%=totalPrice%></td>
								</tr>
							</tbody>
						</table>
					</div>
				</div>
			</div>
			<div class="col-md-6">
				<div class="card bg-white mt-3">
					<h3 class="text-center text-success">Your Details for Order</h3>
					<div class="card-body">
						<form method="post" action="order">
							<input type="hidden" name="id" value="${userobj.id }">
							<div class="form-row">
								<div class="form-group col-md-6">
									<label for="inputEmail4">Name</label> <input type="text"
										name="username" class="form-control" id="inputEmail4"
										value="${userobj.name}" required="required">
								</div>
								<div class="form-group col-md-6">
									<label for="inputPassword4">Email</label> <input type="email"
										name="email" class="form-control" id="inputPassword4"
										value="${userobj.email}" required="required">
								</div>
							</div>
							<div class="form-row">
								<div class="form-group col-md-6">
									<label for="inputEmail4">Phone Number</label> <input
										type="number" name="phone" class="form-control"
										id="inputEmail4" value="${userobj.phone }" required="required">
								</div>
								<div class="form-group col-md-6">
									<label for="inputPassword4">Address</label> <input type="text"
										name="address" class="form-control" id="inputPassword4"
										required="required">
								</div>
							</div>
							<div class="form-row">
								<div class="form-group col-md-6">
									<label for="inputEmail4">LandMark</label> <input type="text"
										name="landmark" class="form-control" id="inputEmail4"
										required="required">
								</div>
								<div class="form-group col-md-6">
									<label for="inputPassword4">City</label> <input type="text"
										name="city" class="form-control" id="inputPassword4"
										required="required">
								</div>
							</div>
							<div class="form-row">
								<div class="form-group col-md-6">
									<label for="inputEmail4">State</label> <input type="text"
										name="state" class="form-control" id="inputEmail4"
										required="required">
								</div>
								<div class="form-group col-md-6">
									<label for="inputPassword4">PinCode</label> <input type="text"
										name="pincode" class="form-control" id="inputPassword4"
										required="required">
								</div>
							</div>
							<div class="form-group">
								<label>Payment Mode</label> <select name="payment"
									class="form-control" required="required">
									<option value="NoSelect">--Select--</option>
									<option value="COD">Cash On Delivery</option>
									<option value="Card">Card Payment</option>
								</select>
							</div>
							<div class="text-center">
								<button type="submit" class="btn btn-warning text-white">Order
									Now</button>
								<a href="index.jsp" class="btn btn-success ml-1">Continue
									Shopping</a>
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
	<div style="margin-top: 50px">
		<%@include file="all_component/footer.jsp"%>
	</div>
</body>
</html>