<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Login Page</title>
<%@ include file="components/bootstrap_css.jsp"%>

<style type="text/css">
.paint-card {
	box-shadow: 0 0 10px 0 rgba(0, 0, 0, 0.3);
}
body{
	background-image: url("assets/userbg.jpg")
}
</style>
</head>
<body>
	<%@ include file="components/navbar.jsp"%>

	<div id="maincontainer" class="container p-5">
		<div class="row">
			<div class="col-md-4 offset-md-4">
				<div class="card paint-card">
					<div class="card-body">
						<p class="fs-4 text-center">User Login</p>
						<form action="login" method="post">
							<%
							String msg = (String) session.getAttribute("fail");
							if (msg != null) {
							%>

							<%
							if (msg != null) {
							%>
							<p class="text-center text-success fs-4"><%=msg%></p>
							<%
							}
							%>

							<%
							session.removeAttribute("fail");
							}
							%>
							<div class="mb-3">
								<label class="form-label">Email Address</label> <input
									name="email" type="email" class="form-control" required>
							</div>
							<div class="mb-3">
								<label class="form-label">Password</label> <input
									name="password" type="password" class="form-control" required>
							</div>
							<button type="submit" class="btn bg-success text-white bg-dark col-md-12">Login</button>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>


</body>
</html>