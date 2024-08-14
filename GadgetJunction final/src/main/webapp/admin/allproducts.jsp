<%@page import="com.entity.Product"%>
<%@page import="java.util.List"%>
<%@page import="com.DB.DBConnection"%>
<%@page import="com.DAO.ProductDAOimpl"%>
<%@page import="com.DAO.ProductDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page isELIgnored="false"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Gadget Junction : All Products</title>
<%@include file="css.jsp"%>
</head>
<body style="background: #f0f1f2">
	<%@include file="navbar.jsp"%>

	<c:if test="${empty userobj }">
		<c:redirect url="../login.jsp" />
	</c:if>
	<h1 class="text-center p-3">
		<strong>All Products</strong>
	</h1>

	<c:if test="${not empty SuccMsg}">
		<p class="text-center text-success">
			<strong>${SuccMsg }</strong>
		</p>
		<c:remove var="SuccMsg" scope="session" />
	</c:if>

	<c:if test="${not empty FailMsg}">
		<h4 class="text-center text-danger">${FailMsg }</h4>>
		<c:remove var="FailMsg" scope="session" />
	</c:if>

	<table class="table">
		<thead class="thead-dark">
			<tr>
				<th scope="col"><strong>ID :</strong></th>
				<th scope="col"><strong>Image :</strong></th>
				<th scope="col"><strong>Product Name :</strong></th>
				<th scope="col"><strong>Product Configuration :</strong></th>
				<th scope="col"><strong>Product Price :</strong></th>
				<th scope="col"><strong>Category :</strong></th>
				<th scope="col"><strong>Product Status :</strong></th>
				<th scope="col"><strong>Action :</strong></th>
			</tr>
		</thead>
		<tbody>
			<%
			ProductDAOimpl dao = new ProductDAOimpl(DBConnection.getConn());
			List<Product> list = dao.getAllProducts();
			for (Product prod : list) {
			%>

			<tr>
				<td><strong><%=prod.getP_id()%></strong></td>
				<td><strong><img
						src="../gadgets/<%=prod.getP_image()%>"
						style="width: 50px; height: 50px;"></strong></td>
				<td><strong><%=prod.getP_name()%></strong></td>
				<td><strong><%=prod.getP_details()%></strong></td>
				<td><strong><%=prod.getP_price()%></strong></td>
				<td><strong><%=prod.getP_category()%></strong></td>
				<td><strong><%=prod.getP_status()%></strong></td>
				<td><a href="editproducts.jsp?id=<%=prod.getP_id()%>"
					class="btn btn-md btn-primary"><i
						class="fa-solid fa-pen-to-square"></i><strong>Edit</strong></a> <a
					href="../deleteproducts?id=<%=prod.getP_id()%>"
					class="btn btn-md btn-danger"><i class="fa-solid fa-trash"></i><strong>Delete</strong></a></td>


			</tr>

			<%
			

			}
			%>


		</tbody>
	</table>
</body>
</html>