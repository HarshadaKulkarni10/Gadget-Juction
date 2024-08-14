<%@page import="com.entity.User"%>
<%@page import="com.entity.Product"%>
<%@page import="java.util.List"%>
<%@page import="com.DAO.ProductDAOimpl"%>
<%@page import="java.sql.Connection"%>
<%@page import="com.DB.DBConnection"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>GadgetJunction - Index</title>
<%@ include file="all_components/css.jsp"%>
<style type="text/css">
.back-img {
	background: url("img/smartphone.jpg");
	height: 50vh;
	width: 100%;
	background-repeat: no-repeat;
	background-size: cover;
}

.crd-ho:hover {
	background-color: #e1e3e2;
}
</style>
</head>
<body style="background-color: #f5f7f6">
	<%
	User u = (User) session.getAttribute("userobj");
	%>


	<%@include file="all_components\navbar.jsp"%>
	<div class="container-fluid back-img">
		<h2 class="text-white">
			<i class="fa-solid fa-laptop"></i><strong>Gadget Junction
				Sale Resale</strong>
		</h2>
	</div>


	<!-- Recent Products -->
	<div class="container">
		<h3 class="text-center">
			<strong>Recent Products</strong>

		</h3>
		<div class="row">
			<%
			ProductDAOimpl dao2 = new ProductDAOimpl(DBConnection.getConn());
			List<Product> list2 = dao2.getRecentProducts();
			for (Product p : list2) {
			%>

			<div class="col-md-4">
				<div class="card crd-ho" style="width: 20rem;">
					<div class="card-body text-center">
						<img alt="" src="gadgets/<%=p.getP_image()%>"
							style="width: 200px; height: 200px;" class="img-thmblin">
						<p>
							<strong><%=p.getP_name()%></strong>
						</p>
						<p>
							<strong><%=p.getP_details()%></strong>
						</p>
						<p>

							<%
							if (p.getP_category().equals("Old Product")) {
							%>
						
						<p>
							<strong><%=p.getP_category()%></strong>
						</p>
						<br>
						<div class="row-md-3">

							<a href="ViewProducts.jsp?p_id=<%=p.getP_id()%>"
								class="btn btn-success btn-sm ml-4"><strong>View
									Details</strong></a> <a href="" class="btn btn-danger btn-sm ml-1"><strong><%=p.getP_price()%></strong></a>

						</div>
						<%
						} else {
						%>
						<p>
							<strong><%=p.getP_category()%></strong>
						</p>
						<div class="row">


							<%
							if (u == null) {
							%>

							<a href="login.jsp" class="btn btn-danger btn-sm ml-4"> <strong><i
									class="fa-solid fa-cart-shopping"></i> Add to Cart </strong></a>

							<%
							} else {
							%>

							<a href="cart?p_id=<%=p.getP_id()%> &&u_id=<%=u.getId()%>"
								class="btn btn-danger btn-sm ml-4"> <strong><i
									class="fa-solid fa-cart-shopping"></i> Add to Cart </strong></a>
							<%
							}
							%>



							<a href="ViewProducts.jsp?p_id=<%=p.getP_id()%>"
								class="btn btn-success btn-sm ml-1"><strong>View
									Details</strong></a> <a href="" class="btn btn-danger btn-sm ml-1"><strong><%=p.getP_price()%></strong></a>

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
	<div class="text-center mt-2">
		<a href="AllRecentProducts.jsp" class="btn btn-danger btn-sm">View
			all</a>
	</div>
	</div>



	<!-- Recent Products end -->
	<hr>
	<!-- new Products -->
	<div class="container">
		<h3 class="text-center">New Launch</h3>
		<div class="row">
			<%
			ProductDAOimpl dao = new ProductDAOimpl(DBConnection.getConn());
			List<Product> list = dao.getNewProduct();
			for (Product p : list) {
			%>
			<div class="col-md-4">
				<div class="card crd-ho" style="width: 22rem;">
					<div class="card-body text-center">
						<img alt="" src="gadgets/<%=p.getP_image()%>"
							style="width: 200px; height: 200px;" class="img-thmblin">
						<p>
							<strong><%=p.getP_name()%></strong>
						</p>
						<p>
							<strong><%=p.getP_details()%></strong>
						</p>
						<p>
							<strong><%=p.getP_category()%></strong>
						</p>
						<div class="row ">
							<%
							if (u == null) {
							%>

							<a href="login.jsp" class="btn btn-danger btn-sm ml-4"> <strong><i
									class="fa-solid fa-cart-shopping"></i> Add to Cart </strong></a>

							<%
							} else {
							%>

							<a href="cart?p_id=<%=p.getP_id()%> &&u_id=<%=u.getId()%>"
								class="btn btn-danger btn-sm ml-4"> <strong><i
									class="fa-solid fa-cart-shopping"></i> Add to Cart </strong></a>
							<%
							}
							%>



							<a href="ViewProducts.jsp?p_id=<%=p.getP_id()%>"
								class="btn btn-success btn-sm ml-1"><strong>View
									Details</strong></a> <a href="" class="btn btn-danger btn-sm ml-1"><i
								class="fa-solid fa-indian-rupee-sign"></i><strong><%=p.getP_price()%></strong></a>

						</div>
					</div>
				</div>
			</div>

			<%
			}
			%>
		</div>





		<div class="text-center mt-2">
			<a href="AllNewProducts.jsp" class="btn btn-danger btn-sm">View
				all</a>
		</div>
	</div>
	<!-- new Products end -->
	<hr>
	<!-- old Products -->
	<div class="container">
		<h3 class="text-center">Resale Products</h3>
		<div class="row">
			<%
			ProductDAOimpl dao3 = new ProductDAOimpl(DBConnection.getConn());
			List<Product> list3 = dao3.getOldProducts();
			for (Product p : list3) {
			%>
			<div class="col-md-4">
				<div class="card crd-ho" style="width: 20rem;">
					<div class="card-body text-center">
						<img alt="" src="gadgets/<%=p.getP_image()%>"
							style="width: 200px; height: 200px;" class="img-thmblin">
						<p>
							<strong><%=p.getP_name()%></strong>
						</p>
						<p>
							<strong><%=p.getP_details()%></strong>
						</p>
						<p>
							<strong><%=p.getP_category()%></strong>
						</p>
						<div class="row ">
							<a href="ViewProducts.jsp?p_id=<%=p.getP_id()%>"
								class="btn btn-success btn-sm ml-5"><strong>View
									Details</strong></a> <a href="" class="btn btn-danger btn-sm ml-1"><strong>
									<%=p.getP_price()%></strong></a>

						</div>
					</div>
				</div>
			</div>

			<%
			}
			%>




		</div>
		<div class="text-center mt-2">
			<a href="AllOldProducts.jsp" class="btn btn-danger btn-sm">View
				all</a>
		</div>
	</div>

	<!-- old Products end -->

	<%@ include file="all_components\footer.jsp"%>
</body>
</html>
