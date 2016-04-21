package com.app.dao;

import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.cfg.Configuration;
import org.springframework.stereotype.Repository;

import com.app.model.Book;
import com.app.model.Borrow;
import com.app.model.BorrowAndBook;

@Repository
public class BorrowAndBookDAO {
	
	@Resource
	SessionFactory sessionFactory;
	
	public void save(Borrow borrow) {
		Session session = sessionFactory.getCurrentSession();
		session.save(borrow);
	}	
	
	/**判断 return_time为空，且 book_id 存在
	 * @param bookId
	 * @return
	 */
	public Boolean findBorrow2ByBookId(String bookId) {
		Session session = sessionFactory.getCurrentSession();
		Query query = session.createQuery("from Borrow where returnTime is null and bookId=?").setParameter(0,bookId);
		if (query.list().size() != 0) {
			return true;
		}else{
		return false;}
	}
	public void updateBorrow2Status_0_1(String bookId) {
		Session session = sessionFactory.getCurrentSession();
		session.createQuery("update Borrow set status = 1 where bookId =?").setParameter(0,bookId).executeUpdate();
	}

	public void update(Borrow borrow) {
		Session session = sessionFactory.getCurrentSession();
		session.update(borrow);
	}

	public Borrow findOne(Long id) {
		Session session = sessionFactory.getCurrentSession();
		Borrow borrow = (Borrow) session.load(Borrow.class, id);
		return borrow;
	}

	/**读者当前正在手上的，即当前正在借阅的图书
	 * @param page
	 * @param rows
	 * @return
	 */
	@SuppressWarnings("unchecked")
	public Map<String, Object> queryAdminBorrow(int page, int rows, String username) {
		Map<String, Object> map = new HashMap<String, Object>();
		Session session = sessionFactory.getCurrentSession();
		int limitBegin = (page - 1) * rows;
		List<BorrowAndBook> list = session.createSQLQuery("select * from borrow as a left join book as b on a.book_id = b.id where return_time is null and username = '"+username+"'").addEntity(BorrowAndBook.class).setFirstResult(limitBegin).setMaxResults(rows).list();
		long total = (Long) session.createQuery("select count(*) from BorrowAndBook").uniqueResult();
		map.put("total", total);
		map.put("rows", list);
		return map;
	}
	
	/**还书列表展示，其中return_time 有值 ，Borrow表
	 * @param page
	 * @param rows
	 * @return
	 */
	@SuppressWarnings("unchecked")
	public Map<String, Object> queryAdminBorrow2(int page, int rows) {
		Map<String, Object> map = new HashMap<String, Object>();
		Session session = sessionFactory.getCurrentSession();
		int limitBegin = (page - 1) * rows;
		List<Borrow> list = session.createQuery("from Borrow where isnull(returnTime) is false").setFirstResult(limitBegin).setMaxResults(rows).list();
		long total = (Long) session.createQuery("select count(*) from Borrow").uniqueResult();
		map.put("total", total);
		map.put("rows", list);
		return map;
	}
	/**已归还图书列表展示，其中return_time 有值，BorrowAndBook表
	 * @param page
	 * @param rows
	 * @return
	 */
	@SuppressWarnings("unchecked")
	public Map<String, Object> queryAdminBorrow3(int page, int rows, String username) {
		Map<String, Object> map = new HashMap<String, Object>();
		Session session = sessionFactory.getCurrentSession();
		int limitBegin = (page - 1) * rows;
		List<BorrowAndBook> list = session.createSQLQuery("select * from borrow as a left join book as b on a.book_id = b.id where isnull(return_time) is false and username = '"+username+"'").addEntity(BorrowAndBook.class).setFirstResult(limitBegin).setMaxResults(rows).list();
		System.out.println("here**********************");
		long total = (Long) session.createQuery("select count(*) from BorrowAndBook").uniqueResult();
		map.put("total", total);
		map.put("rows", list);
		return map;
	}
	/**还书，添加return_time 字段
	 * @param bookId
	 */
	public void saveReturnTime(String bookId) {
		Session session = sessionFactory.getCurrentSession();
		Date date = new Date();
		Query query = session.createQuery("update Borrow set returnTime = ? where bookId = ?");
		query.setParameter(0, date);
		query.setParameter(1, bookId);
		query.executeUpdate();
		System.out.println("还书，添加return_time 字段,*************bookId="+bookId);
	}
	/**读者已经归还的书籍，即return_time不为空
	 * @param page
	 * @param rows
	 * @return
	 */
	@SuppressWarnings("unchecked")
	public Map<String, Object> queryAdminBorrow4(int page, int rows) {
		Map<String, Object> map = new HashMap<String, Object>();
		Session session = sessionFactory.getCurrentSession();
		int limitBegin = (page - 1) * rows;
		List<BorrowAndBook> list = session.createSQLQuery("select * from borrow as a left join book as b on a.book_id = b.id where isnull(return_time) is false").addEntity(BorrowAndBook.class).setFirstResult(limitBegin).setMaxResults(rows).list();
		long total = (Long) session.createQuery("select count(*) from BorrowAndBook").uniqueResult();
		map.put("total", total);
		map.put("rows", list);
		return map;
	}
	/**超期未归还的书籍，即date < will_return_time,且return_time is null
	 * @param page
	 * @param rows
	 * @return
	 */
	@SuppressWarnings("unchecked")
	public Map<String, Object> queryAdminBorrow5(int page, int rows) {
		Map<String, Object> map = new HashMap<String, Object>();
		Session session = sessionFactory.getCurrentSession();
		int limitBegin = (page - 1) * rows;
		List<BorrowAndBook> list = session.createSQLQuery("select * from borrow as a left join book as b on a.book_id = b.id where DATE_FORMAT(a.will_return_time,'Y% m% d%') < CURDATE() and return_time is null").addEntity(BorrowAndBook.class).setFirstResult(limitBegin).setMaxResults(rows).list();
		long total = (Long) session.createQuery("select count(*) from BorrowAndBook").uniqueResult();
		map.put("total", total);
		map.put("rows", list);
		return map;
	}
	/**未超期且未归还的书籍，即date > will_return_time,且isnull(returnTime) is false
	 * @param page
	 * @param rows
	 * @return
	 */
	@SuppressWarnings("unchecked")
	public Map<String, Object> queryAdminBorrow6(int page, int rows) {
		Map<String, Object> map = new HashMap<String, Object>();
		Session session = sessionFactory.getCurrentSession();
		int limitBegin = (page - 1) * rows;
		List<BorrowAndBook> list = session.createSQLQuery("select * from borrow as a left join book as b on a.book_id = b.id where DATE_FORMAT(a.will_return_time,'Y% m% d%') > CURDATE() and isnull(returnTime) is false").addEntity(BorrowAndBook.class).setFirstResult(limitBegin).setMaxResults(rows).list();
		long total = (Long) session.createQuery("select count(*) from BorrowAndBook").uniqueResult();
		map.put("total", total);
		map.put("rows", list);
		return map;
	}
	/** front/reBorrow 页面的 bookName 查询
	 * @param bookName
	 * @return
	 */
	@SuppressWarnings("unchecked")
	public List<BorrowAndBook> queryFrontReBorrow(String bookName) {
		List<BorrowAndBook> list = sessionFactory.getCurrentSession().createSQLQuery("select * from borrow as a left join book as b on a.book_id = b.id where a.will_return_time < now() and a.return_time is null and ").list();
		return list;
	}
}
