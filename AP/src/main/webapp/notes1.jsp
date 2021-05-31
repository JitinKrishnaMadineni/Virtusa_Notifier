
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="java.sql.*,java.util.Date,java.text.SimpleDateFormat"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
 
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet" href="dashboard.css">
<style>
.submit
{
background-color: #4CAF50;
margin:5px;
}
a{
text-decoration:none;
}
ol li{
list-style-type:none;}
.imgcontainer {
  text-align: center;
  margin: 24px 0 12px 0;
  position: relative;
}</style>
</head>
<body>
<div style="background-color:black;">
<div id="mySidenav" class="sidenav">
  <span  style="font-size:35px;cursor:pointer;float:right" onclick="closeNav()"><b  style="color:white;">&times;</b></span>
  <h2 style="color:white">Hai
  <%out.print((String)session.getAttribute("rname"));%></h2>
  <a href="AddNoteBook.jsp">NoteBooks</a>
  <a href="DashBoard.jsp">Notes</a>
  <a href="edituser.html">Edit User</a>
</div>

<div id="main">
  <span style="font-size:25px;cursor:pointer" onclick="openNav()"><i class="fa fa-bars" style="color:white;"></i></span>
  <%session.setAttribute("notesnotebook",request.getParameter("notebookname"));%>
<a  id="newnotebook" style="color:white;font-size:20px;float:right;padding:7px 150px" href="addNote.html" >NEWNOTE</a>
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
function search_notes() {
    let input = document.getElementById('searchbar').value
    input=input.toLowerCase();
    let x = document.getElementsByClassName('notes');
    let a = document.getElementsByClassName('plus');
    
    for (i = 0; i < x.length; i++) { 
        if (!x[i].innerHTML.toLowerCase().includes(input)) {
            x[i].style.display="none";
            a[i].style.display="none";
           
        }
        else {
            x[i].style.display="list-item"; 
            a[i].style.display="list-item";
        }
    }
}
</script>
   
<div class="leftdiv">
Your daily Tasks!!!!!!
<%!				              // observe, declaration
   
   String dt;
%>
<%
SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
dt= sdf.format(new Date()); 

%>
<%

try
{
	
	
	String eemail=(String)session.getAttribute("remail");
	Class.forName("com.mysql.jdbc.Driver");
	
	Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/mydbvirtusa","root","");
	PreparedStatement stmt=con.prepareStatement("select Notename,Startdate,Enddate from note where Email=?");
	stmt.setString(1,eemail);
	ResultSet rs=stmt.executeQuery();
	String mail="",pwd="";
	while(rs.next())
	{ 
		SimpleDateFormat formatter=new SimpleDateFormat("yyyy-MM-dd");
		Date d1= formatter.parse(rs.getString("Startdate")); 
		Date d2= formatter.parse(rs.getString("Enddate")) ;
		Date d=formatter.parse(dt);
		if((d.after(d1) && d.before(d2)) || (d.equals(d1) || d.equals(d2))){
                  out.println("<div >"
			   
			    +"<p>"+rs.getString("Notename")+"<br>StartedOn:" +rs.getString("Startdate")+"<br>EndsOn:"+rs.getString("Enddate")+"</p>"
			    		
			    		+ "</div>");
		}
		
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
<div class="rightdiv" >
<form class="example" action="/action_page.php" style="margin:auto;max-width:300px">
 <input id="searchbar" onkeyup="search_notes()" type="text"
        name="search" placeholder="Search notes.."><span><i class="fa fa-search" style='font-size:20px;padding:8px'></i></span>
      
</form>
<h3>Notes</h3>
<%

try
{
	
	
	String eemail=(String)session.getAttribute("remail");
	Class.forName("com.mysql.jdbc.Driver");
	Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/mydbvirtusa","root","");
	PreparedStatement stmt=con.prepareStatement("select Notename,Startdate,Status,Notebookname from note where Email=? and Notebookname=?");
	stmt.setString(1,eemail);
	stmt.setString(2,request.getParameter("notebookname"));
	ResultSet rs=stmt.executeQuery();
	session.setAttribute("notebookname1",request.getParameter("notebookname"));
	out.println("<ol id='list'>");
	while(rs.next())
	{ 
		
		out.println("<div style='margin:5% 10%;background-color:#F0F3F3;width:80%;height:20px;padding:5px 7px 7px 10px;'>"
			    +"<div style='background-color:white;'>");
		//session.setAttribute("notebookname",rs.getString("Notebookname"));
		        String name=rs.getString("Notename");
			    out.println("<li class='notes'><a href='NoteDisplay.jsp?notebookname="+name+"' style='padding:5px;'>"+rs.getString("Notename")+" </li><li class='plus'><br><a href='Noteplus.jsp?notebookname2="+request.getParameter("notebookname")+"'><b>+</b></a>"+"</a>"+
			    		"<span><i style='float:center;padding:0px 70px;'>Started On:"+rs.getString("Startdate")+"</i>"                                                                                          
			  //  +"<i  style='float:center;padding:0px 60px;'>"+rs.getString("Status")+"</i></span>"
					  +"<input type='submit' class='submit' value="+rs.getString("Status")+"></span>"
			    		+"<a href='DeleteNoteNote.jsp?notename="+name+"&notebookname="+rs.getString("Notebookname")+"' style='float:right;padding:0px 20px;'><b>&times</b>delete</a>"
			    +"<a href='EditNoteNote.jsp?notename="+name+"&notebookname="+rs.getString("Notebookname")+"' style='float:right;'><i class='fa fa-edit' style='font-size:14px'></i>Edit</a></li>"
			    		+ "</div>"
			    		+ "</div>");
			    
		
	}
	out.println("</ol>");
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