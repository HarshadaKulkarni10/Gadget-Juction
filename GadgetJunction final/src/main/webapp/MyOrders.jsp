<%@page import="com.entity.Order"%>
<%@page import="java.util.List"%>
<%@page import="com.DB.DBConnection"%>
<%@page import="com.DAO.OrderDAOimpl"%>
<%@page import="com.entity.User"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>GadgetJunction - MyOrders</title>
<%@ include file="all_components/css.jsp"%>
</head>
<body style="background-color: #f5f7f6">
	<%@include file="all_components\navbar.jsp"%>
	
	<c:if test="${empty  userobj}">
		<c:redirect url="login.jsp"></c:redirect>
	</c:if>

	
	<div class="container mt-4">

		<h4 class="text-center">
			<strong>Your Orders</strong>
		</h4>
		<table class="table table-striped">
			<thead class="bg-custom text-white">
				<tr>
					<th scope="col">Order ID</th>
					<th scope="col">Name</th>
					<th scope="col">Product Name</th>
					<th scope="col">Product Configuration</th>
					<th scope="col">Price</th>
					<th scope="col">Payment Mode</th>
				</tr>
			</thead>
			<tbody>
				<%
				User u = (User) session.getAttribute("userobj");
				OrderDAOimpl dao = new OrderDAOimpl(DBConnection.getConn());
				List<Order> olist = dao.getProduct(u.getEmail());
				for (Order o : olist) {
				%>

				<tr>
					<td><%=o.getOrderId() %></td>
					<td><%=o.getUsername() %></td>
					<td><%=o.getP_name() %></td>
					<td><%=o.getP_details() %></td>
					<td><%=o.getP_price() %></td>
					<td><%=o.getPaymenttype()%></tr>
				</tr>
				<%
				}
				
				%>

			</tbody>
		</table>
	</div>

</body>
</html>