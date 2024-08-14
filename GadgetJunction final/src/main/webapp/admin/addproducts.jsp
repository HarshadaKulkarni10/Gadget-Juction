<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page isELIgnored = "false" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Gadget Junction - Add Products</title>
<%@include file="css.jsp"%>
</head>
<body style="background: #f0f1f2">
	<%@include file="navbar.jsp"%>
	
	<c:if test="${empty userobj }">
		<c:redirect url="../login.jsp" />
	</c:if>
	<div class="container">
		<div class="row">
			<div class="col-md-6 offset-md-3 p-4">
				<div class="card p-2">
					<div class="card-body">
						<h3>
							<strong>Add Products</strong>
						</h3>
						
						<c:if test="${not empty SuccMsg}">
						<p class="text-center text-success">${SuccMsg }</p>
						<c:remove var="SuccMsg" scope="session"/>
						</c:if>
						
						<c:if test="${not empty FailMsg}">
						<p class="text-center text-danger">${FailMsg }</p>
						<c:remove var="FailMsg" scope="session"/>
						</c:if>
						
						<form action="../add_Products" method="post"
							enctype="multipart/form-data">
							<div class="form-group">
								<label for="exampleInputEmail1"><strong>Product
										Name : </strong></label> <input name="p_name" type="text" class="form-control"
									id="exampleInputEmail1" aria-describedby="emailHelp"
									placeholder="Enter Product Name">
							</div>

							<div class="form-group">
								<label for="exampleInputPassword1"><strong>Product
										Configuration: </strong></label>
								<textarea rows="7" name="p_details" class="form-control"
									id="exampleInputPassword1" placeholder="Enter Product Details"></textarea>
							</div>

							<div class="form-group">
								<label for="exampleInputEmail1"><strong>Product
										Price : </strong></label> <input name="p_price" type="text"
									class="form-control" id="exampleInputEmail1"
									aria-describedby="emailHelp" placeholder="Enter Product Price">
							</div>

							<div class="form-group">
								<label for="exampleFormControlSelect1">Select Category :</label>
								<select name="p_category" class="form-control"
									id="exampleFormControlSelect1">
									<option selected>--select--</option>
									<option>New Product</option>
									<option>Old Product</option>

								</select>
							</div>

							<div class="form-group">
								<label for="exampleFormControlSelect1"><strong>Select
										Status :</strong></label> <select name="p_status" class="form-control"
									id="exampleFormControlSelect1">
									<option selected>--select--</option>
									<option>Active</option>
									<option>Unactive</option>

								</select>
							</div>

							<div class="form-group">
								<label for="exampleFormControlFile1"><strong>Add
										Image :</strong></label> <input name="p_image" type="file" class="form-control-file"
									id="exampleFormControlFile1">
							</div>
							<div class="container text-center">
								<button type="submit" class="btn btn-primary">
									<strong>Add Product</strong>
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