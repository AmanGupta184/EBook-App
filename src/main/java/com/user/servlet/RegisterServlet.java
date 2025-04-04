package com.user.servlet;

import java.io.*;
import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import com.DAO.UserDAOImpl;
import com.DB.DBConnect;
import com.entity.User;

@WebServlet("/register")
public class RegisterServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public RegisterServlet() {
		super();
	}

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		try {
			String name = request.getParameter("fname");
			String email = request.getParameter("email");
			String phone = request.getParameter("phone");
			String password = request.getParameter("password");
			String check = request.getParameter("check");

			User us = new User();
			us.setName(name);
			us.setEmail(email);
			us.setPhone(phone);
			us.setPassword(password);
			HttpSession session = request.getSession();
			if (check != null) {
				UserDAOImpl dao = new UserDAOImpl(DBConnect.getCon());
				boolean f2 = dao.checkUser(email);
				if (f2) {
					boolean f = dao.userRegister(us);
					if (f) {
						session.setAttribute("succMsg", "Register Successfully");
						response.sendRedirect("register.jsp");
					} else {
						session.setAttribute("failMsg", "Something wrong on server");
						response.sendRedirect("register.jsp");
					}
				} else {
					session.setAttribute("failMsg", "Email already existed");
					response.sendRedirect("register.jsp");
				}
			} else {
				session.setAttribute("failMsg", "please Agree Terms and Conditions");
				response.sendRedirect("register.jsp");
			}

		} catch (Exception e) {
			System.out.println(e);
		}
	}

}
