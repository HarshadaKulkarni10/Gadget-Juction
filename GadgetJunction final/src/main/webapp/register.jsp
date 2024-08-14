<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page isELIgnored = "false" %>
	
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Gadget Junction - Registeration</title>
<%@ include file="all_components/css.jsp"%>

</head>
<body style="background-color: #f0f1f2;">
	<%@include file="all_components\navbar.jsp"%>
	<div class="container p-3 ">
		<div class="row">
			<div class="col-md-4 offset-md-4">
				<div class="card ml-6 mx-auto" style="width: 30rem;">
					<div class="card-body">
						<h3><strong>Register Here</strong></h3>
						
						<c:if test="${not empty SuccMsg}">
						<p class="text-center text-success">${SuccMsg }</p>
						<c:remove var="SuccMsg" scope="session"/>
						</c:if>
						
						<c:if test="${not empty FailMsg}">
						<p class="text-center text-danger">${FailMsg }</p>
						<c:remove var="FailMsg " scope="session"/>
						</c:if>
						
						<form action="register" method="post">
							<div class="form-group">
								<label for="exampleInputEmail1"><strong>Enter
										Name: </strong></label> <input name= "u_name" type="text" class="form-control"
									id="exampleInputEmail1" aria-describedby="emailHelp"
									placeholder="Enter Name" required="required">

							</div>
							<div class="form-group">
								<label for="exampleInputEmail1"><strong>Enter
										Email: </strong></label> <input name="u_email" class="form-control"
									id="exampleInputEmail1" aria-describedby="emailHelp"
									placeholder="Enter email" required="required">

							</div>
							<div class="form-group">
								<label for="exampleInputEmail1"><strong>Enter
										Contact No: </strong></label> <input name="u_phoneno" class="form-control"
									id="exampleInputEmail1" aria-describedby="emailHelp"
									placeholder="Enter Contact No" required="required">

							</div>
							<div class="form-group">
								<label for="exampleInputPassword1"><strong>Enter
										Contact No: </strong></label> <input name="u_password" class="form-control"
									id="exampleInputPassword1" placeholder="Password" required="required">
							</div>
							<div class="form-check">
								<input name="check" type="checkbox" class="form-check-input"
									id="exampleCheck1"> <label class="form-check-label" 
									for="exampleCheck1"><strong>Agree terms and conditions</strong></label>
							</div>
							<div class="container text-center">
								<button type="submit" class="btn btn-primary">
									<strong>Submit</strong>
								</button>
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
	<%@ include file="all_components\footer.jsp"%>
</body>
</html>