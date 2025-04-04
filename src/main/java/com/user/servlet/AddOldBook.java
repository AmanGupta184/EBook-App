package com.user.servlet;

import java.io.*;
import javax.servlet.*;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import com.DAO.BookDAOImpl;
import com.DB.DBConnect;
import com.entity.BookDetail;

@WebServlet("/add_old_book")
@MultipartConfig
public class AddOldBook extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public AddOldBook() {
		super();

	}

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		try {
			String bookName = request.getParameter("bname");
			String author = request.getParameter("author");
			String price = request.getParameter("price");
			String bookCategory=request.getParameter("bookCategory");
			String category = "Old";
			String status = "Active";
			Part part = request.getPart("image");
			String fileName = part.getSubmittedFileName();
			String userEmail = request.getParameter("user");
			String phone=request.getParameter("phone");

			BookDetail b = new BookDetail(bookName,author,price,bookCategory,category,status,fileName,userEmail,phone);
			BookDAOImpl dao = new BookDAOImpl(DBConnect.getCon());

			boolean f = dao.addBooks(b);
			HttpSession session = request.getSession();
			if (f) {
				String uploadPath="C:\\Users\\amang\\eclipse-workspace\\EBook-App\\src\\main\\webapp\\bookImages";
				File file=new File(uploadPath);
				part.write(file+file.separator+fileName);
				session.setAttribute("succMsg", "Book Added Successsfully");
				response.sendRedirect("sellbook.jsp");
			} else {
				session.setAttribute("failMsg", "Something wrong on server");
				response.sendRedirect("sellbook.jsp");
			}
		} catch (Exception e) {
			System.out.println(e);
		}
	}

}
