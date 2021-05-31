import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class Datastr
 */
public class DataStr extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		 
		  PrintWriter out=response.getWriter();
				try
				{
					
					Class.forName("com.mysql.jdbc.Driver");
					Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/mydbvirtusa","root","");
					PreparedStatement stmt=con.prepareStatement("insert into usersvirtusa values(?,?,?,?)");
					stmt.setString(1,request.getParameter("uname"));
					stmt.setString(2,request.getParameter("umobile"));
					stmt.setString(3,request.getParameter("uemail"));
					stmt.setString(4,request.getParameter("upassword"));
					int i=stmt.executeUpdate();
					
			        if(i>0) {
					
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
