package com.entity;

public class BookOrder {
	private int id;
	private String order_id;
	private String user_name;
	private String email;
	private String phone;
	private String fullAddress;
	private String book_name;
	private String author;
	private String price;
	private String payment;

	public BookOrder() {
		super();
	}

	public BookOrder(int id, String order_id, String user_name, String email, String phone, String fullAddress,
			String book_name, String author, String price, String payment) {
		super();
		this.id = id;
		this.order_id = order_id;
		this.user_name = user_name;
		this.email = email;
		this.phone = phone;
		this.fullAddress = fullAddress;
		this.book_name = book_name;
		this.author = author;
		this.price = price;
		this.payment = payment;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getOrder_id() {
		return order_id;
	}

	public void setOrder_id(String order_id) {
		this.order_id = order_id;
	}

	public String getUser_name() {
		return user_name;
	}

	public void setUser_name(String user_name) {
		this.user_name = user_name;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getFullAddress() {
		return fullAddress;
	}

	public void setFullAddress(String fullAddress) {
		this.fullAddress = fullAddress;
	}

	public String getBook_name() {
		return book_name;
	}

	public void setBook_name(String book_name) {
		this.book_name = book_name;
	}

	public String getAuthor() {
		return author;
	}

	public void setAuthor(String author) {
		this.author = author;
	}

	public String getPrice() {
		return price;
	}

	public void setPrice(String price) {
		this.price = price;
	}

	public String getPayment() {
		return payment;
	}

	public void setPayment(String payment) {
		this.payment = payment;
	}

	@Override
	public String toString() {
		return "BookOrder [id=" + id + ", order_id=" + order_id + ", user_name=" + user_name + ", email=" + email
				+ ", phone=" + phone + ", fullAddress=" + fullAddress + ", book_name=" + book_name + ", author="
				+ author + ", price=" + price + ", payment=" + payment + "]";
	}

}
