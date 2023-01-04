<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html lang="en">
<head>
	<style>
	.h{
    	background-color: #9c27b0;
	height:100px;
	}
	h4{
   	 padding: 5px;
	}
	body{
 		background-image: url("computer-2242264_1920.jpg");
		background-repeat: no-repeat;
		background-size:1550px 745px;
  		}
	</style>
	<script>
		function validate()
		{
			let uid=document.getElementById("uid");
			let uemail=document.getElementById("uemail");
			let pw1=document.getElementById("pw1");
			if(uid.value=="")
			{
				alert("User id should not be Empty");
				uid.value="";
				uid.focus();
				return false;
			}
			else if(uemail.value=="")
			{
				alert("User email should not be Empty");
				uemail.value="";
				uemail.focus();
				return false;
			}
			else if(pw1.value=="")
			{
				alert("Password should not be Empty");
				pw1.value="";
				pw1.focus();
				return false;
			}
			else
			{
				true;
			}
		}
	</script>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login Page</title>
	<%@include file="allcss.jsp" %>
</head>
<body>
    <%@include file="navbar1.jsp" %>
	<div class="container-fliuid">
	<div class="row">
	<div class="col-md-4 offset-md-4">
	<div class="card mt-5">
	<div class="card-header">
	<div class="h">
	<center>
	<i class="fa fa-user fa-3x" aria-hidden="true"></i>
	<h4><b> Login </b></h4>
	</center>
	</div>
	<div class="card-body">
	<form onsubmit="return validate()" method="POST">
	
	<div class="form-group">
    <label for="uid"><b>Enter UserID:</b></label>
    <input type="text" class="form-control" name="uid" id="uid" step="any" aria-describedby="emailHelp" autocomplete="off" placeholder="Enter UserID">
 	</div>

  	<div class="form-group">
    <label for="uemail"><b>Enter Email address :</b></label>
    <input type="text" class="form-control" name="uemail" id="uemail" step="any" aria-describedby="emailHelp" autocomplete="off" placeholder="Enter email">
 	</div>

 	 <div class="form-group">
    <label for="pw"><b>Enter Password :</b></label>
    <input type="password" class="form-control" name="pw1" id="pw1" step="any" placeholder="Password">
 	 </div>
	<center>
  	<button type="submit" value="Login" name="btn2" class="btn btn-primary badge-pill btn-block"><b>Login</b></button><br>
	</form>
	<%
				if(request.getParameter("btn2")!=null)
				{
				String uid=request.getParameter("uid");
				String uemail=request.getParameter("uemail");
				String pw1=request.getParameter("pw1");
				try
				{
				DriverManager.registerDriver(new com.mysql.cj.jdbc.Driver());
				String url="jdbc:mysql://localhost:3306/e_notes_app";
				String un="root";
				String pw="abc123";
				Connection con=DriverManager.getConnection(url,un,pw);
				String sql="select * from user where uid=? and uemail=? and pw1=?";
				PreparedStatement pst=con.prepareStatement(sql);
				pst.setString(1,uid);
				pst.setString(2,uemail);
				pst.setString(3,pw1);
				ResultSet rs=pst.executeQuery();
				if(rs.next())
				{
					request.getSession().setAttribute("uid",uid);
					response.sendRedirect("home.jsp");
				}
				else
				{
		%>
				<h5 style="color:#f44336;"><u>Invalid Login ! Please enter valid data...</u></h5> 
		<%
				}
				con.close();
				}
				catch(SQLException e)
				{
		%>
				<h5 style="color:#f44336;"><u>Invalid Login ! Please enter valid data...</u></h5> 
		<%
				}
				}
			%>
	</div>
	</div>
	</div>
	</div>
	</div>
	</center>
</body>
</html>