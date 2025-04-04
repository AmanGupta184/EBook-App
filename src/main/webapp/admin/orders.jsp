<%@page import="com.entity.BookOrder"%>
<%@page import="java.util.List"%>
<%@page import="com.DB.DBConnect"%>
<%@page import="com.DAO.OrderDAOImpl"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<link rel="icon" href="image/icon.png" type="image/x-icon">
<title>Admin:All Orders</title>
<%@include file="allcss.jsp"%>
</head>
<body style="background-color: #f0f2f2">
	<%@include file="navbar.jsp"%>
	<c:if test="${empty userobj}">
		<c:redirect url="../login.jsp" />
	</c:if>
	<h3 class="text-center mt-3">Hello,${userobj.name}</h3>
	<br>
	<table class="table table-striped">
		<thead class="bg-primary text-white">
			<tr class="text-center">
				<th scope="col">Order Id</th>
				<th scope="col">Name</th>
				<th scope="col">Email</th>
				<th scope="col">Address</th>
				<th scope="col">Phone No</th>
				<th scope="col">Book Name</th>
				<th scope="col">Author</th>
				<th scope="col">Prize</th>
				<th scope="col">Payment</th>
			</tr>
		</thead>
		<tbody>
			<%
			OrderDAOImpl dao = new OrderDAOImpl(DBConnect.getCon());
			List<BookOrder> list = dao.getAllOrderedBook();
			for (BookOrder b : list) {
			%>
			<tr class="text-center">
				<th><%=b.getOrder_id()%></th>
				<td><%=b.getUser_name()%></td>
				<td><%=b.getEmail()%></td>
				<td><%=b.getFullAddress()%></td>
				<td><%=b.getPhone()%></td>
				<td><%=b.getBook_name()%></td>
				<td><%=b.getAuthor()%></td>
				<td><%=b.getPrice()%></td>
				<td><%=b.getPayment()%></td>
			</tr>
			<%
			}
			%>
		</tbody>
	</table>
	<div style="margin-top: 130px">
		<%@include file="footer.jsp"%>
	</div>
</body>
</html>