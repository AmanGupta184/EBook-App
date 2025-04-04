package com.DAO;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

import com.entity.Cart;

public class CartDAOImpl implements CartDAO {
	private Connection con;

	public CartDAOImpl(Connection con) {
		super();
		this.con = con;
	}

	@Override
	public boolean addCart(Cart c) {
		boolean f = false;
		try {
			String sql = "insert into cart(bookId,userId,bookName,author,price,totalPrice)values(?,?,?,?,?,?)";
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setInt(1, c.getBookId());
			ps.setInt(2, c.getUserId());
			ps.setString(3, c.getBookName());
			ps.setString(4, c.getAuthor());
			ps.setDouble(5, c.getPrice());
			ps.setDouble(6, c.getTotalPrice());
			int i = ps.executeUpdate();
			if (i == 1) {
				f = true;
			}
		} catch (Exception e) {
			System.out.println(e);
		}
		return f;
	}

	@Override
	public List<Cart> getBookByUser(int userId) {
		List<Cart> list = new ArrayList<Cart>();
		Cart c = null;
		double totalPrice = 0;
		try {
			String sql = "select * from cart where userId=?";
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setInt(1, userId);
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				c = new Cart();
				c.setCartId(rs.getInt(1));
				c.setBookId(rs.getInt(2));
				c.setUserId(rs.getInt(3));
				c.setBookName(rs.getString(4));
				c.setAuthor(rs.getString(5));
				c.setPrice(rs.getDouble(6));
				totalPrice = totalPrice + rs.getDouble(7);
				c.setTotalPrice(totalPrice);
				list.add(c);
			}

		} catch (Exception e) {
			System.out.println(e);
		}
		return list;
	}

	@Override
	public boolean deleteBook(int bookId, int userId,int cartId) {
		boolean f = false;
		try {
			String sql = "delete from cart where bookId=? and userId=? and cartId=?";
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setInt(1, bookId);
			ps.setInt(2, userId);
			ps.setInt(3, cartId);
			int i = ps.executeUpdate();
			if (i == 1) {
				f = true;
			}

		} catch (Exception e) {
			System.out.println(e);
		}
		return f;
	}

}
