package com.grocerymania.codes.Register;


import java.io.IOException;
import java.io.PrintWriter;

//import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class UserServlet
 */
@WebServlet("/User")
public class UserServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
    private UserDao udao;
    /**
     * @see HttpServlet#HttpServlet()
     */
    
    public void init() {
    	udao = new UserDao();
    }
    
    public UserServlet() {
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
		int registerUser =0;
		PrintWriter out = response.getWriter();
		String fname = request.getParameter("fname");
		String lname = request.getParameter("lname");
		String email = request.getParameter("e1");
		String conc = request.getParameter("conc");
		String addr = request.getParameter("addr");
		String pass1 = request.getParameter("psd");
		String pass2 = request.getParameter("psd1");
		String role = request.getParameter("role");
		User u = new User();
		u.setfName(fname);
		u.setlName(lname);
		u.setEmailid(email);
		u.setContact(conc);
		u.setAddress(addr);
		u.setPass(pass1);
		
			
		HttpSession session = request.getSession();	
		if (pass1.equals(pass2)) {
			
			try {
				registerUser = udao.registerUser(u);
			} catch (ClassNotFoundException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
			if (registerUser > 0) {
				//request.setAttribute("fname", u.getfName());
				//request.setAttribute("emailid", u.getEmailid());
				//request.setAttribute("contact", u.getContact());
				//request.setAttribute("pass1", u.getPass());
				//request.setAttribute("pass2", u.getConfirmpass());
				
				session.setAttribute("fname", u.getfName());
				session.setAttribute("lname", u.getlName());
				session.setAttribute("contact", u.getContact());
				session.setAttribute("emailid", u.getEmailid());
				session.setAttribute("addr", u.getAddress());
				session.setAttribute("pass", u.getPass());
				session.setAttribute("role", role);
				/*RequestDispatcher rd = request.getRequestDispatcher("Welcome.jsp");
				rd.forward(request, response);*/
				out.println("<script>alert('Registeration Successfull!');</script>");
				response.sendRedirect("Welcome.jsp");
				
		}
			else {
				response.sendRedirect("index.jsp");
			}
			
			
		}else {
			session.setAttribute("role", role);
			response.sendRedirect("index.jsp");
		}
			
			
		
			

  }

}
