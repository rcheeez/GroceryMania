package com.grocerymania.codes.Cart;


import java.io.IOException;
import java.io.PrintWriter;
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
/**
 * Servlet implementation class CartServlet
 */
@WebServlet("/CartServlet")
public class CartServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CartServlet() {
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
		PrintWriter out = response.getWriter();
		String product_name = request.getParameter("pname");
		String product_image = request.getParameter("pimage");
		int Pprice = Integer.parseInt(request.getParameter("price"));
		int product_qty = Integer.parseInt(request.getParameter("pqty"));
		String role = request.getParameter("role");
		int totalprice=0;
		int uid = Integer.parseInt(request.getParameter("uid"));
		
		
		String url = "jdbc:mysql://localhost:3306/grocerymania";
		String user = "root";
		String password = "pass123";
		String query = "insert into cart(uid,pname,pimage,product_qty,price) values(?,?,?,?,?);";
		int row = 0;
		try {
			Class.forName("com.mysql.jdbc.Driver");
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		try {
			Connection conn = DriverManager.getConnection(url, user, password);
			PreparedStatement ps = conn.prepareStatement(query);
			ps.setInt(1, uid);
			ps.setString(2, product_name);
			ps.setString(3, product_image);
			ps.setInt(4, product_qty);
			totalprice = product_qty* Pprice;
			ps.setInt(5, totalprice);
			row = ps.executeUpdate();
			//int i = 0;
			if (row > 0) {
				String message = "Product Added to Cart Sucessfully";
				HttpSession session = request.getSession(false);
				session.setAttribute("msgs", message);
				session.setAttribute("role", role);
				response.sendRedirect("shop.jsp");
				
			} else {
				out.println("Product not added to cart!");
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			out.println("<script>alert('Cannot add to Cart You need to login first.');</script>");
		}
		
		
		
	}

}
