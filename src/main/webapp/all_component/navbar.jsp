<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page isELIgnored="false"%>
<div class="container-fluid"
	style="height: 10px; background-color: #303f9f"></div>
<div class="container-fluid p-3 bg-light">
	<div class="row">
		<div class="col-md-3 text-success">
			<h3>
				<i class="fa-solid fa-book"></i> Books
			</h3>
		</div>
		<div class="col-md-6">
			<form class="form-inline my-2 my-lg-0" method="post"
				action="search.jsp">
				<input class="form-control mr-sm-2" type="search" name="ch"
					placeholder="Search" aria-label="Search">
				<button class="btn btn-success my-2 my-sm-0" type="submit">Search</button>
			</form>
		</div>
		<c:if test="${not empty userobj}">
			<div class="col-md-3">
				<a href="checkout.jsp" class="btn btn-primary"><i
					class="fa-solid fa-cart-plus"></i> cart</a> <a
					class="btn btn-success text-white ml-1"><i
					class="fa-solid fa-user"></i> ${userobj.name}</a> <a
					data-toggle="modal" data-target="#exampleModalCenter"
					class="btn btn-primary ml-1 text-white"><i
					class="fa-solid fa-right-from-bracket"></i> Logout</a>
			</div>
		</c:if>
		<c:if test="${empty userobj }">
			<div class="col-md-3">
				<a href="login.jsp" class="btn btn-success"><i
					class="fa-solid fa-right-to-bracket"></i> Login</a> <a
					href="register.jsp" class="btn btn-primary"><i
					class="fa-solid fa-user-plus"></i> Register</a>
			</div>
		</c:if>
	</div>
</div>
<!-- Start Logout Modal -->
<div class="modal fade" id="exampleModalCenter" tabindex="-1"
	role="dialog" aria-labelledby="exampleModalCenterTitle"
	aria-hidden="true">
	<div class="modal-dialog modal-dialog-centered" role="document">
		<div class="modal-content">
			<div class="modal-header">
				<h5 class="modal-title" id="exampleModalLongTitle"></h5>
				<button type="button" class="close" data-dismiss="modal"
					aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
			</div>
			<div class="modal-body ">
				<h4 class="text-center">Do you want Logout</h4>
				<div class="text-center">
					<button type="button" class="btn btn-secondary"
						data-dismiss="modal">Close</button>
					<a href="logout" type="button"
						class="btn btn-primary ml-1 text-white">Logout</a>
				</div>
			</div>
		</div>
	</div>
</div>
<!-- End Logout Modal -->
<nav class="navbar navbar-expand-lg navbar-dark bg-custom">
	<a class="navbar-brand text-white"><i class="fa-solid fa-house"></i></a>
	<button class="navbar-toggler" type="button" data-toggle="collapse"
		data-target="#navbarSupportedContent"
		aria-controls="navbarSupportedContent" aria-expanded="false"
		aria-label="Toggle navigation">
		<span class="navbar-toggler-icon"></span>
	</button>
	<div class="collapse navbar-collapse" id="navbarSupportedContent">
		<ul class="navbar-nav mr-auto">
			<li class="nav-item active"><a class="nav-link" href="index.jsp">Home
					<span class="sr-only">(current)</span>
			</a></li>
			<li class="nav-item active"><a class="nav-link"
				href="RecentBooks.jsp"><i class="fa-solid fa-book"></i> Recent
					Book</a></li>&nbsp;
			<li class="nav-item active"><a class="nav-link"
				href="TextBooks.jsp"><i class="fa-solid fa-book"></i> Text Book</a></li>&nbsp;
			<li class="nav-item active"><a class="nav-link"
				href="StoryBooks.jsp"><i class="fa-solid fa-book"></i> Story
					Book</a></li>&nbsp;
			<li class="nav-item active"><a class="nav-link"
				href="NovelBooks.jsp"><i class="fa-solid fa-book"></i> Novel
					Book</a></li>&nbsp;
			<li class="nav-item active"><a class="nav-link"
				href="PracticalManual.jsp"><i class="fa-solid fa-book"></i>
					Practical Manual</a></li>&nbsp;
			<li class="nav-item active"><a class="nav-link"
				href="Anime.jsp"><i class="fa-solid fa-book"></i>
					Anime</a></li>
		</ul>
		<form class="form-inline my-2 my-lg-0">
			<a href="setting.jsp" class="btn btn-light my-2 my-sm-0"
				type="submit"> <i class="fa-solid fa-gear"></i> Setting
			</a> <a href="ContactUs.jsp" class="btn btn-light my-2 my-sm-0 ml-2"
				type="submit"> <i class="fa-solid fa-phone"></i> Contact Us
			</a>
		</form>
	</div>
</nav>