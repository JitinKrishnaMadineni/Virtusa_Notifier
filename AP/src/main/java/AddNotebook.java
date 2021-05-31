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
 * Servlet implementation class AddNotebook
 */
public class AddNotebook extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
   
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub

		try
		{
			
			PrintWriter out=response.getWriter();
			HttpSession session=request.getSession(false);
			String eemail=(String)session.getAttribute("remail");
			Class.forName("com.mysql.jdbc.Driver");
			Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/mydbvirtusa","root","");
			PreparedStatement stmt=con.prepareStatement("insert into notebook values(?,?)");
			stmt.setString(1,eemail);
			stmt.setString(2,request.getParameter("unotebook"));
			int i=stmt.executeUpdate();
			if(i>0)
			{
				out.println("<html>");
				out.println("<head>");
                out.println("<script> window.location.assign('AddNoteBook.jsp'); </script>");
				
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
