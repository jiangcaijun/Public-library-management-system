package com.app.service;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;

import com.app.dao.BookDAO;
import com.app.dao.BorrowAndBookDAO;
import com.app.dao.BorrowDAO;
import com.app.dao.LogDAO;
import com.app.dao.UserDAO;
import com.app.model.Book;
import com.app.model.Borrow;
import com.app.model.BorrowAndBook;
import com.app.model.Log;

@Service
@Transactional
public class BorrowService {
	@Autowired
	private BorrowDAO borrowDAO;
	@Autowired
	private UserDAO userDAO;
	@Autowired
	private BookDAO bookDAO;
	@Autowired
	private BorrowAndBookDAO borrowAndBookDAO;
	@Autowired
	private LogDAO logDAO;

	@Transactional(propagation = Propagation.REQUIRED)
	public String save(Borrow borrow ,HttpSession session) {	
		
		String i="a";

		if (userDAO.findUsername(borrow.getUsername())==true) {	
			if(bookDAO.findBookId(borrow.getBookId())==true){		
				borrow.setUsername(borrow.getUsername());
				borrow.setBookId(borrow.getBookId());
				
				Date date = new Date();
				borrow.setBorrowTime(date);			
				Date willReturnTime = new Date(date.getTime()+(1000*3600*24*20));
				
				borrow.setWillReturnTime(willReturnTime);
				borrow.setStatus(0);
				borrow.setUid(session.getAttribute("username1").toString());
				borrowDAO.save(borrow);
				bookDAO.updateBook_1_0(borrow.getBookId());		
				//log 日志
				Log log = new Log();
				log.setUid(session.getAttribute("username1").toString());
				Date date1 = new Date();
				log.setCreateTime(date1);
				log.setOperate("对book_id为"+borrow.getBookId()+"的书籍 ,执行借书操作");
				logDAO.save(log);
			}else{
				i = "b";		
			}
		}else {
			i = "c";

		}
		return i;
	}

	@Transactional(propagation = Propagation.REQUIRED)
	public void update(Borrow borrow) {
		borrowDAO.update(borrow);
	}
	
	@Transactional(propagation = Propagation.REQUIRED)
	public String saveReturnTime(Borrow borrow,HttpSession session) {
		
		if(borrowDAO.findBorrow2ByBookId(borrow.getBookId())){
			System.out.println("将book 表中的0 改变为 1**************************");
			bookDAO.updateBook_0_1(borrow.getBookId());
			borrowDAO.saveReturnTime(borrow.getBookId());
			//log 日志
			Log log = new Log();
			log.setUid(session.getAttribute("username1").toString());
			Date date1 = new Date();
			log.setCreateTime(date1);
			log.setOperate("对book_id为"+borrow.getBookId()+"的书籍 ,执行还书操作");
			logDAO.save(log);	
			return "b";
		}
		else{
			return "a";
			}
	}
	/**easyui,查找当前已借出书籍
	 * @param page
	 * @param rows
	 * @return
	 */
	@Transactional(propagation = Propagation.REQUIRED)
	public Map list(int page, int rows, String username) {
		//return borrowDAO.queryAdminBorrow(page, rows);
		return borrowAndBookDAO.queryAdminBorrow(page, rows,username);
	}
	@Transactional(propagation = Propagation.REQUIRED)
	public Map list2(int page, int rows) {
		return borrowDAO.queryAdminBorrow2(page, rows);
	}
	/**对应BorrowAndBook,从这个虚拟大bean中查找数据
	 * @param page
	 * @param rows
	 * @return
	 */
	@Transactional(propagation = Propagation.REQUIRED)
	public Map list3(int page, int rows, String username) {
		return borrowAndBookDAO.queryAdminBorrow3(page, rows,username);
	}
	@Transactional(propagation = Propagation.REQUIRED)
	public Map list4(int page, int rows) {
		return borrowAndBookDAO.queryAdminBorrow5(page, rows);
	}
	@Transactional(propagation = Propagation.REQUIRED)
	public Map list6(int page, int rows) {
		return borrowAndBookDAO.queryAdminBorrow6(page, rows);
	}
	/**查找过期书籍的数目
	 * @return
	 */
	@Transactional(propagation = Propagation.REQUIRED)
	public String findSize() {
		return borrowDAO.finSize();
	}

	public List<BorrowAndBook> findAllByBookName3(String bookName) {
		return borrowAndBookDAO.queryFrontReBorrow(bookName);
	}
	
	@Transactional(propagation = Propagation.REQUIRED)
	public List findReborrowByBookName(String username) {
		List<Borrow> list = borrowDAO.findReborrowByBookName(username);
		return list;
	}
	@Transactional(propagation = Propagation.REQUIRED)
	public void update_willReturnTime(String bookId) {
		borrowDAO.update_willReturnTime(bookId);
	}
	@Transactional(propagation = Propagation.REQUIRED)
	public List findAllBorrowByBookId(String bookId) {
		List<Borrow> list = borrowDAO.findAllBorrowByBookId(bookId);
		return list;
	}
	
}
