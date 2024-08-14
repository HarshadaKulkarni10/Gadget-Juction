<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>GadgetJunction : Admin Home</title>
<%@include file="css.jsp"%>
<style type="text/css">
a {
	text-decoration: underline;
	color: black;
}

a:hover {
	text-decoration: underline;
	color: black;
}
</style>

</head>
<body>
	<%@include file="navbar.jsp"%>

	<c:if test="${empty userobj }">
		<c:redirect url="../login.jsp" />
	</c:if>


	<div class="container">
		<div class="row p-5">
			<div class="col-md-3">
				<div class="card">
					<a href="addproducts.jsp">
						<div class="card-body text-center">
							<i class="fa-solid fa-plus fa-3x text-primary"></i><br>
							<h4>
								<strong>ADD PRODUCTS</strong>
							</h4>
						</div>
					</a>
				</div>
			</div>

			<div class="col-md-3">
				<div class="card">
					<a href="allproducts.jsp">
						<div class="card-body text-center">
							<i class="fa-solid fa-laptop fa-3x text-danger"></i><i
								class="fa-solid fa-mobile-screen-button fa-3x text-danger"></i><br>
							<h4>
								<strong>ALL PRODUCTS</strong>
							</h4>
						</div>
					</a>
				</div>
			</div>

			<div class="col-md-3">
				<div class="card">
					<a href="orders.jsp">
						<div class="card-body text-center ">
							<i class="fa-solid fa-cart-shopping fa-3x text-warning"></i><br>
							<h4>
								<strong>ORDERS</strong>
							</h4>
						</div>
					</a>
				</div>
			</div>

			<div class="col-md-3">
				<a data-toggle="modal" data-target="#exampleModalCenter">
					<div class="card">

						<div class="card-body text-center">
							<i class="fa-solid fa-right-from-bracket fa-3x text-primary "></i><br>
							<h4>
								<strong>LOGOUT</strong>
							</h4>
						</div>

					</div>
				</a>
			</div>
		</div>
	</div>

	<!-- Modal -->
	<div class="modal fade" id="exampleModalCenter" tabindex="-1"
		role="dialog" aria-labelledby="exampleModalCenterTitle"
		aria-hidden="true">
		<div class="modal-dialog modal-dialog-centered" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="exampleModalLongTitle">Logout</h5>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="text-center">
					<div class="modal-body">
						<h4>Do You Want to Logout</h4>
						<button type="button" class="btn btn-secondary"
							data-dismiss="modal">Close</button>
						<a href="../Logout" type="button" class="btn btn-primary">Logout</a>

					</div>
				</div>
				<div class="modal-footer"></div>
			</div>
		</div>
	</div>

	<div style="margin-top: 340px;">
		<%@include file="footer.jsp"%>
	</div>
</body>
</html>