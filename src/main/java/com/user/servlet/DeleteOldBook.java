package com.user.servlet;

import java.io.*;
import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

import com.DAO.BookDAOImpl;
import com.DB.DBConnect;

@WebServlet("/delete_old_book")
public class DeleteOldBook extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public DeleteOldBook() {
		super();
	}

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		try {
			String userEmail = request.getParameter("email");
			int bookId=Integer.parseInt(request.getParameter("bid"));
			BookDAOImpl dao = new BookDAOImpl(DBConnect.getCon());
			boolean f = dao.oldBookDelete(userEmail, "Old",bookId);
			HttpSession session = request.getSession();
			if (f) {
				session.setAttribute("succMsg", "Delete Old Book Successfully");
				response.sendRedirect("old_book.jsp");
			} else {
				session.setAttribute("failMsg", "something wrong on server");
				response.sendRedirect("old_book.jsp");
			}
		} catch (Exception e) {
			System.out.println(e);
		}
	}

}
