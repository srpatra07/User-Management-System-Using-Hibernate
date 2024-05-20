<%@page import="com.user.dto.User"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%@ include file="components/bootstrap_css.jsp" %>

</head>
	
<% 
	User user= (User)session.getAttribute("userObj");
	if(user==null)
	{
		response.sendRedirect("login.html");
	}
	else
	{%>
		
		<body>
		
		<%@ include file="components/navbar.jsp"%>
	<div class="container p-5">
		<div class="row">
			<div class="col-md-4 offset-md-4">
				<div class="card paint-card">
					<div class="card-body">
						<p class="fs-4 text-center">Registration Page</p>
						<form action="update" method="post">
						<% String msg = (String)session.getAttribute("success");
						%>
						
						<% 
							if(msg!=null)
							{ %>
								<p class="text-center text-success fs-4"><%= msg %></p>
						<%	}
						%>
						
						<% session.removeAttribute("success"); %>
							<div class="mb-3">
								<label class="form-label">Name</label> <input name="name"
									type="text" class="form-control" value="<%= user.getName() %>" required>
							</div>
							<div class="mb-3">
								<label class="form-label">Age</label> <input name="age"
									type="tel" class="form-control" value="<%= user.getAge() %>" required>
							</div>
							<div class="mb-3">
								<label class="form-label">Mobile</label> <input name="mobile"
									type="tel" class="form-control" value="<%= user.getMobile() %>" required>
							</div>
							<div class="mb-3">
								<label class="form-label">Email Address</label> <input
									name="email" type="email" class="form-control" value="<%= user.getEmail() %>" required>
							</div>
							<input type="hidden" name="id" value="<%= user.getId() %>">
							<input type="hidden" name="password" value="<%= user.getPassword() %>">
							<button type="submit" class="btn bg-primary text-white col-md-12">Update</button>
						</form>

					</div>
				</div>
			</div>
		</div>
	</div>
		
		</body>
		
	<%}
%>
</html>