<%@ page import="java.sql.*" %>

<!DOCTYPE html>
<html>
<head>
<title>Add Notes</title>
<style>
h6 {
  position: absolute;
  left: 0px;
  top: 0px;
}
</style>
<script>
		function validate()
		{
			
			let Ntitle=document.getElementById("Ntitle");
			let Ntext=document.getElementById("Ntext");
			
			if(Ntitle.value=="")
			{
				alert("Note title should not be Empty");
				Ntitle.value="";
				Ntitle.focus();
				return false;
			}
			else if(Ntext.value=="")
			{
				alert("Note Text should not be Empty");
				Ntext.value="";
				Ntext.focus();
				return false;
			}
			else
			{
				true;
			}
		}
	</script>
<%@include file="allcss.jsp" %>
</head>
<body style="background-color: #f3e5f5">

<%@include file="navbar.jsp" %>
<br>
<h1 class="text-center" style="color:#6a1b9a;"><b><i class="fa fa-pencil-square" aria-hidden="true"></i>&nbsp;Add Your Notes</b></h1>

<div class="container">
<div class="row">
<div class="col-md-12">
<form>

  <div class="form-group">
    <label for="Ntitle" style="color:#6a1b9a;"><b>Enter Note Title :</b></label>
    <input type="text" class="form-control" name="Ntitle" id="Ntitle" autocomplete="off" aria-describedby="emailHelp" placeholder=" Title">
  </div>

  <div class="form-group">
    <label for="Ntext" style="color:#6a1b9a;"><b>Enter Your Note :</b></label>
	<textarea rows="12" cols="" class="form-control" name="Ntext" id="Ntext" placeholder="Enter Your Note Here ..."></textarea>
  </div>
<br>
 <div class="container text-center">
  <button type="submit" class="btn btn-primary" name="btn3" id="btn3" style="background-color:#7b1fa2;color:white;border:#4a148c ; border-width:3px; border-style:solid;"><b>Add Notes</b></button> 
</div>
<br>
</form>
<%
		if(request.getParameter("btn3")!=null)
				{
					String Ntitle=request.getParameter("Ntitle");
					String Ntext=request.getParameter("Ntext");
					
				try
				{
				DriverManager.registerDriver(new com.mysql.cj.jdbc.Driver());
				String url="jdbc:mysql://localhost:3306/e_notes_app";
				String un="root";
				String pw="abc123";
				Connection con=DriverManager.getConnection(url,un,pw);
				String sql="insert into posts(Ntitle,Ntext,uid) values(?,?,?)";
				String sql1="select * from user where uid=?";
				PreparedStatement pst=con.prepareStatement(sql);
				PreparedStatement pst1=con.prepareStatement(sql1);
				pst.setString(1,Ntitle);
				pst.setString(2,Ntext);
				pst.setString(3,uid);
				pst.executeUpdate();
				pst1.setString(1,uid);
				ResultSet rs=pst1.executeQuery();
				if(rs.next()){
					request.getSession().setAttribute("user",uid);
%>
				<h5 class="text-center" style="color:#6a1b9a;"><i class="fa fa-check-square-o" aria-hidden="true"></i>&nbsp;Note is Added Succesfully</h5> 
<%
					}
				else{
					out.println("Something went's wrong ! Try again.");
					}
				while(rs.next())
				{
					String uname=rs.getString(1);
					String uemail=rs.getString(3);
					String pw1=rs.getString(4);
%>
			<h6 hidden><%= uid %></h6>
<%
				}
				con.close();
				}
				catch(SQLException e)
				{
					out.println("Iuuse:  "+e);
			%>
				<h5 class="text-center" style="color:#6a1b9a;"><u>Something went's wrong ! Please enter valid data...</u></h5> 
			<%
				}
			}
			%>
</div>
</div>
</div>
<br>
</body>
</html>