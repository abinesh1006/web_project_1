package com;

import java.io.IOException;
import java.io.FileInputStream;
import java.io.UnsupportedEncodingException;
import java.math.BigInteger;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
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

		String firstName = null;
		String lastName = null;
		String email = null;
		long mobileNumber = 0;
		String password = null;
		userBean be = new userBean();
		String otp_cast = null;

		if (request.getParameter("action").equals("Register")) {
			firstName = request.getParameter("firstName");
			lastName = request.getParameter("lastName");
			email = request.getParameter("email");
			mobileNumber = Long.parseLong(request.getParameter("mobileNumber"));
			password = request.getParameter("password");
			dao f = new dao();
			try {
				int check = f.Checkuser(email);
				if (check == 1) {
					HttpSession session = request.getSession();
					session.setAttribute("login_messgae", "E-Mail already registered ...Please Login...");
					response.sendRedirect(".#!/login");
					return;
				}
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}

			Random rand = new Random();
			int otp1 = 1054360 + rand.nextInt(900000);
			otpSender.sendmail(otp1);
			be.setPassword(password);

			otp_cast = Integer.toString(otp1);

			be.setFirstName(firstName);
			be.setLastName(lastName);
			be.setEmail(email);
			be.setMobileNumber(mobileNumber);

			HttpSession session = request.getSession();
			session.setAttribute("otp", otp_cast);
			session.setAttribute("user", be);
			session.setAttribute("signup", "signup_session");
			session.setAttribute("message", "Please enter the otp sent to the email.....");
			session.setAttribute("userName", be.getFirstName());
			response.sendRedirect(".#!otp");
		}
		String userId = null;
		String passWord = null;

		if (request.getParameter("action").equals("Login")) {

			userId = request.getParameter("username");
			passWord = request.getParameter("password");

			dao f = new dao();
			try {
				int check = f.Checkuser(userId);
				if (check == 1) {
					be = f.login(userId, passWord);
					if (null != be) {
						
						HttpSession session = request.getSession();
						session.setAttribute("login_user", be);
						session.setAttribute("userSession", "true");
						response.sendRedirect(".#!/index");
						
			
					}
					else
					{
						HttpSession session = request.getSession();
						session.setAttribute("login_messgae", "Invalid Credentials or Account Not Exists");
						response.sendRedirect(".#!/login");
					}
				} else {
					HttpSession session = request.getSession();
					session.setAttribute("login_messgae", "Invalid Credentials or Account Not Exists");
					response.sendRedirect(".#!/login");
				}
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}

	}
}
