<%@page import="java.util.List"%>
<%@page import="com.DB.DBConnection"%>
<%@page import="com.DAO.OrderDAOimpl"%>
<%@page import="com.entity.Order"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Gadget Junction : Orders</title>
<%@include file="css.jsp"%>
</head>
<body style="background: #f0f1f2">
	<%@include file="navbar.jsp"%>
	<c:if test="${empty userobj }">
		<c:redirect url="../login.jsp" />
	</c:if>
	<h3 class="text-center p-3">Hello Admin</h3>

	<table class="table">
		<thead class="thead-dark">
			<tr>
				<th scope="col">Order ID :</th>
				<th scope="col">Customer Name :</th>
				<th scope="col">Email :</th>
				<th scope="col">Address :</th>
				<th scope="col">Phone No :</th>
				<th scope="col">Product Name :</th>
				<th scope="col">Product Details :</th>
				<th scope="col">Product Price :</th>
				<th scope="col">Payment Type :</th>
			</tr>
		</thead>
		<tbody>

			<%
			OrderDAOimpl dao = new OrderDAOimpl(DBConnection.getConn());
			List<Order> olist = dao.getAllOrders();
			for (Order o : olist) {
			%>
			<tr>
				<td><%=o.getOrderId()%></td>
				<td><%=o.getUsername()%></td>
				<td><%=o.getEmail()%></td>
				<td><%=o.getFulladd()%></td>
				<td><%=o.getPhoneno()%></td>
				<td><%=o.getP_name()%></td>
				<td><%=o.getP_details()%></td>
				<td><%=o.getP_price()%></td>
				<td><%=o.getPaymenttype()%></td>



			</tr>
			<%
			}
			%>



		</tbody>
	</table>

	<div style="margin-top: 340px;">
		<%@include file="footer.jsp"%>
	</div>

</body>
</html>