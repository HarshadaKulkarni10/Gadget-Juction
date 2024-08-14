<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>GadgetJunction - Order Success</title>
<%@ include file="all_components/css.jsp"%>
</head>
<body style="background-color: #f0f1f2;">
	<%@include file="all_components\navbar.jsp"%>
	<div class="container text-center mt-3">
	<i class="fas fa-check-circle fa-5x text-success"></i>
	<h3><strong>Order Placed Successfully</strong></h3>
	<h1><strong>Thank You for Ordering!!</strong></h1>
	<h4><strong>Your Order Will Be Delivered With 7 Working Days.</strong></h4>
	<a href="index.jsp" class="btn btn-primary mt-4"><strong>Home</strong></a>
	<a href="MyOrders.jsp" class="btn btn-danger mt-4"><strong>View Order</strong></a>
	</div>
	
</body>
</html>