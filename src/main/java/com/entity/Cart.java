package com.entity;

public class Cart {
	private int cartId;
	private int bookId;
	private int userId;
	private String bookName;
	private String author;
	private Double price;
	private Double totalPrice;

	public Cart() {
		super();
	}

	public Cart(int cartId, int bookId, int userId, String bookName, String author, Double price, Double totalPrice) {
		super();
		this.cartId = cartId;
		this.bookId = bookId;
		this.userId = userId;
		this.bookName = bookName;
		this.author = author;
		this.price = price;
		this.totalPrice = totalPrice;
	}

	public int getCartId() {
		return cartId;
	}

	public void setCartId(int cartId) {
		this.cartId = cartId;
	}

	public int getBookId() {
		return bookId;
	}

	public void setBookId(int bookId) {
		this.bookId = bookId;
	}

	public int getUserId() {
		return userId;
	}

	public void setUserId(int userId) {
		this.userId = userId;
	}

	public String getBookName() {
		return bookName;
	}

	public void setBookName(String bookName) {
		this.bookName = bookName;
	}

	public String getAuthor() {
		return author;
	}

	public void setAuthor(String author) {
		this.author = author;
	}

	public Double getPrice() {
		return price;
	}

	public void setPrice(Double price) {
		this.price = price;
	}

	public Double getTotalPrice() {
		return totalPrice;
	}

	public void setTotalPrice(Double totalPrice) {
		this.totalPrice = totalPrice;
	}

	@Override
	public String toString() {
		return "Cart [cartId=" + cartId + ", bookId=" + bookId + ", userId=" + userId + ", bookName=" + bookName
				+ ", author=" + author + ", price=" + price + ", totalPrice=" + totalPrice + "]";
	}
	
}
