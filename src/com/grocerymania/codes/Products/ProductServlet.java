package com.grocerymania.codes.Products;


//import java.io.File;
//import java.io.FileOutputStream;
import java.io.File;
import java.io.IOException;
//import java.io.OutputStream;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
//import java.sql.ResultSet;

import javax.servlet.RequestDispatcher;
//import javax.servlet.RequestDispatcher;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

/**
 * Servlet implementation class ProductServlet
 */
@WebServlet("/AddProduct")
@MultipartConfig(fileSizeThreshold=1024*1024*2, 
maxFileSize=1024*1024*10, 
maxRequestSize=1024*1024*50)
public class ProductServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	//private ProductsDao pdao;
   
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ProductServlet() {
        super();
        // TODO Auto-generated constructor stub
       // pdao = new ProductsDao();
    }

	/**
	 * @see Servlet#init(ServletConfig)
	 */
	public void init(ServletConfig config) throws ServletException {
		// TODO Auto-generated method stub
		
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
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		PrintWriter out = response.getWriter();
		String pname = request.getParameter("pname");
		int price = Integer.parseInt(request.getParameter("price"));
		int catid = Integer.parseInt(request.getParameter("cat"));
		String pdesc = request.getParameter("pdesc");
		
		Part part = request.getPart("pimage");
		
		String image = extractFilePath(part);
		String savepath = "C:\\Users\\Aniket\\Desktop\\Archies\\GROCERYMANIA\\WebContent\\Images" + File.separator + image;
		@SuppressWarnings("unused")
		File filesaveDir = new File(savepath);
		part.write(savepath + File.separator);
		
		try {
			Class.forName("com.mysql.jdbc.Driver");
			Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/grocerymania","root","pass123");
			PreparedStatement pst = conn.prepareStatement("insert into products(pname,pimage,catid,price,pdesc) values(?,?,?,?,?);");
			pst.setString(1, pname);
			pst.setString(2, image);
			pst.setInt(3, catid);
			pst.setInt(4, price);
			pst.setString(5, pdesc);
			int row = 0;
			 row = pst.executeUpdate();
			if (row > 0) {
				response.sendRedirect("admin.jsp");
			}else {
				out.println("<script>alert('Product Adding failed!');</script>");
				RequestDispatcher rd = request.getRequestDispatcher("admin.jsp");
				rd.include(request, response);
			}
			
			} catch (Exception e) {
			// TODO: handle exception
		}
		
		

		
	}
	private String extractFilePath(Part part) {
		String contextDisp = part.getHeader("content-disposition");
		String[] items = contextDisp.split(";");
		for(String s : items) {
			if (s.trim().startsWith("filename")) {
				return s.substring(s.indexOf("=")+ 2,s.length() - 1);
			}
		}
		return "";
	}
}

