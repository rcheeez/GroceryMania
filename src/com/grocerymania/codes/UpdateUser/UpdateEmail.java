package com.grocerymania.codes.UpdateUser;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

//import org.apache.catalina.util.URLEncoder;

/**
 * Servlet implementation class UpdateEmail
 */
@WebServlet("/UpdateEmail")
public class UpdateEmail extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UpdateEmail() {
        super();
        // TODO Auto-generated constructor stub
    }

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
		int userid = Integer.parseInt(request.getParameter("uid"));
		String email = request.getParameter("eml");
		int row = 0;
		  String url = "jdbc:mysql://localhost:3306/grocerymania";
		  String user = "root";
		  String password = "pass123";
		  String sql = "update user set emailid = ?  where uid = ? ";
		  try {
			Class.forName("com.mysql.cj.jdbc.Driver");
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		  try {
			Connection conn = DriverManager.getConnection(url, user, password);
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, email);
			ps.setInt(2, userid);
			row = ps.executeUpdate();
			if (row > 0 ) {
				String message = "Email Updated Sucessfully!";
				HttpSession session = request.getSession(false);
				session.setAttribute("emailid", email);
				session.setAttribute("msg", message);
				response.sendRedirect("Welcome.jsp");
			} else {
				response.sendRedirect("index.jsp");
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		  
	}

}
