package pack;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class GetAllValues {

	public ArrayList values()
	{
		ResultSet rs = null;
		ArrayList al = new ArrayList();
		try{
			Class.forName("oracle.jdbc.driver.OracleDriver");
			Connection c = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "avneet", "avneet");
			PreparedStatement ps = c.prepareStatement("Select * from facdetails order by id");
			rs =ps.executeQuery();
			while(rs.next())
			{
				al.add(rs.getInt(1));
				al.add(rs.getString(2));
				al.add(rs.getString(3));
				al.add(rs.getString(4));
				al.add(rs.getString(5));
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
	
	public ArrayList values1(String word,int col)
	{
		ResultSet rs = null;
		ArrayList al = new ArrayList();
		try{
			PreparedStatement ps;
			Class.forName("oracle.jdbc.driver.OracleDriver");
			Connection c = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "avneet", "avneet");
			if(col==0)
			{
				ps = c.prepareStatement("Select name,dept,aoe,pi from facdetails where upper(name) like upper(?) or upper(dept) like upper(?) or upper(aoe) like upper(?) or upper(pi) like upper(?) order by name");
				ps.setString(1, "%"+word+"%");
				ps.setString(2, "%"+word+"%");
				ps.setString(3, "%"+word+"%");
				ps.setString(4, "%"+word+"%");
			}
			else
				if(col==1)
				{
					ps = c.prepareStatement("Select name,dept,aoe,pi from facdetails where upper(name) like upper(?) order by name");
					ps.setString(1, "%"+word+"%");
				}
				else
					if(col==2)
					{
						ps = c.prepareStatement("Select name,dept,aoe,pi from facdetails where upper(dept) like upper(?) order by name");
						ps.setString(1, "%"+word+"%");
					}
					else
						if(col==3)
						{
							ps = c.prepareStatement("Select name,dept,aoe,pi from facdetails where upper(aoe) like upper(?) order by name");
							ps.setString(1, "%"+word+"%");
						}
						else
						{
							ps = c.prepareStatement("Select name,dept,aoe,pi from facdetails where upper(pi) like upper(?) order by name");
							ps.setString(1, "%"+word+"%");
						}
			rs =ps.executeQuery();
			while(rs.next())
			{
				al.add(rs.getString(1));
				al.add(rs.getString(2));
				al.add(rs.getString(3));
				al.add(rs.getString(4));
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
		//System.out.println(al);
		return al;
	}
}
