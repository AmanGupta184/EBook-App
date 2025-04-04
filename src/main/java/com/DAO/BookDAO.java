package com.DAO;

import java.util.List;
import com.entity.BookDetail;

public interface BookDAO {

	public boolean addBooks(BookDetail b);

	public List<BookDetail> getAllBooks();

	public BookDetail getBookById(int id);

	public boolean updateEditBooks(BookDetail b);

	public boolean deleteBooks(int id);

	public List<BookDetail> getRecentBooks();

	public List<BookDetail> getTextBooks();

	public List<BookDetail> getStoryBooks();

	public List<BookDetail> getNovelBooks();

	public List<BookDetail> getPracticalManual();

	public List<BookDetail> getAnimeManga();

	public List<BookDetail> getAllRecentBooks();

	public List<BookDetail> getAllTextBooks();

	public List<BookDetail> getAllStoryBooks();

	public List<BookDetail> getAllNovelBooks();

	public List<BookDetail> getAllAnimeManga();

	public List<BookDetail> getAllPracticalManual();

	public List<BookDetail> getBookByOld(String userEmail, String category);

	public boolean oldBookDelete(String userEmail, String category, int bookId);

	public List<BookDetail> getBookBySearch(String ch);
}
