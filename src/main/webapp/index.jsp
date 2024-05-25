<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Mo Management</title>
<%@ include file="components/bootstrap_css.jsp"%>
<link rel="icon" type="image/png" sizes="32x32" href="assets/favicon-32x32.png">
<style type="text/css">
p::first-line{
	font-size : 50px;
	font-family: arial;
	font-weight: bold;
}
body{
	background-image: url("assets/userbg.jpg");
}
p{
	color: white;
	
}
.container{
	display: flex;
}
.main{
	font-size: 40px;
	padding: 20px;
	margin-top: 60px;
	margin-right: 30px;
}
</style>
</head>
<body>

	<%@ include file="components/navbar.jsp"%>

			<div class="container" style='margin-top: 15px'>
				<div class="main">
					<p class="lead">This website mainly focuses on How to manage 
				User in various fields and businesses. By using this site
				Anyone <br> can manage the User and It's more User friendly <br> also
				This site consists of several features which are implemented
				by JAVA Technologies.</p>
				</div>
				<div class="site-img">
					<img alt="Site Image" src="assets/site_img.jpg" width="600" height="400">
				</div>
			</div>
</body>
</html>