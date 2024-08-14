<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>GadgetJuction - User Address</title>
<%@ include file="all_components/css.jsp"%>
</head>
<body style="background-color: #f5f7f6">
	<%@include file="all_components\navbar.jsp"%>
	<div class="container">
		<div class="row p-3">
			<div class="col-md-6 offset-md-3">
				<div class="card">
					<div class="card-body">
						<h4 class="text-center text-success"><strong>Add Address</strong></h4>

						<form action="">
							<div class="form-row">
								<div class="form-group col-md-6">
									<label for="inputPassword4"><strong> Address :</strong></label> <input
										type="password" class="form-control" id="inputPassword4">
								</div>

								<div class="form-group col-md-6">
									<label for="inputPassword4"><strong> Landmark :</strong></label> <input
										type="password" class="form-control" id="inputPassword4">
								</div>


							</div>

							<div class="form-row">
								<div class="form-group col-md-4">
									<label for="inputEmail4"><strong> City : </strong></label> <input type="text"
										class="form-control" id="inputEmail4">
								</div>
								<div class="form-group col-md-4">
									<label for="inputPassword4"><strong> State : </strong></label> <input
										type="password" class="form-control" id="inputPassword4">
								</div>

								<div class="form-group col-md-4">
									<label for="inputPassword4"><strong> Pincode : </strong></label> <input
										type="password" class="form-control" id="inputPassword4">
								</div>
							</div>
							
							<div class="text-center">
							<button class="btn btn-warning"><strong>Add Address</strong></button>
							
							</div>
						</form>
					</div>
				</div>

			</div>
		</div>
	</div>

</body>
</html>