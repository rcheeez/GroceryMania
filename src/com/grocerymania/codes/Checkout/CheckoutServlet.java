package com.grocerymania.codes.Checkout;


import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.Date;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class CheckoutServlet
 */
@WebServlet("/Checkout")
public class CheckoutServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CheckoutServlet() {
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
		PrintWriter out = response.getWriter();
		int userid = Integer.parseInt(request.getParameter("uid"));		
		String payment = request.getParameter("pay");
		long millis = System.currentTimeMillis();
		java.sql.Date date = new Date(millis);
		String query = "insert into orders(uid,orderdate,payment_mode,status) values(?,?,?,?)";
		String url = "jdbc:mysql://localhost:3306/grocerymania";
		String user = "root";
		String password = "pass123";
		HttpSession sess = request.getSession();
		sess.setAttribute("userid", userid);
		try {
			Class.forName("com.mysql.jdbc.Driver");
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		try {
			Connection conn = DriverManager.getConnection(url, user, password);
			PreparedStatement psmt = conn.prepareStatement(query);
			psmt.setInt(1, userid);
			psmt.setDate(2, date);
			psmt.setString(3, payment);
			psmt.setString(4, "processing");
			int row = 0;
			row = psmt.executeUpdate();
			if (row > 0) {
				response.sendRedirect("OrderConfirm.jsp");
			} else {
				out.println("<h1>Something went wrong!</h1>");
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}

}
