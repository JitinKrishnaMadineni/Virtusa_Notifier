import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class NoteUpdate
 */
public class NoteUpdate extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		PrintWriter out=response.getWriter();
		
		HttpSession session=request.getSession(false);
		String eemail=(String)session.getAttribute("remail");
				try
		{
			
			
		Class.forName("com.mysql.jdbc.Driver");
			Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/mydbvirtusa","root","");
			PreparedStatement stmt=con.prepareStatement("update note set Notename=? where Email=? and Notebookname=? and Notename=?");
			stmt.setString(1,request.getParameter("unote"));
			stmt.setString(2,eemail);
			stmt.setString(3,request.getParameter("notebookname"));
			stmt.setString(4,request.getParameter("notename"));
			int i=stmt.executeUpdate();
			if(i>0) {
				HttpSession session1=request.getSession();
				String noteUpdate=request.getParameter("unote");
			out.println("<html>");
			out.println("<body>");
			out.println("<script> window.location.assign('DashBoard.jsp'); </script>");
			out.println("</body>");
			out.println("</html>");}
			else
			{
				out.println("<html>");
				out.println("<body>");
				 out.println("<script> window.location.assign('DashBoard.jsp'); </script>");
				out.println("</body>");
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