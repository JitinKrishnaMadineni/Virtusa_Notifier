<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<div>
<%
try{
String eemail=(String)session.getAttribute("remail");
String notebookname1=(String)session.getAttribute("notebookname1");
Class.forName("com.mysql.jdbc.Driver");
Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/mydbvirtusa","root","");
PreparedStatement stmt=con.prepareStatement("delete from note where Email=? AND Notebookname=? AND Notename=?");
stmt.setString(1,eemail);
stmt.setString(2,notebookname1);
stmt.setString(3,request.getParameter("notename"));
int i=stmt.executeUpdate();
if(i>0){
out.println("<script> window.location.assign('notes1.jsp'); </script>");
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
