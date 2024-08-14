<%@page import="com.entity.Product"%>
<%@page import="com.DB.DBConnection"%>
<%@page import="com.DAO.ProductDAOimpl"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>View Product Details</title>
<%@ include file="all_components/css.jsp"%>
</head>
<body style="background-color: #f0f1f2;">
	<%@include file="all_components\navbar.jsp"%>

	<%
	int p_id = Integer.parseInt(request.getParameter("p_id"));
	ProductDAOimpl dao = new ProductDAOimpl(DBConnection.getConn());
	Product prod = dao.getProductById(p_id);
	%>

	<div class="container p-5">
		<div class="row p-5">
			<div class="col-md-6 text-center p-5 border bg-white">
				<img alt="" src="gadgets/<%=prod.getP_image()%>"
					style="height: 150px; width: 150px;">
				<h4>
					Product Name:
					<%=prod.getP_name()%></h4>
				<h4>
					Details:
					<%=prod.getP_details()%></h4>
				<h4>
					Category:
					<%=prod.getP_category()%></h4>
			</div>
			<div class="col-md-6 text-center p-5 border bg-white">
				<h3>
					Product Name:
					<%=prod.getP_name()%></h3>

				<%
				if ("Old Product".equals(prod.getP_category())) {
				%>
				<h5 class="text-primary">
					<strong>Contact to Seller</strong>
				</h5>
				<h5 class="text-primary">
					<i class="fa-solid fa-envelope"></i>Email:
					<%=prod.getU_email()%></h5>

				<%
				}
				%>

				<div class="row">
					<div class="col-md-4 text-center p-2">
						<i class="fa-regular fa-money-bill-1 fa-3x"></i>
						<p>Cash on Delivery</p>
					</div>
					<div class="col-md-4 text-center p-2">
						<i class="fa-solid fa-rotate-left fa-3x"></i>
						<p>Return Available</p>

					</div>
					<div class="col-md-4 text-center p-2">
						<i class="fa-solid fa-truck fa-3x"></i>
						<p>Free Shipping</p>
					</div>
				</div>
				<%
				if ("Old Product".equals(prod.getP_category())) {
				%>
				<div class=" text-center p-3">
					<a href="index.jsp" class="btn btn-primary"><i
						class="fa-solid fa-cart-shopping"></i>Continue Shopping</a> <a href=""
						class="btn btn-primary"><i
						class="fa-solid fa-indian-rupee-sign"></i><%=prod.getP_price() %></a>

				</div>
				<%
				} else {
				%>
				<div class=" text-center p-3">
					<a href="" class="btn btn-primary"><i
						class="fa-solid fa-cart-shopping"></i>Add To Cart</a> <a href=""
						class="btn btn-primary"><i
						class="fa-solid fa-indian-rupee-sign"></i><%=prod.getP_price() %></a>

				</div>

				<%
				}
				%>



			</div>
		</div>
	</div>

</body>
</html>