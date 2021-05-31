<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="java.sql.*,java.util.Date,java.text.SimpleDateFormat"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
 <%!				              // observe, declaration
   int cnt=0;
   String dt;
%>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet" href="dashboard.css">
<style>
a{
text-decoration:none;
}
.submit
{
background-color: #4CAF50;
margin:1
px;
}
#pop:target{
display:block!important;}
ol li{
list-style-type:none;}
</style>

</head>
<body>
<%
SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
dt= sdf.format(new Date()); 

%>
<%
try
{
	String eemail1=(String)session.getAttribute("remail");
	Class.forName("com.mysql.jdbc.Driver");
	
	Connection con1=DriverManager.getConnection("jdbc:mysql://localhost:3306/mydbvirtusa","root","");
	PreparedStatement stmt1=con1.prepareStatement("select count(Notename) AS value from note where Email=? AND Remainderdate=?");
	stmt1.setString(1,eemail1);
	stmt1.setString(2,dt);
	ResultSet rs1=stmt1.executeQuery();
	
	if(rs1.next())
	{ 
		cnt=rs1.getInt("value");
		
	}
	
	stmt1.close();
	con1.close();
	

	
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
<i class="fa fa-bell" id="bell" style="font-size:24px;color:white;"></i>
<a class="fa fa-sign-out" id="signout" style="color:white;font-size:20px;" href="login.html">Signout</a>
<a href="#pop" onclick="show()"><span class="badge"> <%= cnt %> </span></a>
<span id="pop" style="position:absolute;top:60px;border-radius:3px;right:35px;width:200px;border:1px solid black;padding:2px;display:none;background-color:white;">
<%
try
{
	
	String eemail2=(String)session.getAttribute("remail");
	Class.forName("com.mysql.jdbc.Driver");
	
	Connection con2=DriverManager.getConnection("jdbc:mysql://localhost:3306/mydbvirtusa","root","");
	PreparedStatement stmt2=con2.prepareStatement("select Notename,Startdate,Enddate from note where Email=? AND Remainderdate=?");
	stmt2.setString(1,eemail2);
	stmt2.setString(2,dt);
	ResultSet rs2=stmt2.executeQuery();
	
	while(rs2.next())
	{ 
		
		out.println("<div >"
			   // +"<div style='background-color:white;float:left;padding:0px 30px;'>"
			    +"<p>"+rs2.getString("Notename")+"<br>StartedOn  :" +rs2.getString("Startdate")+"<br>EndsOn    :"+rs2.getString("Enddate")+"</p>"
			    		
			   // + "</div>"
			    		+ "</div>");
		
	}
	
	stmt2.close();
	con2.close();
	

	
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
</span>
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
function show()
{
	var ele=document.getElementById('pop');
	if(ele.style.visibility=='visible')
		{
		ele.style.visibility='hidden';
		}
	else
		{
		ele.style.visibility='visible';
		}
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
			   
			    +"<p>"+rs.getString("Notename")+"<br>StartedOn :" +rs.getString("Startdate")+"<br>EndsOn    :"+rs.getString("Enddate")+"</p>"
			    		
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
<h2>Notes</h2>
<%

try
{
	
	
	String eemail=(String)session.getAttribute("remail");
	Class.forName("com.mysql.jdbc.Driver");
	
	Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/mydbvirtusa","root","");
	PreparedStatement stmt=con.prepareStatement("select Notename,Notebookname,Startdate,Enddate,Status,Description from note where Email=?");
	stmt.setString(1,eemail);
	ResultSet rs=stmt.executeQuery();
	String mail="",pwd="";
	out.println("<ol id='list'>");
	while(rs.next())
	{ 
		SimpleDateFormat formatter=new SimpleDateFormat("yyyy-MM-dd");
		Date d1= formatter.parse(rs.getString("Startdate")); 
		Date d2= formatter.parse(rs.getString("Enddate")) ;
		Date d=formatter.parse(dt);
		
		
			String name=rs.getString("Notename");
		out.println("<div style='margin:5% 10%;background-color:#F0F3F3;width:80%;height:20px;padding:0px 0px 7px 10px;'>"
			    +"<div style='background-color:white;'>"
			    + "<li class='notes'><a href='DisplayNotes.jsp?notebookname="+name+"' style='padding:5px;'>"+rs.getString("Notename")+"</a></li>"
			          +"<li class='plus'><span><br><a href='DashBoard.jsp'><b>+</b><br><b>"+rs.getString("Description")+"</b></a></span>"
			          +"<span><i style='float:center;padding:0px 70px;'>Started On:"+rs.getString("Startdate")+"</i>"
			          //+"<i  style='float:center;padding:0px 60px;'>"+rs.getString("Status")+"</i></span>"
			        		  +"<input type='submit' class='submit' value="+rs.getString("Status")+"></span>"
			    		+"<a href='DeleteDashBoardNote.jsp?notename="+name+"&notebookname="+rs.getString("Notebookname")+"' style='float:right;padding:0px 20px;'><b>&times</b>Delete</a>"
			    +"<a href='EditDashBoardNote.jsp?notename="+name+"&notebookname="+rs.getString("Notebookname")+"' style='float:right;'><i class='fa fa-edit' style='font-size:14px'></i>Edit</a></li>"
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