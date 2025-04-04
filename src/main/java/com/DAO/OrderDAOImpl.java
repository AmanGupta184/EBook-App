package com.DAO;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

import com.entity.BookOrder;

public class OrderDAOImpl implements OrderDAO {
	private Connection con;

	public OrderDAOImpl(Connection con) {
		super();
		this.con = con;
	}

	@Override
	public int getOrderNo() {
		int i=1;
		try {
			String sql="select * from book_order";
			PreparedStatement ps=con.prepareStatement(sql);
			ResultSet rs=ps.executeQuery();
			while(rs.next()) {
				i++;
			}
		} catch (Exception e) {
			System.out.println(e);
		}
		return i;
	}

	@Override
	public boolean saveOrder(List<BookOrder> list) {
		boolean f = false;
		try {
			String sql = "insert into book_order(order_id,user_name,email,address,phone,book_name,author,price,paymentType)values(?,?,?,?,?,?,?,?,?)";
			con.setAutoCommit(false);
			PreparedStatement ps = con.prepareStatement(sql);
			for (BookOrder b : list) {
				ps.setString(1, b.getOrder_id());
				ps.setString(2, b.getUser_name());
				ps.setString(3, b.getEmail());
				ps.setString(4, b.getFullAddress());
				ps.setString(5, b.getPhone());
				ps.setString(6, b.getBook_name());
				ps.setString(7, b.getAuthor());
				ps.setString(8, b.getPrice());
				ps.setString(9, b.getPayment());
				ps.addBatch();
			}
			int[] count = ps.executeBatch();
			con.commit();
			f=true;
			con.setAutoCommit(true);

		} catch (Exception e) {
			System.out.println(e);
		}
		return f;
	}

	@Override
	public List<BookOrder> getBook(String email) {
		List<BookOrder> list=new ArrayList<BookOrder>();
		BookOrder o=null;
		try {
			String sql="select * from book_order where email=?";
			PreparedStatement ps=con.prepareStatement(sql);
			ps.setString(1, email);
			ResultSet rs=ps.executeQuery();
			while(rs.next()) {
				o=new BookOrder();
				o.setId(rs.getInt(1));
				o.setOrder_id(rs.getString(2));
				o.setUser_name(rs.getString(3));
				o.setEmail(rs.getString(4));
				o.setFullAddress(rs.getString(5));
				o.setPhone(rs.getString(6));
				o.setBook_name(rs.getString(7));
				o.setAuthor(rs.getString(8));
				o.setPrice(rs.getString(9));
				o.setPayment(rs.getString(10));
				list.add(o);
			}
		} catch (Exception e) {
			System.out.println(e);
		}
		return list;
	}

	@Override
	public List<BookOrder> getAllOrderedBook() {
		List<BookOrder> list=new ArrayList<BookOrder>();
		BookOrder o=null;
		try {
			String sql="select * from book_order";
			PreparedStatement ps=con.prepareStatement(sql);
			ResultSet rs=ps.executeQuery();
			while(rs.next()) {
				o=new BookOrder();
				o.setId(rs.getInt(1));
				o.setOrder_id(rs.getString(2));
				o.setUser_name(rs.getString(3));
				o.setEmail(rs.getString(4));
				o.setFullAddress(rs.getString(5));
				o.setPhone(rs.getString(6));
				o.setBook_name(rs.getString(7));
				o.setAuthor(rs.getString(8));
				o.setPrice(rs.getString(9));
				o.setPayment(rs.getString(10));
				list.add(o);
			}
		} catch (Exception e) {
			System.out.println(e);
		}
		return list;
	}

}
