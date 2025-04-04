package com.user.servlet;

import java.io.*;
import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import com.DAO.UserDAOImpl;
import com.DB.DBConnect;
import com.entity.User;

@WebServlet("/login")
public class LoginServlet extends HttpServlet {

	private static final long serialVersionUID = 1L;

	public LoginServlet() {
		super();
	}

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		try {
			UserDAOImpl dao=new UserDAOImpl(DBConnect.getCon());
			HttpSession session=request.getSession();
			String email=request.getParameter("email");
			String password=request.getParameter("password");
			if("amangupta184@outlook.com".equals(email)&&"Amansg@173273".equals(password)) {
				User us=new User();
				us.setName("Admin");
				session.setAttribute("userobj",us);
				response.sendRedirect("admin/home.jsp");
			}else {
				User us=dao.login(email, password);
				if(us!=null) {
					session.setAttribute("userobj",us);
					response.sendRedirect("index.jsp");
				}else {
					session.setAttribute("failMsg","Email & Password invalid");
					response.sendRedirect("login.jsp");
				}
			}
		} catch (Exception e) {
			System.out.println(e);
		}
	}

}
