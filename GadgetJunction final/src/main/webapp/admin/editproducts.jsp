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
<title>Gadget Junction - Add Products</title>
<%@include file="css.jsp"%>
</head>
<body style="background: #f0f1f2">
	<%@include file="navbar.jsp"%>
	<div class="container">
		<div class="row">
			<div class="col-md-6 offset-md-3 p-4">
				<div class="card p-2">
					<div class="card-body">
						<h3>
							<strong>Edit Products</strong>
						</h3>

						

						<%
						int id = Integer.parseInt((request.getParameter("id")));
						ProductDAOimpl dao = new ProductDAOimpl(DBConnection.getConn());
						Product p = dao.getProductById(id);
						%>


						<form action="../edit_Products" method="post">
							
							<input type="hidden" name="id" value="<%=p.getP_id()%>">
							
							<div class="form-group">
								<label for="exampleInputEmail1"><strong>Product
										Name : </strong></label> <input name="p_name" type="text" class="form-control"
									id="exampleInputEmail1" aria-describedby="emailHelp"
									placeholder="Enter Product Name" value="<%=p.getP_name()%>">
							</div>

							<div class="form-group">
								<label for="exampleInputPassword1"><strong>Product
										Configuration: </strong></label>
								<input name="p_details" type="text" class="form-control"
									id="exampleInputEmail1" aria-describedby="emailHelp"
									placeholder="Enter Product Name" value="<%=p.getP_details()%>">
								
							</div>

							<div class="form-group">
								<label for="exampleInputEmail1"><strong>Product
										Price : </strong></label> <input name="p_price" type="text"
									class="form-control" id="exampleInputEmail1"
									aria-describedby="emailHelp" placeholder="Enter Product Price"
									value="<%=p.getP_price()%>">
							</div>



							<div class="form-group">
								<label for="exampleFormControlSelect1"><strong>Select
										Status :</strong></label> <select name="p_status" class="form-control"
									id="exampleFormControlSelect1">
									<%
									if ("Active".equals(p.getP_status())) {
									%>
									<option value="Inactive">Inactive</option>
									<option value="Active">Active</option>
									<%
									} else {
									%>
									<option value="Active">Active</option>
									<option value="Inactive">Inactive</option>

									<%
									}
									%>

								</select>
							</div>

							
							<div class="container text-center">
								<button type="submit" class="btn btn-primary">
									<strong>Edit</strong>
								</button>
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
	<div style="margin-top: 340px;">
		<%@include file="footer.jsp"%>
	</div>
</body>
</html>