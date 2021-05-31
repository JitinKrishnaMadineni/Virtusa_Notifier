
import java.io.IOException;
import java.util.Date;
import java.text.SimpleDateFormat;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class DataCheck
 */
public class DataCheck extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		try
		{
			PrintWriter out=response.getWriter();
			Class.forName("com.mysql.jdbc.Driver");
			Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/mydbvirtusa","root","");
			PreparedStatement stmt=con.prepareStatement("select Name,Email,Password from usersvirtusa where Email=? or Password=?");
			stmt.setString(1,request.getParameter("uname"));
			stmt.setString(2,request.getParameter("upwd"));
			ResultSet rs=stmt.executeQuery();
			String mail="",pwd="",name="";
		
			while(rs.next())
			{ 
				name=rs.getString("Name");
				 mail=rs.getString("Email");
				 pwd=rs.getString("Password");
			
			}
			
			
			/*else
			{
				out.println("<html>");
				out.println("<body>");
				out.println("<script> window.location.assign('sign.html'); </script>");
				out.println("</body>");
				out.println("</html>");
				
			}*/
		   // boolean val=mail.equals(request.getParameter("uname"));
		   // out.println(val);
		   // out.println(mail);
		    //out.println(request.getParameter("uname"));
			if(mail.equals(request.getParameter("uname")))
			{ 
				
				if(pwd.equals(request.getParameter("upwd")))
				{
		           
		           
					/*HttpSession session=request.getSession();
					String email=request.getParameter("uname");
					String epwd=request.getParameter("upwd");
					session.setAttribute("remail",email);
					
					session.setAttribute("rpassword",epwd);
					session.setAttribute("rname",name );
					out.println("<html>");
					out.println("<head>");
					out.println("<script> window.location.assign('DashBoard.jsp'); </script>");
					
					out.println("</head>");
					out.println("</html>");*/
					HttpSession session=request.getSession();
					String email=request.getParameter("uname");
					String epwd=request.getParameter("upwd");
					session.setAttribute("remail",email);
					
					session.setAttribute("rpassword",epwd);
					session.setAttribute("rname",name );
					out.println("<html>");
					out.println("<head>");
					out.println("<script> window.location.assign('DashBoard.jsp'); </script>");
					
					out.println("</head>");
					out.println("</html>");
					
				}
			
				
			}
			
			else {
			out.println("Incorrect userName");
			out.println("Incorrect password ");
			out.println("<html>");
			out.println("<head>");
			out.println("<script> window.location.assign('login.html'); </script>");
			
			out.println("</head>");
			out.println("</html>");
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
}

}
