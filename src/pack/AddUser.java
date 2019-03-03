package pack;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class AddUser
 */
public class AddUser extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//response.getWriter().append("Served at: ").append(request.getContextPath());
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//doGet(request, response);
		String name = request.getParameter("name");
		String dept = request.getParameter("dept");
		String aoe = request.getParameter("aoe");
		String pi = request.getParameter("pi");
		try{
			Class.forName("oracle.jdbc.driver.OracleDriver");
			Connection c = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "avneet", "avneet");
			PreparedStatement ps = c.prepareStatement("Insert into facdetails values((select max(id)+1 from facdetails),?,?,?,?)");
			//int x = s.executeUpdate("insert into remDept2 values('123456','Avneet Vishnoi','Azad Nagar')");
			ps.setString(1, name);
			ps.setString(2, dept);
			ps.setString(3, aoe);
			ps.setString(4, pi);
			ps.executeUpdate();
			c.close();
			response.sendRedirect("DashBoard.jsp");
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
	}

}
