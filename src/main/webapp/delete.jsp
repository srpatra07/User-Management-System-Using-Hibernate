<%@page import="com.user.dto.User"%>
<%@page import="com.user.dao.UserDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Delete Page</title>
<%@ include file="components/bootstrap_css.jsp" %>
</head>
<body>
<% 
	User validateUserSession = (User)session.getAttribute("userObj");
	if(validateUserSession==null)
	{
		response.sendRedirect("login.jsp");
	}
	else
	{ %>
		<% 
	int id = Integer.parseInt(request.getParameter("id"));
%>
<%@ include file="components/homeBar.jsp" %>
	<div class="fs-3 text-center">
		<h3 style="margin-top: 40px;">Are You Sure You want to delete the Details ?</h3><br>
		<a href="deleteLogic.jsp?id=<%= id %>" class="btn btn-danger text-decoration-none">Yes, Delete</a><br>
		<a href="home.jsp" class="btn btn-success text-decoration-none">No, Back to Home Page</a>
	</div>
<%	}
%>
</body>
</html>