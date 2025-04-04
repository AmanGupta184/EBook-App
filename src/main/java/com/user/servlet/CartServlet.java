package com.user.servlet;

import java.io.*;
import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import com.DAO.BookDAOImpl;
import com.DAO.CartDAOImpl;
import com.DB.DBConnect;
import com.entity.BookDetail;
import com.entity.Cart;

@WebServlet("/cart")
public class CartServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public CartServlet() {
		super();
	}

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		try {
			int bookId = Integer.parseInt(request.getParameter("bid"));
			int userId = Integer.parseInt(request.getParameter("uid"));
			BookDAOImpl dao = new BookDAOImpl(DBConnect.getCon());
			BookDetail b = dao.getBookById(bookId);
			Cart c = new Cart();
			c.setBookId(bookId);
			c.setUserId(userId);
			c.setBookName(b.getBookName());
			c.setAuthor(b.getAuthor());
			c.setPrice(Double.parseDouble(b.getPrice()));
			c.setTotalPrice(Double.parseDouble(b.getPrice()));
			CartDAOImpl dao2 = new CartDAOImpl(DBConnect.getCon());
			boolean f = dao2.addCart(c);
			HttpSession session=request.getSession();
			if (f) {
				session.setAttribute("addCart","Book Added to cart");
				response.sendRedirect("index.jsp");
			} else {
				session.setAttribute("failMsg","something wrong on server");
				response.sendRedirect("index.jsp");
			}
		} catch (Exception e) {
			System.out.println(e);
		}
	}

}
