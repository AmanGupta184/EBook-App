<%@page import="com.entity.BookDetail"%>
<%@page import="java.util.List"%>
<%@page import="com.entity.User"%>
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
<title>User:Old Book</title>
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
	<div class="container p-5">
		<table class="table table-striped">
			<thead class="bg-primary text-white text-center">
				<tr>
					<th scope="col">Image</th>
					<th scope="col">Book Name</th>
					<th scope="col">Author</th>
					<th scope="col">Price</th>
					<th scope="col">Category</th>
					<th scope="col">Action</th>
				</tr>
			</thead>
			<tbody>
				<%
				User us = (User) session.getAttribute("userobj");
				String userEmail = us.getEmail();
				BookDAOImpl dao = new BookDAOImpl(DBConnect.getCon());
				List<BookDetail> list = dao.getBookByOld(userEmail, "Old");
				for (BookDetail b : list) {
				%>
				<tr class="text-center">
					<td><img src="./bookImages/<%=b.getPhoto()%>"
						style="height: 50px; width: 50px"></td>
					<td><%=b.getBookName()%></td>
					<td><%=b.getAuthor()%></td>
					<td><%=b.getPrice()%></td>
					<td><%=b.getCategory()%></td>
					<td><a
						href="delete_old_book?email=<%=userEmail%>&&bid=<%=b.getBookId()%>"
						class="btn btn-danger btn-sm">Delete</a></td>
				</tr>
				<%
				}
				%>
			</tbody>
		</table>
	</div>
</body>
</html>