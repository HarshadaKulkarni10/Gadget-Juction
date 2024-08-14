
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page isELIgnored="false"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>GadgetJunction - Setting</title>
<%@ include file="all_components/css.jsp"%>
</head>
<body style="background-color: #f5f7f6">
	<c:if test="${empty userobj }">
		<c:redirect url="login.jsp"></c:redirect>
	</c:if>

	<%@include file="all_components\navbar.jsp"%>

	<div class="container mt-4">

		<h3 class="text-center">Hello, ${userobj.name}</h3>
		<div class="row p-5">
			<div class="col-md-4">
				<a href="SellOldProducts.jsp">
					<div class="card">
						<div class="card-body text-center ">
							<div class="text-Primary">
								<i class="fa-solid fa-mobile-screen-button fa-3x"></i> <i
									class="fa-solid fa-laptop fa-3x"></i>
							</div>
							<h4>Sell Old Products</h4>
						</div>
					</div>
				</a>
			</div>

			<div class="col-md-4">
				<a href="EditOldProduct.jsp">
					<div class="card">
						<div class="card-body text-center ">
							<div class="text-Primary">
								<i class="fa-solid fa-mobile-button fa-3x"></i>
							</div>
							<h4>Edit Old Products</h4>
						</div>
					</div>
				</a>
			</div>

			<div class="col-md-4">
				<a href="EditProfile.jsp">
					<div class="card">
						<div class="card-body text-center ">
							<div class="text-Primary">
								<i class="fa-solid fa-user-pen fa-3x"></i>
							</div>
							<h4>Edit Profile</h4>
						</div>
					</div>
				</a>
			</div>


			<div class="col-md-6 mt-4">
				<a href="MyOrders.jsp">
					<div class="card">
						<div class="card-body text-center text-danger">
							<div class="text-danger">
								<i class="fa-solid fa-box-open fa-3x"></i>
							</div>
							<h4>My Orders</h4>
							<p>
								<strong>Track Your Order</strong>
							</p>
						</div>
					</div>
				</a>
			</div>

			<div class="col-md-6 mt-4">
				<a href="Helpline.jsp">
					<div class="card">
						<div class="card-body text-center text-warning">
							<div class="text-warning">
								<i class="fa-solid fa-user-circle fa-3x"></i>
							</div>
							<h4>Help Center</h4>
							<p>
								<strong>24*7 Service</strong>
							</p>
						</div>
					</div>
				</a>
			</div>


		</div>
	</div>



</body>
</html>