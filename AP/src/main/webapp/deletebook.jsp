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
int cnt=0;

try{
String eemail=(String)session.getAttribute("remail");

Class.forName("com.mysql.jdbc.Driver");
Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/mydbvirtusa","root","");
PreparedStatement stmt=con.prepareStatement("delete from notebook where Email=? AND Notebookname=?");
stmt.setString(1,eemail);
stmt.setString(2,request.getParameter("notebookname"));
int i=stmt.executeUpdate();
if(i>0){

cnt++;
}
else
{
	out.println("error"+request.getParameter("notebookname"));
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
try{
String eemail=(String)session.getAttribute("remail");

Class.forName("com.mysql.jdbc.Driver");
Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/mydbvirtusa","root","");
PreparedStatement stmt=con.prepareStatement("delete from note where Email=? AND Notebookname=?");
stmt.setString(1,eemail);
stmt.setString(2,request.getParameter("notebookname"));
int i=stmt.executeUpdate();
if(i>0){
cnt++;
}
else
{
	out.println("error"+request.getParameter("notebookname"));
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
if(cnt==2)
{
	out.println("<script> window.location.assign('AddNoteBook.jsp'); </script>");
}
%>
</div>
</body>
</html>
