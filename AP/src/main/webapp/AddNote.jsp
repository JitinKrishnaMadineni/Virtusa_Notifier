<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="java.sql.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
 
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet" href="dashboard.css">
</head>
<body>
<div style="background-color:black;">
<div id="mySidenav" class="sidenav">
  <a href="javascript:void(0)" class="closebtn" onclick="closeNav()">&times;</a>
  <h2 style="color:white">Hai
  <%out.print((String)session.getAttribute("rname"));%></h2>
  <a href="AddNoteBook.jsp">NoteBooks</a>
  <a href="#">Notes</a>
  <a href="edituser.html">Edit User</a>
</div>

<div id="main">
  <span style="font-size:25px;cursor:pointer" onclick="openNav()"><i class="fa fa-bars" style="color:white;">&#9776</i></span>
<a  id="newnotebook" style="color:white;font-size:20px;" href="addNote.html" style="float:right;">NEWNOTE</a>
<a class="fa fa-sign-out" id="signout" style="color:white;font-size:20px;" href="login.html">LOGOUT</a>
</div>
</div>
<script>
function openNav() {
	
  document.getElementById("mySidenav").style.width = "250px";
  document.getElementById("main").style.marginLeft = "250px";
}

function closeNav() {
  document.getElementById("mySidenav").style.width = "0px";
  document.getElementById("main").style.marginLeft = "0px";
}
</script>
   
<div class="leftdiv">
Your daily Tasks!!!!!!
</div>
<div class="rightdiv" >
<form class="example" action="/action_page.php" style="margin:auto;max-width:300px">
  <input type="text" placeholder="Search.." name="search2">
  <button type="submit"><i class="fa fa-search"></i></button>
</form>
NoteBook
<%

try
{
	
	
	String eemail=(String)session.getAttribute("remail");
	Class.forName("com.mysql.jdbc.Driver");
	Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/mydbvirtusa","root","");
	PreparedStatement stmt=con.prepareStatement("select Notebookname from notebook where Email=?");
	stmt.setString(1,eemail);
	ResultSet rs=stmt.executeQuery();
	String mail="",pwd="";
	while(rs.next())
	{ 
		//session.setAttribute("notebookname",rs.getString("Notebookname"));
		out.println("<div style='margin:5% 10%;background-color:#F0F3F3;width:80%;height:20px;padding:5px 7px 7px 10px;'>"
			    +"<div style='background-color:white;'>"
			    + "<a href='notes1.jsp' style='padding:5px;'>"+rs.getString("Notebookname")+"</a>"
			    		+"<a href='deletebook.jsp' style='float:right;padding:0px 20px;'>X delete</a>"
			    +"<a href='editNoteBook.html' style='float:right;'>Edit</a>"
			    		+ "</div>"
			    		+ "</div>");
		
	}
	
	stmt.close();
	con.close();
	

	
}
catch(ClassNotFoundException e)
{
	e.printStackTrace();
}
catch(Exception e)
{
	e.printStackTrace();
}
%>
</div>
</body>
</html> 