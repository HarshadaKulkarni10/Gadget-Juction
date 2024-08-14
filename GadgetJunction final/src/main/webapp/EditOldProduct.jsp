<%@page import="java.util.List"%>
<%@page import="com.entity.User"%>
<%@page import="com.DB.DBConnection"%>
<%@page import="com.DAO.ProductDAOimpl"%>
<%@page import="com.entity.Product"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page isELIgnored="false"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>GadgetJuction - Edit Old Product</title>
<%@ include file="all_components/css.jsp"%>
</head>
<body style="background-color: #f5f7f6">
	<%@include file="all_components\navbar.jsp"%>

	<c:if test="${not empty SuccMsg}">
		<div class="alert alert-success" role="alert">${SuccMsg}</div>
		<c:remove var="SuccMsg" scope="session" />
	</c:if>


	<c:if test="${not empty FailMsg}">
		<div class="alert alert-danger" role="alert">${FailMsg}</div>
		<c:remove var="FailMsg" scope="session" />
	</c:if>

	<div class="container p-5">
		<table class="table table-striped">
			<thead class="bg-custom text-white">
				<tr>
					<th scope="col">Product Name</th>
					<th scope="col">Configuration</th>
					<th scope="col">Price</th>
					<th scope="col">Category</th>
					<th scope="col">Action</th>
				</tr>
			</thead>
			<tbody>
				<%
				User u = (User) session.getAttribute("userobj");
				String u_email = u.getEmail();

				ProductDAOimpl dao = new ProductDAOimpl(DBConnection.getConn());
				List<Product> list = dao.getOldProduct(u_email, "Old Product");

				for (Product p : list)

				{
				%>
				<tr>
					<td><%=p.getP_name()%></td>
					<td><%=p.getP_details()%></td>
					<td><%=p.getP_price()%></td>
					<td><%=p.getP_category()%></td>
					<td><a href="DeleteOldProduct?u_email=<%=p.getU_email()%>&&p_id=<%=p.getP_id() %>"
					
						class="btn btn-sm btn-danger">Delete</a></td>
				</tr>


				<%
				}
				%>


			</tbody>
		</table>
	</div>

</body>
</html>