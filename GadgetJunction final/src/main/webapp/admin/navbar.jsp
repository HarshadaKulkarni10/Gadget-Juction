<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page isELIgnored="false"%>
<div class="container-fluid"
	style="height: 10px; background-color: #9c27b0"></div>


<div class="container-fluid p-4 bg-header">
	<div class="row">
		<div class="col-md-3">
			<h3>
				<i class="fa-solid fa-laptop"></i> <strong>GadgetJunction</strong>
			</h3>
		</div>
		<div class="col-md-6"></div>
		<div class="col-md-3">
			<c:if test="${not empty userobj }">
				<a href="../login.jsp" class="btn btn-success "><strong>${userobj.name }</strong></a>
				<a data-toggle="modal" data-target="#exampleModalCenter"
					class="btn btn-primary "><strong><i
						class="fa-solid fa-right-from-bracket"></i> Logout</strong></a>
			</c:if>

			<c:if test="${empty userobj }">

				<a href="register.jsp" class="btn btn-primary "><strong><i
						class="fa-solid fa-user-plus"></i> REGISTER</strong></a>
			</c:if>


		</div>

	</div>
</div>


<!-- Logout Modal -->
<!-- Button trigger modal -->


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

<!-- end Logout Modal -->
<nav
	class="navbar navbar-expand-lg navbar-dark bg-custom justify-content-between">
	<a class="navbar-brand" href="#"><i class="fa fa-house"></i></a>
	<button class="navbar-toggler" type="button" data-toggle="collapse"
		data-target="#navbarSupportedContent"
		aria-controls="navbarSupportedContent" aria-expanded="false"
		aria-label="Toggle navigation">
		<span class="navbar-toggler-icon"></span>
	</button>

	<div class="collapse navbar-collapse" id="navbarSupportedContent">
		<ul class="navbar-nav mr-auto">
			<li class="nav-item active"><a class="nav-link" href="home.jsp"></i><strong>Home</strong>
					<span class="sr-only">(current)</span> </a></li>
		</ul>

	</div>
</nav>