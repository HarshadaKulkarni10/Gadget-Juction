<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page isELIgnored="false"%>
<div class="container-fluid"
	style="height: 10px; background-color: #9c27b0"></div>

<div class="container-fluid p-4 bg-header">
	<div class="row">
		<div class="col-md-3">
			<h3>
				<i class="fa-solid fa-laptop"></i> <strong>GadgetJunction</strong>
			</h3>
		</div>
		<div class="col-md-6"></div>

		<c:if test="${not empty userobj }">
			<div class="col-md-3">
				<a href="Checkout.jsp" class=" btn btn-success mr-3"><i
					class="fa-solid fa-cart-shopping fa-1x"></i></a> <a href="login.jsp" class="btn btn-success "><strong><i
						class="fa-regular fa-user"></i> ${userobj.name }</strong></a> <a href="Logout"
					class="btn btn-primary"><strong><i
						class="fa-solid fa-right-to-bracket"></i> LOGOUT</strong></a>
			</div>


		</c:if>
		<c:if test="${empty userobj }">
			<div class="col-md-3">
				<a href="login.jsp" class="btn btn-success "><strong><i
						class="fa-solid fa-right-to-bracket"></i> LOGIN</strong></a> <a
					href="register.jsp" class="btn btn-primary "><strong><i
						class="fa-solid fa-user-plus"></i> REGISTER</strong></a>
			</div>
		</c:if>

	</div>
</div>


<nav
	class="navbar navbar-expand-lg navbar-dark bg-custom justify-content-between">
	<a class="navbar-brand" href="#"><i class="fa fa-house"></i></a>
	<button class="navbar-toggler" type="button" data-toggle="collapse"
		data-target="#navbarSupportedContent"
		aria-controls="navbarSupportedContent" aria-expanded="false"
		aria-label="Toggle navigation">
		<span class="navbar-toggler-icon"></span>
	</button>

	<div class="collapse navbar-collapse" id="navbarSupportedContent">
		<ul class="navbar-nav mr-auto">
			<li class="nav-item active"><a class="nav-link" href="index.jsp"></i><strong>Home</strong>
					<span class="sr-only">(current)</span> </a></li>
			<li class="nav-item active"><a class="nav-link"
				href="AllRecentProducts.jsp"><i class="fa-solid fa-laptop"></i><strong>Recent
						Products</strong></a></li>

			<li class="nav-item active"><a class="nav-link"
				href="AllNewProducts.jsp"><i class="fa-solid fa-laptop"></i><strong>New
						Products</strong></a></li>

			<li class="nav-item active"><a class="nav-link disabled"
				href="AllOldProducts.jsp"><i class="fa-solid fa-laptop"></i><strong>
						Resale Products</strong></a></li>
		</ul>
		<form class="form-inline my-2 my-lg-0" action="SearchProduct.jsp" method="post">
			<form class="form-inline my-2 ml-3" >
				<input class="form-control mr-lg-2 " name="ch"  type="search"
					placeholder="Search" aria-label="Search">
				<button class="btn btn-primary my-2 my-sm-0 " type="submit">
					<strong>Search</strong>
				</button>
			</form>
			<a href="Setting.jsp" class="btn btn-light my-2 my-sm-0 ml-5" type="submit">
				<i class="fa-solid fa-gear"></i><strong> Setting</strong>
			</a>
			<button class="btn btn-light my-2 my-sm-0  ml-2" type="submit">
				<i class="fa-solid fa-phone"></i><strong>Contact Us</strong>
			</button>
		</form>
	</div>
</nav>