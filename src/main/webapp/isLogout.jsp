<%@page import="com.user.dto.User"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Logout Page</title>
<%@ include file="components/bootstrap_css.jsp"%>
<style type="text/css">
body{
	background-image: url("assets/userbg.jpg")
}
</style>
</head>
<body>
<% 
	User validateUserSession = (User)session.getAttribute("userObj");
	if(validateUserSession == null)
	{
		response.sendRedirect("login.jsp");
	}
	else
	{%>
		<%@ include file="components/homeBar.jsp" %>
		<div class="fs-3 text-center">
		<h3 style="font-size: 40px;margin-top: 40px; color: white;"><b>Are You Sure to Log out ?</b></h3><br>
		<a href="logout" class="btn btn-danger text-decoration-none">Yes, Logout</a><br>
		<a href="home.jsp" class="btn btn-success text-decoration-none">No, Back to Home Page</a>
	</div>
	<%}
%>
</body>
</html>