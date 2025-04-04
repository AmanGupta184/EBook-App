<%@page import="com.entity.User"%>
<%@page import="com.entity.BookDetail"%>
<%@page import="java.util.List"%>
<%@page import="com.DAO.BookDAOImpl"%>
<%@page import="com.DB.DBConnect"%>
<%@page import="java.sql.*"%>
<%@page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<link rel="icon" href="image/icon.png" type="image/x-icon">
<title>EBook:Index</title>
<%@include file="all_component/allcss.jsp"%>
<style type="text/css">
.back-img {
	background: url("image/BookImage.png");
	height: 50vh;
	width: 100%;
	background-repeat: no-repeat;
	background-size: cover;
}

.crd-ho:hover {
	background: #D8C1C1;
}

.glow {
	font-family: 'Montserrat', sans-serif;
	color: #ffff66;
	font-size: 70px;
	margin: 0;
	-webkit-text-stroke: 3px #000000;
}

#toast {
	min-width: 300px;
	position: fixed;
	bottom: 30px;
	left: 50%;
	margin-left: -125px;
	background: #333;
	padding: 10px;
	color: white;
	text-align: center;
	z-index: 1;
	font-size: 18px;
	visibility: hidden;
	box-shadow: 0px 0px 100px #000;
}

#toast.display {
	visibility: visible;
	animation: fadeIn 0.5, fadeOut 0.5s 2.5s;
}

