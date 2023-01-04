<%@ page import="java.sql.*" %>
<%@ page import="java.util.*" %>
<%@ page import="java.io.*" %>
<%
				if(request.getParameter("dr1")!=null)
				{
				
				try
				{
				DriverManager.registerDriver(new com.mysql.cj.jdbc.Driver());
				String url="jdbc:mysql://localhost:3306/e_notes_app";
				String un="root";
				String pw="abc123";
				Connection con=DriverManager.getConnection(url,un,pw);
				String sql="delete from posts where Nid=?";
				PreparedStatement pst=con.prepareStatement(sql);
				pst.setInt(1,Integer.parseInt(request.getParameter("dr1")));
				pst.executeUpdate();
				con.close();
				}
				catch(SQLException e)
				{
					out.println("issue :"+e);
				}
				}
			%>

 
<!DOCTYPE html>
<html>
<head>
<title>View Notes</title>
<style>
</style>
<%@include file="allcss.jsp" %>
</head>
<body style="background-color: #f3e5f5">

<%@include file="navbar.jsp" %>
<br>
<div class="container">
<h1 class="text-center" style="color:#6a1b9a;"><b><i class="fa fa-file-text" aria-hidden="true"></i>&nbsp;All Notes</b></h1>

<%			
						
				try
				{
				DriverManager.registerDriver(new com.mysql.cj.jdbc.Driver());
				String url="jdbc:mysql://localhost:3306/e_notes_app";
				String un="root";
				String pw="abc123";
				Connection con=DriverManager.getConnection(url,un,pw);
				String sql="select * from posts where uid=?";
				String sql1="select * from user where uid=?"; 
				PreparedStatement pst=con.prepareStatement(sql,Statement.RETURN_GENERATED_KEYS);
				pst.setString(1,uid);
				PreparedStatement pst1=con.prepareStatement(sql1);
				pst1.setString(1,uid);
				ResultSet rs=pst.executeQuery();
				ResultSet rs1=pst1.executeQuery();
				while(rs.next())
				{
					int Nid=rs.getInt(1);
					String Ntitle=rs.getString(2);
					String Ntext=rs.getString(3);
					Timestamp date=rs.getTimestamp(4);
					
				while(rs1.next())
				{
					String uname=rs1.getString(1);
					String uemail=rs1.getString(3);
					String pw1=rs1.getString(4);
					
%>
<div class="row">
	<div class="col-md-12">
		<div class="card mt-3">
			<img alt="" src="mobile-devices-2017981_1280.png" class="card-img-top mt-2 mx-auto" style="max-width:100px;">
			
			<div class="card-body p-4">
			<h6 class="card-title" style="color:#28a745;"><b>Note Id: <%= Nid %></b></h6>
			<h6 class="card-title" style="color:#28a745;"><b>Note Title :<%= Ntitle %></b></h6>
			<p style="color:#28a745;"><b>Note :</b><br><%= Ntext %></p>
			<b class="text-success">Published By: <%= uname %> </b><br>
			<b class="text-primary"></b>
			</p>
			
			<p>
			<b class="text-success">Published Date: <%= date %></b><br>
			<b class="text-success"></b>
			</p>

			<div class="container text-center mt-2">
				<a href="?dr1=<%=Nid%>" class="btn btn-danger" name="dr1" id="dr1" onclick="return confirm('Are you want delete? Sure??')" >Delete</a>
			</div>
			</div>
		</div>
	</div>
</div>

<%	
				}
				}	
				
					con.close();
				}
				catch(SQLException e)
				{
					out.println("Issue"+e);
				}
%>

</body>
</html>