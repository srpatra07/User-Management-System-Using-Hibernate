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
	<h1 class="text-center">
		Welcome
		<%=sessionUser.getName().toUpperCase()%>
		to Home Page
	</h1>
	<div class="container-fluid p-3">
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
					
						<p class="fs-3 text-center"><b>User Details</b></p>
						<a href="add.jsp" class="text-decoration-none btn btn-primary">Add
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