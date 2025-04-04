package com.DAO;

import java.sql.*;

import com.entity.User;

public class UserDAOImpl implements UserDAO {
	private Connection con;

	public UserDAOImpl(Connection con) {
		super();
		this.con = con;
	}

	@Override
	public boolean userRegister(User us) {
		boolean f = false;
		try {
			String sql = "insert into user(name,email,phone,password) values(?,?,?,?)";
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setString(1, us.getName());
			ps.setString(2, us.getEmail());
			ps.setString(3, us.getPhone());
			ps.setString(4, us.getPassword());
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
	public User login(String email, String password) {
		User us = null;
		try {
			String sql = "select * from user where email=? and password=?";
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setString(1, email);
			ps.setString(2, password);
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				us = new User();
				us.setId(rs.getInt(1));
				us.setName(rs.getString(2));
				us.setEmail(rs.getString(3));
				us.setPhone(rs.getString(4));
				us.setPassword(rs.getString(5));
			}
		} catch (Exception e) {
			System.out.println(e);
		}
		return us;
	}

	@Override
	public boolean checkPassword(int id, String password) {
		boolean f = false;
		try {
			String sql = "select * from user where id=? and password=?";
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setInt(1, id);
			ps.setString(2, password);
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				f = true;
			}
		} catch (Exception e) {
			System.out.println(e);
		}
		return f;
	}

	@Override
	public boolean updateProfile(User us) {
		boolean f = false;
		try {
			String sql = "update user set name=?,email=?,phone=? where id=?";
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setString(1, us.getName());
			ps.setString(2, us.getEmail());
			ps.setString(3, us.getPhone());
			ps.setInt(4, us.getId());
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
	public boolean checkUser(String email) {
		boolean f = true;
		try {
			String sql = "select * from user where email=?";
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setString(1, email);
			ResultSet rs=ps.executeQuery();
			while(rs.next()) {
				f=false;
			}
		} catch (Exception e) {
			System.out.println(e);
		}
		return f;
	}

}
