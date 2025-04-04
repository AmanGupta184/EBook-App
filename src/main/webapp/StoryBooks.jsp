<%@page import="com.entity.User"%>
<%@page import="com.entity.BookDetail"%>
<%@page import="java.util.List"%>
<%@page import="com.DB.DBConnect"%>
<%@page import="com.DAO.BookDAOImpl"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<link rel="icon" href="image/icon.png" type="image/x-icon">
<title>EBook:StoryBook</title>
<%@include file="all_component/allcss.jsp"%>
<style type="text/css">
.back-img {
	background: url("image/book.jpg");
	height: 50vh;
	width: 100%;
	background-repeat: no-repeat;
	background-size: cover;
}

.crd-ho:hover {
	background: #D8C1C1;
}
</style>
</head>
<body style="background-color: #f0f2f2">
	<%@include file="all_component/navbar.jsp"%><br>
	<%
	User us = (User) session.getAttribute("userobj");
	%>
	<div class="container">
		<br>
		<div class="row">
			<%
			BookDAOImpl dao = new BookDAOImpl(DBConnect.getCon());
			List<BookDetail> list = dao.getAllStoryBooks();
			for (BookDetail b : list) {
			%>
			<div class="col-md-3">
				<div class="card crd-ho">
					<div class="card-body text-center">
						<img alt="" src="bookImages/<%=b.getPhoto()%>"
							style="height: 200px; width: 150px;" class="img-thumblin">
						<p><%=b.getBookName()%></p>
						<p><%=b.getAuthor()%></p>
						<%
						if (b.getCategory().equals("Old")) {
						%>
						<p><%=b.getCategory()%></p>
						<div class="row text-center">
							<a href="ViewBooks.jsp?bid=<%=b.getBookId()%>"
								class="btn btn-success btn-sm ml-5">Detail View</a> <a
								class="btn btn-danger btn-sm ml-1 text-white"><i
								class="fa-solid fa-indian-rupee-sign"></i><%=b.getPrice()%></a>
						</div>
						<%
						} else {
						%>
						<p><%=b.getCategory()%></p>
						<div class="row text-center">
							<%
							if (us == null) {
							%>
							<a href="login.jsp" class="btn btn-danger btn-sm ml-1"><i
								class="fa-solid fa-cart-shopping"></i> Add Cart</a>
							<%
							} else {
							%>
							<a href="cart?bid=<%=b.getBookId()%>&&uid=<%=us.getId()%>"
								class="btn btn-danger btn-sm ml-1"><i
								class="fa-solid fa-cart-shopping"></i> Add Cart</a>
							<%
							}
							%>
							<a href="ViewBooks.jsp?bid=<%=b.getBookId()%>"
								class="btn btn-success btn-sm ml-1">Detail View</a> <a
								class="btn btn-danger btn-sm ml-1 text-white"><i
								class="fa-solid fa-indian-rupee-sign"></i><%=b.getPrice()%></a>
						</div>
						<%
						}
						%>
					</div>
				</div>
			</div>
			<%
			}
			%>
		</div>
	</div>
	<div style="margin-top: 130px">
		<%@include file="all_component/footer.jsp"%>
	</div>
</body>
</html>