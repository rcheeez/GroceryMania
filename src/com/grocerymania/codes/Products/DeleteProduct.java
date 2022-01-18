package com.grocerymania.codes.Products;


import java.io.File;
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

/**
 * Servlet implementation class DeleteProduct
 */
@WebServlet("/DeleteProduct")
public class DeleteProduct extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DeleteProduct() {
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
		int pid = Integer.parseInt(request.getParameter("id"));
		String image = request.getParameter("img");
		String path = "C:\\\\Users\\\\Aniket\\\\Desktop\\\\Archies\\\\GROCERYMANIA\\\\WebContent\\\\Images" + File.separator + image;
		File f = new File(path);
		f.delete();
	       String query = "delete from products where pid = ? ";
			String url = "jdbc:mysql://localhost:3306/grocerymania";
			String user = "root";
			String password = "pass123";
			int row = 0;
			try {
				Class.forName("com.mysql.jdbc.Driver");
			} catch (ClassNotFoundException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			try {
				Connection conn = DriverManager.getConnection(url, user, password);
				PreparedStatement pst = conn.prepareStatement(query);
				pst.setInt(1, pid);
				row = pst.executeUpdate();
				
				if (row > 0) {
					response.sendRedirect("admin.jsp");
				} else {
					response.sendRedirect("admin.jsp");
				}
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
	}

}
