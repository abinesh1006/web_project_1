package com;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.Random;

import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class Servlet1
 */
public class Servlet1 extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public Servlet1() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub

		String firstName = request.getParameter("firstName");
		String lastName = request.getParameter("lastName");
		String email= request.getParameter("email");
		long mobileNumber=Long.parseLong(request.getParameter("mobileNumber"));
		String password=request.getParameter("password");
	

		userBean be = new userBean();
		be.setFirstName(firstName);
		be.setLastName(lastName);
		be.setEmail(email);
		be.setMobileNumber(mobileNumber);
		be.setPassword(password);
		Random rand=new Random();
		
		int otp1=100000 + rand.nextInt(900000);;
		otpSender.sendmail(otp1);
		String otp_cast =  Integer.toString(otp1);
		
		HttpSession session = request.getSession();
		session.setAttribute("otp",otp_cast);
		session.setAttribute("user",be);
		session.setAttribute("signup","signup_session");
		session.setAttribute("message","PLEASE ENTER OTP SENT TO MOBILE..");
		session.setAttribute("userName",be.getFirstName());
		response.sendRedirect("otp.jsp");
		
			
		
	}

}
