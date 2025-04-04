package com.user.servlet;

import java.io.*;
import javax.servlet.*;
import javax.servlet.annotation.*;
import javax.servlet.http.*;

@WebServlet("/logout")
public class LogoutServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public LogoutServlet() {
		super();
	}

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		try {
			HttpSession session=request.getSession();
			session.removeAttribute("userobj");
			
			HttpSession session2=request.getSession();
			session2.setAttribute("succMsg","Logout Successfully");
			response.sendRedirect("login.jsp");
		} catch (Exception e) {
			System.out.println(e);
		}
	}

}
