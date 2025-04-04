package com.admin.servlet;

import java.io.*;
import javax.servlet.*;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

import com.DAO.BookDAOImpl;
import com.DB.DBConnect;
import com.entity.BookDetail;

@WebServlet("/add_books")
@MultipartConfig
public class BooksAdd extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public BooksAdd() {
		super();
	}

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		try {
			String bookName = request.getParameter("bname");
			String author = request.getParameter("author");
			String price = request.getParameter("price");
			String bookCategory = request.getParameter("bookCategory");
			String category = request.getParameter("category");
			String status = request.getParameter("status");
			Part part = request.getPart("img");
			String fileName = part.getSubmittedFileName();
			BookDetail b = new BookDetail(bookName, author, price, bookCategory, category, status, fileName,
					"amangupta184@outllok.com", "8369929536");
			BookDAOImpl dao = new BookDAOImpl(DBConnect.getCon());
			boolean f = dao.addBooks(b);

			HttpSession session = request.getSession();
			if (f) {
				String uploadPath = "C:\\Users\\amang\\eclipse-workspace\\EBook-App\\src\\main\\webapp\\bookImages";
				File file = new File(uploadPath);
				part.write(file + file.separator + fileName);
				session.setAttribute("succMsg", "Book Added Successsfully");
				response.sendRedirect("admin/add_books.jsp");
			} else {
				session.setAttribute("failMsg", "Something wrong on server");
				response.sendRedirect("admin/add_books.jsp");
			}
		} catch (Exception e) {
			System.out.println(e);
		}
	}

}
