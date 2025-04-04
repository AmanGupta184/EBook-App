package com.admin.servlet;

import java.io.*;
import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

import com.DAO.BookDAOImpl;
import com.DB.DBConnect;

@WebServlet("/delete")
public class DeleteBooks extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public DeleteBooks() {
		super();
	}

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		try {
			int id = Integer.parseInt(request.getParameter("id"));
			BookDAOImpl dao = new BookDAOImpl(DBConnect.getCon());
			HttpSession session=request.getSession();
			boolean f = dao.deleteBooks(id);
			if (f) {
				session.setAttribute("succMsg", "Book Delete Successsfully");
				response.sendRedirect("admin/all_books.jsp");
			} else {
				session.setAttribute("failMsg", "Something wrong on server");
				response.sendRedirect("admin/all_books.jsp");
			}
		} catch (Exception e) {
			System.out.println(e);
		}
	}
}
