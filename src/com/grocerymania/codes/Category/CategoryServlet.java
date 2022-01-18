package com.grocerymania.codes.Category;


import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class CategoryServlet
 */
@WebServlet("/AddCat")
public class CategoryServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
    private CategoryDao cdao;
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CategoryServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see Servlet#init(ServletConfig)
	 */
	public void init(ServletConfig config) throws ServletException {
		// TODO Auto-generated method stub
		cdao = new CategoryDao();
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
		int resultCat = 0;
		String catname = request.getParameter("cname");
		String catdesc = request.getParameter("cdesc");
		
		Category c = new Category();
		c.setCategoryName(catname);
		c.setCategoryDesc(catdesc);
		
		try {
			resultCat = cdao.AddCatgory(c);
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		if (resultCat > 0) {
			out.println("<script>alert('Category Added Sucessfully!');</script>");
		} else {
			out.println("<script>alert('Category not Added!');</script>");
		}
	}

}
