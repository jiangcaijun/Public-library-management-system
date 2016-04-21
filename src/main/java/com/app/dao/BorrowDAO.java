package com.app.dao;

import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.cfg.Configuration;
import org.springframework.stereotype.Repository;

import com.app.model.Book;
import com.app.model.Borrow;

@Repository
public class BorrowDAO {

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
		Query query = session.createQuery("from Borrow where returnTime is null and bookId=?").setParameter(0, bookId);
		if (query.list().size() != 0) {
			return true;
		} else {
			return false;
		}
	}

	public void updateBorrow2Status_0_1(String bookId) {
		Session session = sessionFactory.getCurrentSession();
		session.createQuery("update Borrow set status = 1 where bookId =?").setParameter(0, bookId).executeUpdate();
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

	/**个人中心的借阅查询
	 * @param page
	 * @param rows
	 * @return
	 */
	@SuppressWarnings("unchecked")
	public Map<String, Object> queryAdminBorrow(int page, int rows) {
		Map<String, Object> map = new HashMap<String, Object>();
		Session session = sessionFactory.getCurrentSession();
		int limitBegin = (page - 1) * rows;
		List<Borrow> list = session.createQuery("from Borrow where returnTime is null").setFirstResult(limitBegin)
				.setMaxResults(rows).list();
		long total = (Long) session.createQuery("select count(*) from Borrow").uniqueResult();
		map.put("total", total);
		map.put("rows", list);
		return map;
	}


	/**	还书列表展示，其中return_time 有值
	 * @param page
	 * @param rows
	 * @return
	 */
	@SuppressWarnings("unchecked")
	public Map<String, Object> queryAdminBorrow2(int page, int rows) {
		Map<String, Object> map = new HashMap<String, Object>();
		Session session = sessionFactory.getCurrentSession();
		int limitBegin = (page - 1) * rows;
		List<Borrow> list = session.createQuery("from Borrow where isnull(returnTime) is false")
				.setFirstResult(limitBegin).setMaxResults(rows).list();
		long total = (Long) session.createQuery("select count(*) from Borrow").uniqueResult();
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
		System.out.println("还书，添加return_time 字段,*************bookId=" + bookId);
	}

	/**
	 * 查询已超期的书籍
	 * 
	 * @param bookId
	 */
	public List saveReturnTime() {
		Session session = sessionFactory.getCurrentSession();
		List<Borrow> list = session
				.createQuery("from borrow as a where DATE_FORMAT(a.willReturnTime,'Y% m% d%') > CURDATE()")
				.list();
		return list;
	}

	public String finSize() {
		Session session = sessionFactory.getCurrentSession();
		System.out.println("findSize()****************************88");
		List<Borrow> list = session
				.createQuery("from borrow as a where DATE_FORMAT(a.willReturnTime,'Y% m% d%') > CURDATE() and returnTime is null")
				.list();
		return ""+list.size();
	}

	/** front/reBorrow页面的 bookName 查询
	 * @param bookName
	 * @return
	 */
	@SuppressWarnings("unchecked")
	public List<Borrow> findReborrowByBookName(String username) {
		/*List<Borrow> list = sessionFactory.getCurrentSession().createQuery("from Borrow where willReturnTime < now() and returnTime is null").list();*/
		List<Borrow> list = sessionFactory.getCurrentSession().createQuery("from Borrow where returnTime is null and username = ?").setParameter(0, username).list();
		return list;
	}
	/**续借操作
	 * @param id
	 */
	@SuppressWarnings("unchecked")
	public void update_willReturnTime(String bookId){
		Session session = sessionFactory.getCurrentSession();
		
		System.out.println("wakkakakakaka");
		Calendar c = Calendar.getInstance();
		c.setTime(new Date());
		
		c.add(Calendar.DATE,20);
		Query query = session.createQuery("update Borrow set status = 1, willReturnTime = ? where bookId = ?");
		query.setTimestamp(0,c.getTime());
		
		System.out.println("c.getTime()====="+c.get(Calendar.HOUR));
		System.out.println("c.getTime()====="+c.get(Calendar.MINUTE));
		System.out.println("c.getTime()====="+c.get(Calendar.SECOND));
		query.setParameter(1,bookId);
		query.executeUpdate();
	}
	
	/*根据bookId查找所有的borrow表
	 * @param bookName
	 * @return
	 */
	@SuppressWarnings("unchecked")
	public List<Borrow> findAllBorrowByBookId(String bookId) {
		List<Borrow> list = sessionFactory.getCurrentSession().createQuery("from Borrow where bookId like '%"+bookId+"%' order by borrowTime desc").list();
		return list;
	}
}
