package com.app.service;

import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.app.dao.BookDAO;
import com.app.dao.LogDAO;
import com.app.model.Apply;
import com.app.model.Book;
import com.app.model.Log;
import com.app.model.User;

@Service
@Transactional
public class BookService {
	@Autowired
	private BookDAO bookDAO;
	@Autowired
	private LogDAO logDAO;
	
	@Transactional(propagation = Propagation.REQUIRED)
	public List findAllByBookName(String bookName) {
		List<Book> list = bookDAO.findAllBookByBookName(bookName);
		return list;
	}
	
	@Transactional(propagation = Propagation.REQUIRED)
	public List findAllByBookName2(String bookName) {
		List<Book> list = bookDAO.findAllBookByBookName2(bookName);
		return list;
	}
	@Transactional(propagation = Propagation.REQUIRED)
	public List findAllByBookName3(String bookName) {
		List<Book> list = bookDAO.findAllBookByBookName3(bookName);
		return list;
	}
	@Transactional(propagation = Propagation.REQUIRED)
	public String findAllById4(String id) {
		return bookDAO.findAllById4(id);
		
	}
	@Transactional(propagation = Propagation.REQUIRED)
	public List findOneByBookName(String bookName) {
		List<Book> list = bookDAO.findOneByBookName(bookName);
		return list;
	}
	@Transactional(propagation = Propagation.REQUIRED)
	public String findAllByBookNameSize(String bookName) {
		String str = bookDAO.findAllByBookNameSize(bookName);
		return str;
	}
	@Transactional(propagation = Propagation.REQUIRED)
	public List findAllByTheme(String theme) {
		List<Book> list = bookDAO.findAllBookByTheme(theme);
		return list;
	}
	@Transactional(propagation = Propagation.REQUIRED)
	public List<Book> findAllByAutor(String autor) {
		List<Book> list = bookDAO.findAllBookByAutor(autor);
		return list;
	}
	@Transactional(propagation = Propagation.REQUIRED)
	public Boolean save(Book book,HttpSession session) {
		if(bookDAO.findBookId2(book.getId())==false){
			
			book.setBookName(book.getBookName());
			book.setAutor(book.getAutor());
			book.setIsbn(book.getIsbn());
			book.setContent(book.getContent());
			book.setSite(book.getSite());
			book.setPress(book.getPress());
			book.setTheme(book.getTheme());
			book.setUid("admin");    //暂定位由 admin 上传
			book.setStatus(1);
			Date date = new Date();
			book.setCreateTime(date);
			book.setId(book.getId());
			book.setBookPic(book.getBookPic());
			bookDAO.save(book);
			//log 日志
			Log log = new Log();
			log.setUid(session.getAttribute("username1").toString());
			Date date1 = new Date();
			log.setCreateTime(date1);
			log.setOperate("对book_id为"+book.getId()+"的书籍 ,执行上架操作");
			logDAO.save(log);
			return true;
		}else{
			return false;
		}
	}
	/**旧书下架
	 * @param book
	 * @return
	 */
	@Transactional(propagation = Propagation.REQUIRED)
	public String updateDeleteTime(Book book,HttpSession session) {
		if(bookDAO.findBookId2(book.getId())==true){
			if(bookDAO.findBookId3(book.getId())==true){
				bookDAO.updateDeleteTime(book.getId());
				//log 日志
				Log log = new Log();
				log.setUid(session.getAttribute("username1").toString());
				Date date1 = new Date();
				log.setCreateTime(date1);
				log.setOperate("对book_id为"+book.getId()+"的书籍 ,执行下架操作");
				logDAO.save(log);
				return "a";
			}else{
				return "b";
			}
		}else{
			return "c";
		}
	}
}
