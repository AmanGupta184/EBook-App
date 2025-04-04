package com.user.servlet;

import java.io.*;
import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import com.DAO.UserDAOImpl;
import com.DB.DBConnect;
import com.entity.User;

@WebServlet("/update_profile")
public class UpdateProfile extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public UpdateProfile() {
		super();
	}

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		try {
			int id = Integer.parseInt(request.getParameter("id"));
			String name = request.getParameter("fname");
			String email = request.getParameter("email");
			String phone = request.getParameter("phone");
			String password = request.getParameter("password");
			User us=new User();
			us.setId(id);
			us.setName(name);
			us.setPhone(phone);
			us.setEmail(email);
			UserDAOImpl dao=new UserDAOImpl(DBConnect.getCon());
			HttpSession session=request.getSession();
			boolean f=dao.checkPassword(id, password);
			if(f) {
				boolean f2=dao.updateProfile(us);
				if(f2) {
					session.setAttribute("succMsg", "Profile Update Successfully");
					response.sendRedirect("edit_profile.jsp");
				}else {
					session.setAttribute("failMsg", "Something went wrong on server");
					response.sendRedirect("edit_profile.jsp");
				}
			}else {
				session.setAttribute("failMsg", "Your password is incorrect");
				response.sendRedirect("edit_profile.jsp");
			}
		} catch (Exception e) {
			System.out.println(e);
		}
	}

}
