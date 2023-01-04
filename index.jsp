
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
	<style type="text/css">
		body{
 		background-image: url("fountain-pen-1851096_1920.jpg");
		background-repeat: no-repeat;
		background-size:1550px 745px;
  		}
		p {
		text-align: center;
		font-size: 45px;
     	color: white;
		}
	</style>	

    <meta charset="ISO-8859-1">
    
	<title>Home page</title>
	<%@include file="allcss.jsp" %>
</head>

<body>
    <%@include file="navbar1.jsp" %>
	
	<p><i class="fa fa-book" aria-hidden="true"></i>E-Notes Application Save Your Notes</p>
	<center>
	<a href="login.jsp" class="btn btn-light my-2 my-sm-0 mr-2" type="submit"><i class="fa fa-user" aria-hidden="true"></i>  Login  </a>
      <a href="register.jsp" class="btn btn-light my-2 my-sm-0" type="submit"><i class="fa fa-user-plus" aria-hidden="true"></i> Register </a>
	</center>
	
</body>
</html>