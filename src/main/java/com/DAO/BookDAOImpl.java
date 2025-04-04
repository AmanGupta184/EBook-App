package com.DAO;

import com.entity.BookDetail;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class BookDAOImpl implements BookDAO {

	private Connection con;

	public BookDAOImpl(Connection con) {
		super();
		this.con = con;
	}

	@Override
	public boolean addBooks(BookDetail b) {
		boolean f = false;
		try {
			String sql = "insert into book_detail(bookName,author,price,bookCategory,category,status,photo,userEmail,phone)values(?,?,?,?,?,?,?,?,?)";
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setString(1, b.getBookName());
			ps.setString(2, b.getAuthor());
			ps.setString(3, b.getPrice());
			ps.setString(4, b.getBookCategory());
			ps.setString(5, b.getCategory());
			ps.setString(6, b.getStatus());
			ps.setString(7, b.getPhoto());
			ps.setString(8, b.getUserEmail());
			ps.setString(9, b.getPhone());
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
	public List<BookDetail> getAllBooks() {
		List<BookDetail> list = new ArrayList<BookDetail>();
		BookDetail b = null;
		try {
			String sql = "select * from book_detail";
			PreparedStatement ps = con.prepareStatement(sql);
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				b = new BookDetail();
				b.setBookId(rs.getInt(1));
				b.setBookName(rs.getString(2));
				b.setAuthor(rs.getString(3));
				b.setPrice(rs.getString(4));
				b.setBookCategory(rs.getString(5));
				b.setCategory(rs.getString(6));
				b.setStatus(rs.getString(7));
				b.setPhoto(rs.getString(8));
				b.setUserEmail(rs.getString(9));
				b.setPhone(rs.getString(10));
				list.add(b);
			}
		} catch (Exception e) {
			System.out.println(e);
		}
		return list;
	}

	@Override
	public BookDetail getBookById(int id) {
		BookDetail b = null;
		try {
			String sql = "select * from book_detail where bookId=?";
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setInt(1, id);
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				b = new BookDetail();
				b.setBookId(rs.getInt(1));
				b.setBookName(rs.getString(2));
				b.setAuthor(rs.getString(3));
				b.setPrice(rs.getString(4));
				b.setBookCategory(rs.getString(5));
				b.setCategory(rs.getString(6));
				b.setStatus(rs.getString(7));
				b.setPhoto(rs.getString(8));
				b.setUserEmail(rs.getString(9));
				b.setPhone(rs.getString(10));
			}
		} catch (Exception e) {
			System.out.println(e);
		}
		return b;
	}

	@Override
	public boolean updateEditBooks(BookDetail b) {
		boolean f = false;
		try {
			String sql = "update book_detail set bookName=?,author=?,price=?,status=? where bookId=?";
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setString(1, b.getBookName());
			ps.setString(2, b.getAuthor());
			ps.setString(3, b.getPrice());
			ps.setString(4, b.getStatus());
			ps.setInt(5, b.getBookId());
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
	public boolean deleteBooks(int id) {
		boolean f = false;
		try {
			String sql = "delete from book_detail where bookId=?";
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setInt(1, id);
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
	public List<BookDetail> getRecentBooks() {
		List<BookDetail> list = new ArrayList<BookDetail>();
		BookDetail b = null;
		try {
			String sql = "select * from book_detail where status=? order by bookId DESC";
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setString(1, "Active");
			ResultSet rs = ps.executeQuery();
			int i = 1;
			while (rs.next() && i <= 4) {
				b = new BookDetail();
				b.setBookId(rs.getInt(1));
				b.setBookName(rs.getString(2));
				b.setAuthor(rs.getString(3));
				b.setPrice(rs.getString(4));
				b.setBookCategory(rs.getString(5));
				b.setCategory(rs.getString(6));
				b.setStatus(rs.getString(7));
				b.setPhoto(rs.getString(8));
				b.setUserEmail(rs.getString(9));
				b.setPhone(rs.getString(10));
				list.add(b);
				i++;
			}
		} catch (Exception e) {
			System.out.println(e);
		}
		return list;
	}

	@Override
	public List<BookDetail> getTextBooks() {
		List<BookDetail> list = new ArrayList<BookDetail>();
		BookDetail b = null;
		try {
			String sql = "select * from book_detail where bookCategory=? and status=? order by bookId DESC";
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setString(1, "TextBook");
			ps.setString(2, "Active");
			ResultSet rs = ps.executeQuery();
			int i = 1;
			while (rs.next() && i <= 4) {
				b = new BookDetail();
				b.setBookId(rs.getInt(1));
				b.setBookName(rs.getString(2));
				b.setAuthor(rs.getString(3));
				b.setPrice(rs.getString(4));
				b.setBookCategory(rs.getString(5));
				b.setCategory(rs.getString(6));
				b.setStatus(rs.getString(7));
				b.setPhoto(rs.getString(8));
				b.setUserEmail(rs.getString(9));
				b.setPhone(rs.getString(10));
				list.add(b);
				i++;
			}
		} catch (Exception e) {
			System.out.println(e);
		}
		return list;
	}

	@Override
	public List<BookDetail> getStoryBooks() {
		List<BookDetail> list = new ArrayList<BookDetail>();
		BookDetail b = null;
		try {
			String sql = "select * from book_detail where bookCategory=? and status=? order by bookId DESC";
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setString(1, "Story");
			ps.setString(2, "Active");
			ResultSet rs = ps.executeQuery();
			int i = 1;
			while (rs.next() && i <= 4) {
				b = new BookDetail();
				b.setBookId(rs.getInt(1));
				b.setBookName(rs.getString(2));
				b.setAuthor(rs.getString(3));
				b.setPrice(rs.getString(4));
				b.setBookCategory(rs.getString(5));
				b.setCategory(rs.getString(6));
				b.setStatus(rs.getString(7));
				b.setPhoto(rs.getString(8));
				b.setUserEmail(rs.getString(9));
				b.setPhone(rs.getString(10));
				list.add(b);
				i++;
			}
		} catch (Exception e) {
			System.out.println(e);
		}
		return list;
	}

	@Override
	public List<BookDetail> getNovelBooks() {
		List<BookDetail> list = new ArrayList<BookDetail>();
		BookDetail b = null;
		try {
			String sql = "select * from book_detail where bookCategory=? and status=? order by bookId DESC";
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setString(1, "Novel");
			ps.setString(2, "Active");
			ResultSet rs = ps.executeQuery();
			int i = 1;
			while (rs.next() && i <= 4) {
				b = new BookDetail();
				b.setBookId(rs.getInt(1));
				b.setBookName(rs.getString(2));
				b.setAuthor(rs.getString(3));
				b.setPrice(rs.getString(4));
				b.setBookCategory(rs.getString(5));
				b.setCategory(rs.getString(6));
				b.setStatus(rs.getString(7));
				b.setPhoto(rs.getString(8));
				b.setUserEmail(rs.getString(9));
				b.setPhone(rs.getString(10));
				list.add(b);
				i++;
			}
		} catch (Exception e) {
			System.out.println(e);
		}
		return list;
	}
	
	@Override
	public List<BookDetail> getPracticalManual() {
		List<BookDetail> list = new ArrayList<BookDetail>();
		BookDetail b = null;
		try {
			String sql = "select * from book_detail where bookCategory=? and status=? order by bookId DESC";
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setString(1, "Manual");
			ps.setString(2, "Active");
			ResultSet rs = ps.executeQuery();
			int i = 1;
			while (rs.next() && i <= 4) {
				b = new BookDetail();
				b.setBookId(rs.getInt(1));
				b.setBookName(rs.getString(2));
				b.setAuthor(rs.getString(3));
				b.setPrice(rs.getString(4));
				b.setBookCategory(rs.getString(5));
				b.setCategory(rs.getString(6));
				b.setStatus(rs.getString(7));
				b.setPhoto(rs.getString(8));
				b.setUserEmail(rs.getString(9));
				b.setPhone(rs.getString(10));
				list.add(b);
				i++;
			}
		} catch (Exception e) {
			System.out.println(e);
		}
		return list;
	}
	@Override
	public List<BookDetail> getAnimeManga() {
		List<BookDetail> list = new ArrayList<BookDetail>();
		BookDetail b = null;
		try {
			String sql = "select * from book_detail where bookCategory=? and status=? order by bookId DESC";
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setString(1, "Anime");
			ps.setString(2, "Active");
			ResultSet rs = ps.executeQuery();
			int i = 1;
			while (rs.next() && i <= 4) {
				b = new BookDetail();
				b.setBookId(rs.getInt(1));
				b.setBookName(rs.getString(2));
				b.setAuthor(rs.getString(3));
				b.setPrice(rs.getString(4));
				b.setBookCategory(rs.getString(5));
				b.setCategory(rs.getString(6));
				b.setStatus(rs.getString(7));
				b.setPhoto(rs.getString(8));
				b.setUserEmail(rs.getString(9));
				b.setPhone(rs.getString(10));
				list.add(b);
				i++;
			}
		} catch (Exception e) {
			System.out.println(e);
		}
		return list;
	}
	
	@Override
	public List<BookDetail> getAllRecentBooks() {
		List<BookDetail> list = new ArrayList<BookDetail>();
		BookDetail b = null;
		try {
			String sql = "select * from book_detail where status=? order by bookId DESC";
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setString(1, "Active");
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				b = new BookDetail();
				b.setBookId(rs.getInt(1));
				b.setBookName(rs.getString(2));
				b.setAuthor(rs.getString(3));
				b.setPrice(rs.getString(4));
				b.setBookCategory(rs.getString(5));
				b.setCategory(rs.getString(6));
				b.setStatus(rs.getString(7));
				b.setPhoto(rs.getString(8));
				b.setUserEmail(rs.getString(9));
				b.setPhone(rs.getString(10));
				list.add(b);
			}
		} catch (Exception e) {
			System.out.println(e);
		}
		return list;
	}

	@Override
	public List<BookDetail> getAllTextBooks() {
		List<BookDetail> list = new ArrayList<BookDetail>();
		BookDetail b = null;
		try {
			String sql = "select * from book_detail where bookCategory=? and status=? order by bookId DESC";
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setString(1, "TextBook");
			ps.setString(2, "Active");
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				b = new BookDetail();
				b.setBookId(rs.getInt(1));
				b.setBookName(rs.getString(2));
				b.setAuthor(rs.getString(3));
				b.setPrice(rs.getString(4));
				b.setBookCategory(rs.getString(5));
				b.setCategory(rs.getString(6));
				b.setStatus(rs.getString(7));
				b.setPhoto(rs.getString(8));
				b.setUserEmail(rs.getString(9));
				b.setPhone(rs.getString(10));
				list.add(b);
			}
		} catch (Exception e) {
			System.out.println(e);
		}
		return list;
	}

	@Override
	public List<BookDetail> getAllStoryBooks() {
		List<BookDetail> list = new ArrayList<BookDetail>();
		BookDetail b = null;
		try {
			String sql = "select * from book_detail where bookCategory=? and status=? order by bookId DESC";
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setString(1, "Story");
			ps.setString(2, "Active");
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				b = new BookDetail();
				b.setBookId(rs.getInt(1));
				b.setBookName(rs.getString(2));
				b.setAuthor(rs.getString(3));
				b.setPrice(rs.getString(4));
				b.setBookCategory(rs.getString(5));
				b.setCategory(rs.getString(6));
				b.setStatus(rs.getString(7));
				b.setPhoto(rs.getString(8));
				b.setUserEmail(rs.getString(9));
				b.setPhone(rs.getString(10));
				list.add(b);
			}
		} catch (Exception e) {
			System.out.println(e);
		}
		return list;
	}
	
	@Override
	public List<BookDetail> getAllNovelBooks() {
		List<BookDetail> list = new ArrayList<BookDetail>();
		BookDetail b = null;
		try {
			String sql = "select * from book_detail where bookCategory=? and status=? order by bookId DESC";
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setString(1, "Novel");
			ps.setString(2, "Active");
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				b = new BookDetail();
				b.setBookId(rs.getInt(1));
				b.setBookName(rs.getString(2));
				b.setAuthor(rs.getString(3));
				b.setPrice(rs.getString(4));
				b.setBookCategory(rs.getString(5));
				b.setCategory(rs.getString(6));
				b.setStatus(rs.getString(7));
				b.setPhoto(rs.getString(8));
				b.setUserEmail(rs.getString(9));
				b.setPhone(rs.getString(10));
				list.add(b);
			}
		} catch (Exception e) {
			System.out.println(e);
		}
		return list;
	}
	
	@Override
	public List<BookDetail> getAllPracticalManual() {
		List<BookDetail> list = new ArrayList<BookDetail>();
		BookDetail b = null;
		try {
			String sql = "select * from book_detail where bookCategory=? and status=? order by bookId DESC";
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setString(1, "Manual");
			ps.setString(2, "Active");
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				b = new BookDetail();
				b.setBookId(rs.getInt(1));
				b.setBookName(rs.getString(2));
				b.setAuthor(rs.getString(3));
				b.setPrice(rs.getString(4));
				b.setBookCategory(rs.getString(5));
				b.setCategory(rs.getString(6));
				b.setStatus(rs.getString(7));
				b.setPhoto(rs.getString(8));
				b.setUserEmail(rs.getString(9));
				b.setPhone(rs.getString(10));
				list.add(b);
			}
		} catch (Exception e) {
			System.out.println(e);
		}
		return list;
	}
	@Override
	public List<BookDetail> getAllAnimeManga() {
		List<BookDetail> list = new ArrayList<BookDetail>();
		BookDetail b = null;
		try {
			String sql = "select * from book_detail where bookCategory=? and status=? order by bookId DESC";
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setString(1, "Anime");
			ps.setString(2, "Active");
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				b = new BookDetail();
				b.setBookId(rs.getInt(1));
				b.setBookName(rs.getString(2));
				b.setAuthor(rs.getString(3));
				b.setPrice(rs.getString(4));
				b.setBookCategory(rs.getString(5));
				b.setCategory(rs.getString(6));
				b.setStatus(rs.getString(7));
				b.setPhoto(rs.getString(8));
				b.setUserEmail(rs.getString(9));
				b.setPhone(rs.getString(10));
				list.add(b);
			}
		} catch (Exception e) {
			System.out.println(e);
		}
		return list;
	}
	
	@Override
	public List<BookDetail> getBookByOld(String userEmail, String category) {
		List<BookDetail> list = new ArrayList<BookDetail>();
		BookDetail b = null;
		try {
			String sql = "select * from book_detail where category=? and userEmail=?";
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setString(1, category);
			ps.setString(2, userEmail);
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				b = new BookDetail();
				b.setBookId(rs.getInt(1));
				b.setBookName(rs.getString(2));
				b.setAuthor(rs.getString(3));
				b.setPrice(rs.getString(4));
				b.setBookCategory(rs.getString(5));
				b.setCategory(rs.getString(6));
				b.setStatus(rs.getString(7));
				b.setPhoto(rs.getString(8));
				b.setUserEmail(rs.getString(9));
				b.setPhone(rs.getString(10));
				list.add(b);
			}
		} catch (Exception e) {
			System.out.println(e);
		}
		return list;
	}

	@Override
	public boolean oldBookDelete(String userEmail, String category, int bookId) {
		boolean f = false;
		try {
			String sql = "delete from book_detail where userEmail=? and bookCategory=? and bookId=?";
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setString(1, userEmail);
			ps.setString(2, category);
			ps.setInt(3, bookId);
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
	public List<BookDetail> getBookBySearch(String ch) {
		List<BookDetail> list = new ArrayList<BookDetail>();
		BookDetail b = null;
		try {
			String sql = "select * from book_detail where bookName like ? or author like ? or bookCategory like ? and status=?";
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setString(1, "%" + ch + "%");
			ps.setString(2, "%" + ch + "%");
			ps.setString(3, "%" + ch + "%");
			ps.setString(4, "Active");
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				b.setBookId(rs.getInt(1));
				b.setBookName(rs.getString(2));
				b.setAuthor(rs.getString(3));
				b.setPrice(rs.getString(4));
				b.setBookCategory(rs.getString(5));
				b.setCategory(rs.getString(6));
				b.setStatus(rs.getString(7));
				b.setPhoto(rs.getString(8));
				b.setUserEmail(rs.getString(9));
				b.setPhone(rs.getString(10));
				list.add(b);
			}
		} catch (Exception e) {
			System.out.println(e);
		}
		return list;
	}

}
