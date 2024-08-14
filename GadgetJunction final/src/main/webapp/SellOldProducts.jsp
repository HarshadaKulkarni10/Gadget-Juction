<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page isELIgnored="false"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>GadgetJunction - Sell Products</title>
<%@ include file="all_components/css.jsp"%>
</head>
<body style="background-color: #f5f7f6">

	<c:if test="${empty userobj  }">
		<c:redirect url="login.jsp"></c:redirect>
	</c:if>

	<%@include file="all_components\navbar.jsp"%>

	<div class="container">
		<div class="row">
			<div class="col-md-6 offset-md-3">
				<div class="card mt-3">
					<div class="card-body">
						<h4 class="text-center text-success">Sell Old Products</h4>
						<form action="AddOldProduct" method="post"
							enctype="multipart/form-data">

							<c:if test="${not empty SuccMsg}">
								<p class="text-center text-success">${SuccMsg }</p>
								<c:remove var="SuccMsg" scope="session" />
							</c:if>

							<c:if test="${not empty FailMsg}">
								<p class="text-center text-danger">${FailMsg }</p>
								<c:remove var="FailMsg" scope="session" />
							</c:if>
							
							<input type="hidden" value="${userobj.email}" name="user">



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
								<label for="exampleFormControlFile1"><strong>Add
										Image :</strong></label> <input name="p_image" type="file"
									class="form-control-file" id="exampleFormControlFile1">
							</div>
							<div class="container text-center">
								<button type="submit" class="btn btn-primary">
									<strong>Sell Product</strong>
								</button>
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>