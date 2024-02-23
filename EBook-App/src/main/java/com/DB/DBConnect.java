package com.DB;

import java.sql.*;

public class DBConnect {
private static Connection con;
public static Connection getCon() {
	try {
		Class.forName("com.mysql.jdbc.Driver");
		con=DriverManager.getConnection("jdbc:mysql://localhost/ebook-app","root","root");
	}
	catch(Exception e) {
		e.printStackTrace();
	}
	return con;
}
}
