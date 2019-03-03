package pack;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class GetNames {

	public ArrayList<String> values()
	{
		ResultSet rs = null;
		ArrayList<String> al = new ArrayList<String>();
		try{
			Class.forName("oracle.jdbc.driver.OracleDriver");
			Connection c = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "avneet", "avneet");
			PreparedStatement ps = c.prepareStatement("Select name,dept,aoe,pi from facdetails");
			rs =ps.executeQuery();
			while(rs.next())
			{
				al.add(rs.getString(1));
			}
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
		return al;
	}
	
}
