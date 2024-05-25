<%@page import="java.util.List"%>
<%@page import="com.user.dao.UserDao"%>
<%@page import="com.user.dto.User"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Home Page</title>
<style type="text/css">
#maincontainer{
	background-image: url("assets/userbg.jpg");
	margin-top: -8px;
}
</style>
<%@include file="components/bootstrap_css.jsp"%>
<body>

	<%
	User validateUserSession = (User) session.getAttribute("userObj");
	if (validateUserSession == null) {
		response.sendRedirect("login.jsp");
	} else {
	%>
	<%@include file="components/homeBar.jsp"%>

	<%
	User sessionUser = (User) session.getAttribute("userObj");
	%>
	<h1 class="text-center text-danger bg-gray-400" style="padding-top: 10px; padding-bottom: 10px;">
		Welcome
		<b><%=sessionUser.getName().toUpperCase()%></b>
		to Home Page
	</h1>
	<div id="maincontainer" class="container-fluid p-3">
		<div class="row">
			<div class="col-md-12">
				<div class="card paint-card">
					<div class="card-body">
					
					<% 
						String updatesuccess = (String)session.getAttribute("updatesuccess");
						
						if(updatesuccess != null)
						{%>
							<p class="text-center text-success fs-4"><%=updatesuccess%></p>
							
					<% 	}
						session.removeAttribute("updatesuccess");
					%>
					
						<a href="add.jsp" class="text-decoration-none btn btn-primary bg-dark">Add
							User</a>
						<table class="table">
							<thead>
								<tr>
									<th>Name</th>
									<th>Age</th>
									<th>Email</th>
									<th>Mobile</th>
									<th>Action</th>
								</tr>
							</thead>
							<tbody>
								<%
								UserDao udao = new UserDao();
								List<User> list = udao.fetchAllUser();

								for (User u : list) {
								%>

								<%
								if (u.getId()==sessionUser.getId())
								{
									continue;
								}
								%>

								<tr>
									<td><%=u.getName()%></td>
									<td><%=u.getAge()%></td>
									<td><%=u.getEmail()%></td>
									<td><%=u.getMobile()%></td>
									<td><a href="update.jsp?id=<%= u.getId() %>" class="btn btn-success text-decoration-none">Update</a> 
									<a href="delete.jsp?id=<%= u.getId() %>" class="btn btn-danger text-decoration-none">Delete</a>
									</td>
								</tr>
								<%
								}
								%>
							</tbody>
						</table>
					</div>
				</div>
			</div>
		</div>
	</div>
	<%
	}
	%>
</body>
</html>