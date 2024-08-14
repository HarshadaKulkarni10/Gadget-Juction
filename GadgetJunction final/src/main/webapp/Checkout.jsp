-<%@page import="java.util.List"%>
<%@page import="com.entity.Cart"%>
<%@page import="com.entity.User"%>
<%@page import="com.DB.DBConnection"%>
<%@page import="com.DAO.CartDAOimpl"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Gadget Junction - Checkout Page</title>
<%@ include file="all_components/css.jsp"%>
</head>
<body style="background-color: #f0f1f2;">

	<%@include file="all_components\navbar.jsp"%>



	<c:if test="${not empty FailMsg}">
		<div class="alert alert-danger" role="alert">${FailMsg}</div>
		<c:remove var="FailMsg" scope="session" />
	</c:if>


	<c:if test="${empty  userobj}">
		<c:redirect url="login.jsp"></c:redirect>
	</c:if>


	<c:if test="${not empty SuccMsg}">
		<div class="alert alert-success" role="alert">${SuccMsg}</div>
		<c:remove var="SuccMsg" scope="session" />
	</c:if>


	<c:if test="${not empty FailMsg}">
		<div class="alert alert-danger" role="alert">${FailMsg}</div>
		<c:remove var="FailMsg" scope="session" />
	</c:if>


	<div class="container">
		<div class="row">
			<div class="col-md-6">


				<div class="card bg-white mt-3">
					<h3 class="text-center text-success mt-4">Selected Items</h3>

					<div class="card-body">
						<table class="table table-striped">
							<thead>
								<tr>
									<th scope="col">Product Name</th>
									<th scope="col">Product Configuration</th>
									<th scope="col">Price</th>
									<th scope="col">Action</th>
								</tr>
							</thead>
							<tbody>
								<%
								User u = (User) session.getAttribute("userobj");

								CartDAOimpl dao = new CartDAOimpl(DBConnection.getConn());
								List<Cart> cart = dao.getProductByUser(u.getId());
								double totalPrice = 0.00;

								for (Cart c : cart) {
									totalPrice = c.getTotal_price();
								%>
								<tr>
									<th scope="row"><%=c.getP_name()%></th>
									<td><%=c.getP_details()%></td>
									<td><%=c.getP_price()%></td>
									<td><a
										href="RemoveProduct?p_id=<%=c.getP_id()%>&&u_id=<%=c.getU_id()%>&&c_id=<%=c.getC_id()%>"
										class="btn btn-sm btn-danger"> Remove </a></td>
								</tr>
								<%
								}
								%>

								<tr>
									<td>Total Price :</td>
									<td></td>
									<td></td>
									<td><%=totalPrice%></td>
								</tr>

							</tbody>
						</table>
					</div>
				</div>
			</div>

			<div class="col-md-6">
				<div class="card mt-3">
					<div class="card-body">
						<h3 class="text-center text-success">Your Details for Order</h3>
						<form action="Order" method="post">
							<input type="hidden" value="${userobj.id }" name="id">

							<div class="form-row">
								<div class="form-group col-md-6">
									<label for="inputEmail4"> Name : </label> <input type="text"
										name="u_name" class="form-control" id="inputEmail4"
										value="${userobj.name }" readonly="readonly" required="required">
								</div>
								<div class="form-group col-md-6">
									<label for="inputPassword4"> Email : </label> <input
										type="email" name="u_email" class="form-control"
										id="inputPassword4" value="${userobj.email }"
										readonly="readonly" required="required">
								</div>
							</div>

							<div class="form-row">
								<div class="form-group col-md-6">
									<label for="inputEmail4"> Phone No. : </label> <input
										name="u_phoneno" type="text" class="form-control"
										id="inputEmail4" value="${userobj.phoneno }" required="required">
								</div>
								<div class="form-group col-md-6">
									<label for="inputPassword4"> Address :</label> <input
										name="u_address" type="text" class="form-control"
										id="inputPassword4" required="required">
								</div>
							</div>

							<div class="form-row">
								<div class="form-group col-md-6">
									<label for="inputEmail4"> LandMark : </label> <input
										name="u_landmark" type="text" class="form-control"
										id="inputEmail4" required="required">
								</div>
								<div class="form-group col-md-6">
									<label for="inputPassword4"> City : </label> <input
										name="u_city" type="text" class="form-control"
										id="inputPassword4" required="required">
								</div>
							</div>

							<div class="form-row">
								<div class="form-group col-md-6">
									<label for="inputEmail4"> State : </label> <input
										name="u_state" type="text" class="form-control"
										id="inputEmail4" required="required">
								</div>
								<div class="form-group col-md-6">
									<label for="inputPassword4"> Pincode : </label> <input
										name="u_pincode" type="text" class="form-control"
										id="inputPassword4" required="required">
								</div>
							</div>

							<div class="form-group">
								<label> Payment Mode : </label> <select class="form-control"
									name="paymenttype">
									<option value="noSelect">--Select--</option>
									<option value="Cash On Delivery">Cash On Delivery</option>
								</select>
							</div>

							<div class="text-center">
								<button class="btn btn-warning">Order Now</button>
								<a href="index.jsp" class="btn btn-success">Continue
									Shopping</a>
							</div>
						</form>
					</div>
				</div>

			</div>



		</div>

	</div>



</body>
</html>