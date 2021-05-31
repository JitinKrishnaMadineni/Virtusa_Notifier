
import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.*;
import java.sql.SQLException;

/**
 * Servlet implementation class DataCon
 */
public class DataCon  {
	private static final long serialVersionUID = 1L;
	protected static Connection initializeDatabase()throws ClassNotFoundException,IOException,SQLException
	{
		Class.forName("com.mysql.jdbc.Driver");
		Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/dbvirtusa","root","");
		return con;
	}

}
