<%@ page import="java.sql.*" %>

<!DOCTYPE html>
<html>
<head>
<title>Edit Notes</title>
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
<h1 class="text-center" style="color:#6a1b9a;"><b><i class="fa fa-pencil-square-o" aria-hidden="true"></i>&nbsp;Edit Your Notes</b></h1>

<div class="container">
<div class="row">
<div class="col-md-12">
<form>
	

  <div class="form-group">
    <label for="Ntitle" style="color:#6a1b9a;"><b>Edit Note Title :</b></label>
    <input type="text" class="form-control" name="Ntitle" id="Ntitle" autocomplete="off" aria-describedby="emailHelp" placeholder=" Title">
  </div>
  <div class="form-group">
    <label for="Ntext" style="color:#6a1b9a;"><b>Edit Your Note :</b></label>
	<textarea rows="12" cols="" class="form-control" name="Ntext" id="Ntext" placeholder="Edit Your Note Here ..."></textarea>
  </div>
<br>
 <div class="container text-center">
  <button type="submit" class="btn btn-primary" name="ed1" id="ed2" style="background-color:#7b1fa2;color:white;border:#4a148c ; border-width:3px; border-style:solid;"><b>Save</b></button> 
</div>
<br>
</form>
<%
		if(request.getParameter("ed1")!=null)
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
				String sql="update posts set uid=?,Ntitle=?,Ntext=? where uid=?";
				String sql1="select * from posts where uid=?";
				PreparedStatement pst=con.prepareStatement(sql);
				PreparedStatement pst1=con.prepareStatement(sql1);
				pst.setString(1,uid);
				pst.setString(2,Ntitle);
				pst.setString(3,Ntext);
				
				pst.executeUpdate();
				pst1.setString(1,uid);
				ResultSet rs=pst1.executeQuery();
				if(rs.next()){
					request.getSession().setAttribute("posts",uid);
%>
				<h5 class="text-center" style="color:#6a1b9a;"><i class="fa fa-check-square-o" aria-hidden="true"></i>&nbsp;Note is Edited Succesfully</h5> 
<%
					}
				else{
					out.println("Please enter valid uid.");
					}
%>
			<h6 hidden><%= uid %></h6>
<%
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