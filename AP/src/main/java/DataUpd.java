
import java.io.IOException;

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
 * Servlet implementation class DataUpd
 */
public class DataUpd extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     * 
     */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		PrintWriter out=response.getWriter();

		
		try
		{
			HttpSession session=request.getSession(false);
			String eemail=(String)session.getAttribute("remail");
			String epassword=(String)session.getAttribute("rpassword");
			Class.forName("com.mysql.jdbc.Driver");
			Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/mydbvirtusa","root","");
			PreparedStatement stmt=con.prepareStatement("update usersVirtusa"
					+ " set Phone=?,Name=?,Password=? where Email=? and Password=?");
			
			stmt.setString(1,request.getParameter("umob"));
			stmt.setString(2,request.getParameter("uname"));
			stmt.setString(3,request.getParameter("upwd"));
			stmt.setString(4,eemail);
			stmt.setString(5,epassword);
			int i=stmt.executeUpdate();
			
			
			if(i>0 ) {
			out.println("<html>");
			out.println("<body>");
			 out.println("<script> window.location.assign('login.html'); </script>");
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
