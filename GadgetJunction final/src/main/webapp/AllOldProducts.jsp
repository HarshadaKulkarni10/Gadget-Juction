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
<title>All Resale Products</title>
<%@ include file="all_components/css.jsp"%>
</head>
<body style="background-color: #f5f7f6">
	<%@include file="all_components\navbar.jsp"%>
	<div class="container-fluid">
		<div class="row">
			<div class="col-md-3 mt-5">
				<%
				ProductDAOimpl dao3 = new ProductDAOimpl(DBConnection.getConn());
				List<Product> list3 = dao3.getAllOldProduct();
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
									"" class="btn btn-success btn-sm ml-5"><strong>View
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
		</div>
	</div>

</body>
</html>