
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
 * Servlet implementation class NoteStr
 */
public class NoteStr extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		try
		{
			
			PrintWriter out=response.getWriter();
			HttpSession session=request.getSession(false);
			String eemail=(String)session.getAttribute("remail");
			String name=(String)session.getAttribute("notesnotebook");
			Class.forName("com.mysql.jdbc.Driver");
			Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/mydbvirtusa","root","");
			PreparedStatement stmt=con.prepareStatement("insert into note values(?,?,?,?,?,?,?,?,?)");
			stmt.setString(1,name);
			stmt.setString(2,request.getParameter("nname"));
			stmt.setString(3,request.getParameter("nstart"));
			stmt.setString(4,request.getParameter("nend"));
			stmt.setString(5,request.getParameter("nremainder"));
			stmt.setString(6,request.getParameter("nstatus"));
			stmt.setString(7,request.getParameter("ntag"));
			stmt.setString(8,request.getParameter("ndescription"));
			stmt.setString(9,eemail);
			int i=stmt.executeUpdate();
			if(i>0)
			{
				out.println("<html>");
				out.println("<head>");
                out.println("<script> window.location.assign('AddNoteBook.jsp'); </script>");
				
				out.println("</head>");
				out.println("</html>");
			}
			else
			{
				out.println("fail");
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
