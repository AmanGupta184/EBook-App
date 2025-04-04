package com.admin.servlet;

import java.io.*;
import javax.servlet.*;
import javax.servlet.annotation.*;
import javax.servlet.http.*;

import com.DAO.BookDAOImpl;
import com.DB.DBConnect;
import com.entity.BookDetail;

@WebServlet("/editbooks")
public class EditBooks extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public EditBooks() {
		super();
	}

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		try {
			int id = Integer.parseInt(request.getParameter("id"));
			String bookName = request.getParameter("bname");
			String author = request.getParameter("author");
			String price = request.getParameter("price");
			String status = request.getParameter("status");
			BookDetail b = new BookDetail();
			b.setBookId(id);
			b.setBookName(bookName);
			b.setAuthor(author);
			b.setPrice(price);
			b.setStatus(status);
			BookDAOImpl dao = new BookDAOImpl(DBConnect.getCon());
			HttpSession session = request.getSession();
			boolean f = dao.updateEditBooks(b);
			if (f) {
				session.setAttribute("succMsg", "Book Updated Successsfully");
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
