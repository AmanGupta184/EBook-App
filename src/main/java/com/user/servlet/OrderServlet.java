package com.user.servlet;

import java.io.*;
import java.util.ArrayList;
import java.util.List;
import java.util.Random;
import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import com.DAO.CartDAOImpl;
import com.DAO.OrderDAOImpl;
import com.DB.DBConnect;
import com.entity.BookOrder;
import com.entity.Cart;

@WebServlet("/order")
public class OrderServlet extends HttpServlet {

	private static final long serialVersionUID = 1L;

	public OrderServlet() {
		super();
	}

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		try {
			int id = Integer.parseInt(request.getParameter("id"));
			String name = request.getParameter("username");
			String email = request.getParameter("email");
			String phone = request.getParameter("phone");
			String address = request.getParameter("address");
			String landmark = request.getParameter("landmark");
			String city = request.getParameter("city");
			String state = request.getParameter("state");
			String pincode = request.getParameter("pincode");
			String paymentType = request.getParameter("payment");

			String fullAddress = address + "," + landmark + "," + city + "," + state + "," + pincode;

			HttpSession session = request.getSession();

			CartDAOImpl dao = new CartDAOImpl(DBConnect.getCon());
			OrderDAOImpl dao2 = new OrderDAOImpl(DBConnect.getCon());
			ArrayList<BookOrder> orderList = new ArrayList<BookOrder>();

			List<Cart> list = dao.getBookByUser(id);
			int i = dao2.getOrderNo();
			if (list.isEmpty()) {

				session.setAttribute("failMsg", "Add items in your cart");
				response.sendRedirect("checkout.jsp");
			}
			if ("NoSelect".equals(list)) {
				session.setAttribute("failMsg", "Please select payment type");
				response.sendRedirect("checkout.jsp");
			}
				BookOrder o = null;
				Random r = new Random();

				for (Cart c : list) {
					o = new BookOrder();
					o.setOrder_id("BOOk-ORD-00" + r.nextInt(100000));
					o.setUser_name(name);
					o.setEmail(email);
					o.setPhone(phone);
					o.setFullAddress(fullAddress);
					o.setBook_name(c.getBookName());
					o.setAuthor(c.getAuthor());
					o.setPrice(c.getPrice() + "");
					o.setPayment(paymentType);
					orderList.add(o);
					i++;
				}
				boolean f = dao2.saveOrder(orderList);
				if (f) {
					response.sendRedirect("OrderSuccess.jsp");
				} else {
					session.setAttribute("failMsg", "Order Failed..");
					response.sendRedirect("checkout.jsp");
				}

		} catch (Exception e) {
			System.out.println(e);
		}
	}

}
