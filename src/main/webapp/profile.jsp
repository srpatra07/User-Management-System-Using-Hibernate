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
<body>
	
<% 
	User validateUserSession= (User)session.getAttribute("userObj");
	if(validateUserSession==null)
	{
		response.sendRedirect("login.html");
	}
	else
	{%>
		<%@ include file="components/homeBar.jsp" %>

		<% User user=(User)session.getAttribute("userdetails") ;%>
		<h1 style="text-align: center;color:blue">
		User name:<%=user.getName() %><br>
		User age:<%=user.getAge() %><br>
		User mobile:<%=user.getMobile() %><br>
		User email:<%=user.getEmail() %><br>
		</h1>
	<%}
%>

</body>
</html>