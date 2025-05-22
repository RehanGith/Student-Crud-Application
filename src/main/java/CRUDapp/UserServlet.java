package CRUDapp;

import java.io.IOException;
import java.lang.annotation.Repeatable;
import java.sql.*;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
@WebServlet("/UserServlet")
public class UserServlet extends HttpServlet {
	public static final String URL = "jdbc:mysql://localhost:3306/CRUD";
	public static final String NAME = "root";
	public static final String PASS = "rehan1007mahi@sql";
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String my_action = req.getParameter("action");
		
		if(my_action == null) my_action = "list";
		
		
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			
			Connection con = DriverManager.getConnection(URL, NAME, PASS);
			if(my_action.equals("delete")) {
				int id = Integer.parseInt(req.getParameter("id"));
				PreparedStatement ps = con.prepareStatement("delete from student_info where std_id = ?");
				ps.setInt(1, id);
				ps.executeUpdate();
				ps.close();
				resp.sendRedirect("UserServlet");
				con.close();
				return;
			}else if(my_action.equals("edit")) {
				int id = Integer.parseInt(req.getParameter("id"));
				PreparedStatement ps = con.prepareStatement("select * from student_info where std_id = ?");
				ps.setInt(1, id);
				ResultSet rs = ps.executeQuery();
				if(rs.next()) {
					req.setAttribute("std_id", rs.getInt("std_id"));
					req.setAttribute("std_name", rs.getString("std_name"));
					req.setAttribute("std_class", rs.getString("std_class"));
				}
				ps.close();
				rs.close();
				con.close();
				req.getRequestDispatcher("addUser.jsp").forward(req, resp);
				return;
			}
			else {
				Statement stat = con.createStatement();
				ResultSet rs = stat.executeQuery("select * from student_info");
				req.setAttribute("users", rs);
				req.getRequestDispatcher("listingUser.jsp").forward(req, resp);
				rs.close();
				stat.close();
				con.close();
			}
		} catch(Exception e) {
			throw new ServletException(e);
		}
	}
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String std_id = req.getParameter("std_id");
		String std_name = req.getParameter("std_name");
		String std_class = req.getParameter("std_class");
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			Connection con = DriverManager.getConnection(URL, NAME, PASS);
			if(std_id == null || std_id.isEmpty()) {
				PreparedStatement ps = con.prepareStatement("insert into student_info(std_name, std_class) values (? , ?)");
				
				ps.setString(1, std_name);
				ps.setString(2, std_class);
				ps.executeUpdate();
			} else {
				PreparedStatement ps = con.prepareStatement("  update student_info set std_name = ? , std_class= ? where std_id = ?");
				
				ps.setString(1, std_name);
				ps.setString(2, std_class);
				ps.setInt(3, Integer.parseInt(std_id));
				ps.executeUpdate();
			}
			con.close();
			resp.sendRedirect("UserServlet");
		} catch(Exception e) {
			throw new ServletException(e);
		}

		
		
	}
}
