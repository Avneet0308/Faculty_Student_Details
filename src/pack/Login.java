package pack;
import java.sql.*;
public class Login {
	//Connection c;
	public String login(String userId, String pass)
	{
		String userName=null;
	try{
		Class.forName("oracle.jdbc.driver.OracleDriver");
		Connection c = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "avneet", "avneet");
		PreparedStatement ps = c.prepareStatement("Select username from admin where userid=? and password=?");
		//int x = s.executeUpdate("insert into remDept2 values('123456','Avneet Vishnoi','Azad Nagar')");
		ps.setString(1, userId);
		ps.setString(2, pass);
		ResultSet rs =ps.executeQuery();
		while(rs.next())
			userName=rs.getString(1);
		c.close();
	}
	catch(SQLException sqle)
	{
		System.out.println(sqle.getMessage());
		sqle.printStackTrace();
	}
	catch(Exception e)
	{
		System.out.println(e.getMessage());
		e.printStackTrace();
	}
	return userName;
  }
}
