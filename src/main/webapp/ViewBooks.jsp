<%@page import="com.entity.BookDetail"%>
<%@page import="com.DB.DBConnect"%>
<%@page import="com.DAO.BookDAOImpl"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<link rel="icon" href="image/icon.png" type="image/x-icon">
<title>EBook:Detailed View</title>
<%@include file="all_component/allcss.jsp"%>
</head>
<body style="background-color: #f0f2f2;">
	<%@include file="all_component/navbar.jsp"%>
	<%
	int bid = Integer.parseInt(request.getParameter("bid"));
	BookDAOImpl dao = new BookDAOImpl(DBConnect.getCon());
	BookDetail b = dao.getBookById(bid);
	%>
	<div class="container p-5">
		<div class="row">
			<div class="col-md-6 text-center p-5 border bg-white">
				<img src="bookImages/<%=b.getPhoto()%>"
					style="height: 200px; width: 150px"><br>
				<h4 class="mt-3">
					Book Name: <span class="text-success"><%=b.getBookName()%></span>
				</h4>
				<h4>
					Author Name: <span class="text-success"><%=b.getAuthor()%></span>
				</h4>
				<h4>
					Category: <span class="text-success"><%=b.getCategory()%></span>
				</h4>
			</div>

			<div class="col-md-6 text-center p-5 border bg-white">
				<h2><%=b.getBookName()%></h2>
				<%
				if (b.getCategory().equals("Old")) {
				%>
				<h3 class="text-success">Contact to Seller</h3>
				<h5 class="text-primary">
					<i class="fa-solid fa-envelope"></i> Email:
					<%=b.getUserEmail()%>
				</h5>
				<h5 class="text-primary">
					<i class="fa-solid fa-phone"></i> Phone No:
					<%=b.getPhone()%></h5>
				<%
				}
				%>
				<div class="row">
					<div class="col-md-4 text-danger text-center p-2">
						<i class="fa-solid fa-money-bill-wave fa-2x"></i>
						<p>Cash On Delivery</p>
					</div>
					<div class="col-md-4 text-danger text-center p-2">
						<i class="fa-solid fa-rotate-left fa-2x"></i>
						<p>Return Available</p>
					</div>
					<div class="col-md-4 text-danger text-center p-2">
						<i class="fa-solid fa-truck fa-2x"></i>
						<p>Free Delivery</p>
					</div>
				</div>
				<%
				if (b.getCategory().equals("Old")) {
				%>
				<div class="text-center p-3">
					<a href="index.jsp" class="btn btn-success"><i
						class="fa-solid fa-cart-shopping"></i> Continue Shopping</a> <a
						href="" class="btn btn-danger ml-1"><i
						class="fa-solid fa-indian-rupee-sign"></i><%=b.getPrice()%></a>
				</div>
				<%
				} else {
				%>
				<div class="text-center p-3">
					<a href="" class="btn btn-primary"><i
						class="fa-solid fa-cart-shopping"></i> Add Cart</a> <a href=""
						class="btn btn-danger ml-1"><i
						class="fa-solid fa-indian-rupee-sign"></i><%=b.getPrice()%></a>
				</div>
				<%
				}
				%>
			</div>
		</div>
	</div>
</body>
</html>