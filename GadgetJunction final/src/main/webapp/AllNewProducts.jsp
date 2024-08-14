<%@page import="com.entity.User"%>
<%@page import="com.entity.Product"%>
<%@page import="java.util.List"%>
<%@page import="com.DB.DBConnection"%>
<%@page import="com.DAO.ProductDAOimpl"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page isELIgnored="false"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<%@include file="all_components/css.jsp"%>
<style type="text/css">
.crd-ho:hover {
	background-color: #fcf7f7;
}

#toast {
	min-width: 300px;
	position: fixed;
	bottom: 30px;
	left: 50%;
	margin-left: -125px;
	background: #333;
	padding: 10px;
	color: white;
	text-align: center;
	z-index: 1;
	font-size: 18px;
	visibility: hidden;
	box-shadow: 0px 0px 100px #000;
}

#toast.display {
	visibility: visible;
	animation: fadeIn 0.5, fadeOut 0.5s 2.5s;
}

@
keyframes fadeIn {from { bottom:0;
	opacity: 0;
}

to {
	bottom: 30px;
	opacity: 1;
}

}
@
keyframes fadeOut {form { bottom:30px;
	opacity: 1;
}

to {
	bottom: 0;
	opacity: 0;
}
}
</style>
</head>
<body style="background-color: #f5f7f6">

	<%
	User u = (User) session.getAttribute("userobj");
	%>

	<c:if test="${not empty addCart}">

		<div id="toast">Product Added To Cart !</div>

		<script type="text/javascript">
		showToast();
		function showToast(content)
		{
		    $('#toast').addClass("display");
		    $('#toast').html(content);
		    setTimeout(()=>{
		        $("#toast").removeClass("display");
		    },2000)
		}	
</script>

		<c:remove var="addCart" scope="session" />


	</c:if>


	<%@include file="all_components\navbar.jsp"%>
	<div class="container-fluid">
		<div class="row">
			<%
			ProductDAOimpl dao2 = new ProductDAOimpl(DBConnection.getConn());
			List<Product> list2 = dao2.getAllNewProduct();
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
							<a href="cart?p_id=<%=p.getP_id()%> &&u_id=<%=u.getId()%>" class="btn btn-danger btn-sm ml-5"> <strong><i
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