package com.app.dao;

import java.util.ArrayList;
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

import com.app.model.Apply;
import com.app.model.Book;
import com.app.model.Borrow;

@Repository
public class ApplyDAO {
	
	@Resource
	SessionFactory sessionFactory;
	
	public Boolean save(Apply apply) {
		Session session = sessionFactory.getCurrentSession();
		try {
			session.save(apply);
			return true;	
		} catch (Exception e) {
			System.out.println("报错：ApplyDAO.save方法无法正常插入数据********");
			return false;
		}
		
	}
	/**查询该bookName是否已预约且未取消预约
	 * @param bookName
	 * @return
	 */
	public String findAllByBookNameSize(String bookName,String username) {		
		Session session = sessionFactory.getCurrentSession();
		Query query = session.createQuery("from Apply where status = 0 and bookName =? and username = ?");
		query.setParameter(0,bookName);
		query.setParameter(1,username);
		return (""+query.list().size());
	}

	@SuppressWarnings("unchecked")
	public Map<String, Object> queryAdminBorrow(int page, int rows) {
		Map<String, Object> map = new HashMap<String, Object>();
		Session session = sessionFactory.getCurrentSession();
		int limitBegin = (page - 1) * rows;
		List<Apply> list = session.createQuery("from Apply where ").setFirstResult(limitBegin).setMaxResults(rows).list();
		long total = (Long) session.createQuery("select count(*) from Borrow").uniqueResult();
		map.put("total", total);
		map.put("rows", list);
		return map;
	}
	
	/**用于  个人中心  的   书籍预约   中的easyui
	 * @param page
	 * @param rows
	 * @return
	 */
	@SuppressWarnings("unchecked")
	public Map<String, Object> queryApply(int page, int rows) {
		Map<String, Object> map = new HashMap<String, Object>();
		Session session = sessionFactory.getCurrentSession();
		int limitBegin = (page - 1) * rows;
		List<Apply> list = session.createQuery("from Apply ").setFirstResult(limitBegin).setMaxResults(rows).list();
		long total = (Long) session.createQuery("select count(*) from Apply").uniqueResult();
		map.put("total", total);
		map.put("rows", list);
		return map;
	}
	/**根据书名，查找apply表的所有数据
	 * @param 
	 * @return
	 */
	@SuppressWarnings("unchecked")
	public List<Apply> findAllApplyByBookName(String bookName,String username) {
		List<Apply> list = sessionFactory.getCurrentSession().createQuery("from Apply where bookName like '%"+bookName+"%' and username = '"+username+"'").list();
		return list;
	}
	
}