@
keyframes fadeIn {from { bottom:0;
	opacity: 0;
}

to {
	bottom: 30px;
	opacity: 1;
}

}
@
keyframes fadeOut {form { bottom:30px;
	opacity: 1;
}

to {
	bottom: 0;
	opacity: 0;
}
}
</style>
</head>
<body style="background-color: #f0f2f2">
	<%
	User us = (User) session.getAttribute("userobj");
	%>
	<%@include file="all_component/navbar.jsp"%>
	<c:if test="${not empty addCart }">
		<div id="toast">${addCart}</div>
		<script type="text/javascript">
		showToast();
		function showToast(content)
		{
		    $('#toast').addClass("display");
		    $('#toast').html(content);
		    setTimeout(()=>{
		        $("#toast").removeClass("display");
		    },2000)
		}	
		</script>
		<c:remove var="addCart" scope="session" />
	</c:if>
	<c:if test="${not empty failMsg }">
		<div id="toast">${failMsg}</div>
		<script type="text/javascript">
		showToast();
		function showToast(content)
		{
		    $('#toast').addClass("display");
		    $('#toast').html(content);
		    setTimeout(()=>{
		        $("#toast").removeClass("display");
		    },2000)
		}	
		</script>
		<c:remove var="failMsg" scope="session" />
	</c:if>
	<div class="container-fluid back-img">
		<div class="container-fluid logo-area text-center">
			<a><img src="image/Logo.png" height="230px" width="230px"
				class="mt-2 mb-1"></img></a>
		</div>
		<div>
			<h1 class="glow text-center"
				style="font-family: 'Protest Riot', sans-serif;">NALANDA BOOK
				CENTER</h1>
		</div>
	</div>
	<br>

	<!-- Start Recent Books -->
	<div class="container">
		<h3 class="text-center">Recent Books</h3>
		<br>
		<div class="row">
			<%
			BookDAOImpl dao = new BookDAOImpl(DBConnect.getCon());
			List<BookDetail> list = dao.getRecentBooks();
			for (BookDetail b : list) {
			%>
			<div class="col-md-3">
				<div class="card crd-ho">
					<div class="card-body text-center">
						<img alt="" src="bookImages/<%=b.getPhoto() %>"
							style="height: 200px; width: 150px;" class="img-thumblin">
						<p><%=b.getBookName()%></p>
						<p><%=b.getAuthor()%></p>
						<p><%=b.getBookCategory()%></p>
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
		<br>
		<div class="container text-center">
			<a href="TextBooks.jsp" class="btn btn-danger">View All</a>
		</div>
	</div>
	<br>
	<!-- End Text Books -->

	<!-- Start Text Books -->
	<div class="container">
		<h3 class="text-center">Text Books</h3>
		<br>
		<div class="row">
			<%
			BookDAOImpl dao2 = new BookDAOImpl(DBConnect.getCon());
			List<BookDetail> list2 = dao2.getTextBooks();
			for (BookDetail b : list2) {
			%>
			<div class="col-md-3">
				<div class="card crd-ho">
					<div class="card-body text-center">
						<img alt="" src="bookImages/<%=b.getPhoto()%>"
							style="height: 200px; width: 150px;" class="img-thumblin">
						<p><%=b.getBookName()%></p>
						<p><%=b.getAuthor()%></p>
						<p><%=b.getBookCategory()%></p>
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
		<br>
		<div class="container text-center">
			<a href="TextBooks.jsp" class="btn btn-danger">View All</a>
		</div>
	</div>
	<br>
	<!-- End Text Books -->

	<!-- Start Story Books -->

	<div class="container">
		<h3 class="text-center">Story Book</h3>
		<br>
		<div class="row">
			<%
			BookDAOImpl dao3 = new BookDAOImpl(DBConnect.getCon());
			List<BookDetail> list3 = dao3.getStoryBooks();
			for (BookDetail b : list3) {
			%>
			<div class="col-md-3">
				<div class="card crd-ho">
					<div class="card-body text-center">
						<img alt="" src="bookImages/<%=b.getPhoto()%>"
							style="height: 200px; width: 150px;" class="img-thumblin">
						<p><%=b.getBookName()%></p>
						<p><%=b.getAuthor()%></p>
						<p><%=b.getBookCategory()%></p>
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
		<br>
		<div class="container text-center">
			<a href="StoryBooks.jsp" class="btn btn-danger">View All</a>
		</div>
	</div>
	<br>

	<!-- End Story Books -->

	<!-- Start Novel Books -->
	<div class="container">
		<h3 class="text-center">Novel Book</h3>
		<br>
		<div class="row">
			<%
			BookDAOImpl dao4 = new BookDAOImpl(DBConnect.getCon());
			List<BookDetail> list4 = dao4.getNovelBooks();
			for (BookDetail b : list4) {
			%>
			<div class="col-md-3">
				<div class="card crd-ho">
					<div class="card-body text-center">
						<img alt="" src="bookImages/<%=b.getPhoto()%>"
							style="height: 200px; width: 150px;" class="img-thumblin">
						<p><%=b.getBookName()%></p>
						<p><%=b.getAuthor()%></p>
						<p><%=b.getBookCategory()%></p>
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
		<br>
		<div class="container text-center">
			<a href="NovelBooks.jsp" class="btn btn-danger">View All</a>
		</div>
	</div>
	<br>
	<!-- End Novel Books -->

	<!-- Start Practical Manual  -->
	<div class="container">
		<h3 class="text-center">Practical Manual</h3>
		<br>
		<div class="row">
			<%
			BookDAOImpl dao5 = new BookDAOImpl(DBConnect.getCon());
			List<BookDetail> list5 = dao5.getPracticalManual();
			for (BookDetail b : list5) {
			%>
			<div class="col-md-3">
				<div class="card crd-ho">
					<div class="card-body text-center">
						<img alt="" src="bookImages/<%=b.getPhoto()%>"
							style="height: 200px; width: 150px;" class="img-thumblin">
						<p><%=b.getBookName()%></p>
						<p><%=b.getAuthor()%></p>
						<p><%=b.getBookCategory()%></p>
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
		<br>
		<div class="container text-center">
			<a href="PracticalManual.jsp" class="btn btn-danger">View All</a>
		</div>
	</div>
	<br>
	<!-- End Practical Manual -->

	<!-- Start Anime Manga -->
	<div class="container">
		<h3 class="text-center">Anime</h3>
		<br>
		<div class="row">
			<%
			BookDAOImpl dao6 = new BookDAOImpl(DBConnect.getCon());
			List<BookDetail> list6 = dao6.getAnimeManga();
			for (BookDetail b : list6) {
			%>
			<div class="col-md-3">
				<div class="card crd-ho">
					<div class="card-body text-center">
						<img alt="" src="bookImages/<%=b.getPhoto()%>"
							style="height: 200px; width: 150px;" class="img-thumblin">
						<p><%=b.getBookName()%></p>
						<p><%=b.getAuthor()%></p>
						<p><%=b.getBookCategory()%></p>
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
		<br>
		<div class="container text-center">
			<a href="Anime.jsp" class="btn btn-danger">View All</a>
		</div>
	</div>
	<br>
	<!-- End Anime Manga -->
	<div style="margin-top: 130px">
		<%@include file="all_component/footer.jsp"%>
	</div>
</body>
</html>