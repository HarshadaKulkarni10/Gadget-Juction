<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>GadgetJuction - Edit Profile</title>
<%@ include file="all_components/css.jsp"%>
</head>
<body style="background-color: #f5f7f6">
	<%@include file="all_components\navbar.jsp"%>
	<div class="container">
		<div class="row">
			<div class="col-md-6 offset-md-3">
				<div class="card mt-3">
					<div class="card-body">

						<h4 class="text-center text-success">Edit Profile</h4>

						<c:if test="${not empty SuccMsg}">
							<div class="alert alert-success" role="alert">${SuccMsg}</div>
							<c:remove var="SuccMsg" scope="session" />
						</c:if>


						<c:if test="${not empty FailMsg}">
							<div class="alert alert-danger" role="alert">${FailMsg}</div>
							<c:remove var="FailMsg" scope="session" />
						</c:if>


						<form action="UpdateProfile" method="post">

							<input type="hidden" value="${userobj.id }" name="id">
							<div class="form-group">
								<label for="exampleInputEmail1"><strong>Enter
										Name: </strong></label> <input name="u_name" value="${userobj.name }"
									type="text" class="form-control" id="exampleInputEmail1"
									aria-describedby="emailHelp" placeholder="Enter Name"
									required="required">

							</div>
							<div class="form-group">
								<label for="exampleInputEmail1"><strong>Enter
										Email: </strong></label> <input name="u_email" value="${userobj.email }"
									class="form-control" id="exampleInputEmail1"
									aria-describedby="emailHelp" placeholder="Enter email"
									required="required">

							</div>
							<div class="form-group">
								<label for="exampleInputEmail1"><strong>Enter
										Contact No: </strong></label> <input name="u_phoneno"
									value="${userobj.phoneno }" class="form-control"
									id="exampleInputEmail1" aria-describedby="emailHelp"
									placeholder="Enter Contact No" required="required">

							</div>
							<div class="form-group">
								<label for="exampleInputPassword1"><strong>Enter
										Contact No: </strong></label> <input name="u_password" class="form-control"
									id="exampleInputPassword1" placeholder="Password"
									required="required">
							</div>

							<div class="container text-center">
								<button type="submit" class="btn btn-primary">
									<strong>Update</strong>
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