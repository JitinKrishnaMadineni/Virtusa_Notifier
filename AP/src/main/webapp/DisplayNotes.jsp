<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet" href="dashboard.css">
<title>NotesInfo</title>
<style>
a{
text-decoration:none;
}</style>
</head>
<body>
<center>
<div class="container" >
<%
 out.println("<h1>Notes Info</h1>");
try
{
	
	String eemail=(String)session.getAttribute("remail");
	
	Class.forName("com.mysql.jdbc.Driver");
	Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/mydbvirtusa","root","");
	PreparedStatement stmt=con.prepareStatement("select * from note where Notename=? and Email=?");

	stmt.setString(1,request.getParameter("notebookname"));
	stmt.setString(2,eemail);
	ResultSet rs=stmt.executeQuery();
	
	while(rs.next())
	{ 
		
		out.println("<p>NoteBookName : "+rs.getString("Notebookname")+"</p>");
		out.println("<p>NoteName : "+rs.getString("Notename")+"</p>");
		out.println("<p>StartDate : "+rs.getString("Startdate")+"</p>");
		out.println("<p>EndDate : "+rs.getString("Enddate")+"</p>");
		out.println("<p>RemainderDate : "+rs.getString("Remainderdate")+"</p>");
		out.println("<p>Status : "+rs.getString("status")+"</p>");
		out.println("<p>Tag : "+rs.getString("Tag")+"</p>");
		out.println("<p>Description : "+rs.getString("Description")+"</p>");
		
		
	}
	out.println("<a href='DashBoard.jsp'>"+"<b>BACK</b>"+"</a>");
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
</center>
</body>
</html>