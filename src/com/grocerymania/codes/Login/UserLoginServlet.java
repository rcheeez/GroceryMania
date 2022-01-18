package com.grocerymania.codes.Login;


import java.io.IOException;
import java.io.PrintWriter;

//import javax.servlet.RequestDispatcher;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation clas	s UserLoginServlet
 */
@WebServlet("/UserLogin")
public class UserLoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
    private LoginDao ldao;   
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UserLoginServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see Servlet#init(ServletConfig)
	 */
	public void init(ServletConfig config) throws ServletException {
		// TODO Auto-generated method stub
		ldao = new LoginDao();
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
		String eml = request.getParameter("eml");
		String psd = request.getParameter("psd");
		String role = request.getParameter("role");
		//String role = request.getParameter("web");
		HttpSession session = request.getSession();
		LoginUser lu = new LoginUser();
		lu.setEmail(eml);
		lu.setPassword(psd);
		
		try {
			if (ldao.LoginUser(lu)) {
				
				
					session.setAttribute("emailid", lu.getEmail());
					session.setAttribute("pass", lu.getPassword());
					session.setAttribute("role", role);
					out.println("<script>alert('Login Successfull!');</script>");
					response.sendRedirect("Welcome.jsp");
					
				
			} else {
				out.println("<script>alert('Your emailid or password is incorrect!');</script>");
				response.sendRedirect("index.jsp");
			}
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}

}
