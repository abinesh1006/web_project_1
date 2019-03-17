package com;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class submit
 */
public class submit extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public submit() {        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	
		HttpSession session = request.getSession();
		if(session == null){
			response.sendRedirect(".#!/login");
		}
		userBean beeen=new userBean();
		beeen=(userBean) session.getAttribute("user");
		int gen=Integer.parseInt((String) session.getAttribute("otp"));
		int userEnter=Integer.parseInt(request.getParameter("otp_user"));	
		if (gen == userEnter)
		{
			dao f = new dao();
			try {
				if (f.signup(beeen) == 1) {
					session.invalidate();
					response.sendRedirect("success.jsp");
				}
				else
				{
					session.invalidate();
					response.sendRedirect("error.jsp");
					
					
				}

			} catch (ClassNotFoundException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (SQLException e) {
				e.printStackTrace();
				// TODO Auto-generated catch block
				response.sendRedirect("error.jsp");
			}

		}
		else
		{
			session.setAttribute("message","OTP IS INCORRECT");
			response.sendRedirect("./otp.jsp");
		}
		
	}

}
