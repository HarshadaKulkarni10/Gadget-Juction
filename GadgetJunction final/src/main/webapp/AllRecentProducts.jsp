<%@page import="com.entity.User"%>
<%@page import="com.entity.Product"%>
<%@page import="java.util.List"%>
<%@page import="com.DB.DBConnection"%>
<%@page import="com.DAO.ProductDAOimpl"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>All Recent Products</title>
<%@ include file="all_components/css.jsp"%>
</head>
<body style="background-color: #f5f7f6">
	<%
	User u = (User) session.getAttribute("userobj");
	%>
	<%@include file="all_components\navbar.jsp"%>
	<div class="container-fluid">
		<div class="row">
			<%
			ProductDAOimpl dao2 = new ProductDAOimpl(DBConnection.getConn());
			List<Product> list2 = dao2.getAllRecentProduct();
			for (Product p : list2) {
			%>

			<div class="col-md-4 mt-4">
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
							<a href="cart?p_id=<%=p.getP_id()%> &&u_id=<%=u.getId()%>"
								class="btn btn-danger btn-sm ml-5"> <strong><i
									class="fa-solid fa-cart-shopping"></i> Add to Cart </strong></a> <a
								href="ViewProducts.jsp?p_id=<%=p.getP_id()%>"
								class="btn btn-success btn-sm ml-1"><strong>View
									Details</strong></a> <a href="" class="btn btn-danger btn-sm ml-2"><strong><%=p.getP_price()%></strong></a>

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

</body>
</html>