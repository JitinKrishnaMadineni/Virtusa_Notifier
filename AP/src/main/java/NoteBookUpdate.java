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
 * Servlet implementation class NoteBookUpdate
 */
public class NoteBookUpdate extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int cnt=0;
		PrintWriter out=response.getWriter();
		try
		{
			
			HttpSession session=request.getSession(false);
			String eemail=(String)session.getAttribute("remail");
			
		Class.forName("com.mysql.jdbc.Driver");
			Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/mydbvirtusa","root","");
			PreparedStatement stmt=con.prepareStatement("update notebook set Notebookname=? where Email=? and Notebookname=?");
			stmt.setString(1,request.getParameter("uname"));
			stmt.setString(2,eemail);
			stmt.setString(3,request.getParameter("notebookname"));
			
			int i=stmt.executeUpdate();
			if(i>0) {
				cnt++;
			}
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
		try
		{
		
			HttpSession session=request.getSession(false);
			String eemail=(String)session.getAttribute("remail");
			
		Class.forName("com.mysql.jdbc.Driver");
			Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/mydbvirtusa","root","");
			PreparedStatement stmt=con.prepareStatement("update note set Notebookname=? where Email=? and Notebookname=?");
			stmt.setString(1,request.getParameter("uname"));
			stmt.setString(2,eemail);
			stmt.setString(3,request.getParameter("notebookname"));
			
			int i=stmt.executeUpdate();
			if(i>0) {
				cnt++;}
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
		if(cnt==2)
		{
			out.println("<html>");
			out.println("<body>");
			out.println("<script> window.location.assign('AddNoteBook.jsp'); </script>");
			out.println("</body>");
			out.println("</html>");
		}
	}

}
