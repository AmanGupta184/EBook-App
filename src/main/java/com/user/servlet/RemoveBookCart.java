package com.user.servlet;

import java.io.*;
import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import com.DAO.CartDAOImpl;
import com.DB.DBConnect;

@WebServlet("/removeBook")
public class RemoveBookCart extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public RemoveBookCart() {
        super();
    }

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			int bookId=Integer.parseInt(request.getParameter("bid"));
			int userId=Integer.parseInt(request.getParameter("uid"));
			int cartId=Integer.parseInt(request.getParameter("cid"));
			CartDAOImpl dao=new CartDAOImpl(DBConnect.getCon());
			boolean f=dao.deleteBook(bookId,userId,cartId);
			HttpSession session=request.getSession();
			if(f) {
				session.setAttribute("succMsg","Delete Book Successfully");
				response.sendRedirect("checkout.jsp");
			}else {
				session.setAttribute("failMsg","something wrong on server");
				response.sendRedirect("checkout.jsp");
			}
		} catch (Exception e) {
			System.out.println(e);
		}
	}
    
}
