<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page isELIgnored = "false" %>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Gadget Junction - Login</title>
<%@ include file="all_components/css.jsp"%>
</head>
<body style="background-color: #f0f1f2;">
	<%@include file="all_components\navbar.jsp"%>
	<div class="container">
		<div class="row">
			<div class="col=md-4 offset-4">
				<div class="card mt-4" style="width: 30rem;">
					<div class="card-body">
						<h3 class="text-center">
							<strong>Login</strong>
						</h3>

						<c:if test="${not empty FailMsg }">
							<h5 class="text-center text-danger">${FailMsg}</h5>
							<c:remove var="FailMsg" scope="session" />
						</c:if>
						
						<c:if test="${not empty SuccMsg }">
							<h5 class="text-center text-success">${SuccMsg}</h5>
							<c:remove var="SuccMsg" scope="session" />
						</c:if>

						<form action="Login" method="post">
							<div class="form-group">
								<label for="exampleInputEmail1"><strong>Email
										address</strong></label> <input name="u_email" type="email"
									class="form-control" id="exampleInputEmail1"
									aria-describedby="emailHelp" placeholder="Enter email"
									required="required">

							</div>
							<div class="form-group">
								<label for="exampleInputPassword1"><strong>Password</strong></label>
								<input name="u_password" type="password" class="form-control"
									id="exampleInputPassword1" placeholder="Password"
									required="required">
							</div>

							<div class="container text-center mt-3">
								<button type="submit" class="btn btn-primary">
									<strong>Login</strong> <br>
								</button>
								<br> <a class="mt-4" href="register.jsp"><strong>Haven't
										Registerd yet? Click Here</strong></a>
							</div>
						</form>

					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>