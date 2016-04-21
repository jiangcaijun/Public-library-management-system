package com.app.dao;

import java.util.Date;
import java.util.List;

import javax.annotation.Resource;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.cfg.Configuration;
import org.springframework.stereotype.Repository;

import com.app.model.Book;
import com.app.model.User;

@Repository
public class BookDAO {
	static SessionFactory sessionFactory;

	static {
		Configuration cfg = new Configuration();
		sessionFactory = cfg.configure().buildSessionFactory();
	}
	@Resource(name = "sessionFactory")
	public void setSuperSessionFactory(SessionFactory sessionFactory) {
		this.sessionFactory = sessionFactory;
	}
	public void updateBook_1_0(String id){
		Session session = sessionFactory.getCurrentSession();
		session.createQuery("update Book set status = 0 where id =?").setParameter(0,id).executeUpdate();
	}
	public void updateBook_0_1(String id){
		Session session = sessionFactory.getCurrentSession();
		session.createQuery("update Book set status = 1 where id =?").setParameter(0,id).executeUpdate();
	}
	
	public Boolean findBookId(String bookId) {
		Session session = sessionFactory.getCurrentSession();
		Query query = session.createQuery("from Book where status = 1 and deleteTime is null and id =?").setParameter(0,bookId);
		if (query.list().size() != 0) {
			return true;
		}else{
		return false;}
	}
	
	/**front页面的  bookName 查询
	 * @param bookName
	 * @return
	 */
	@SuppressWarnings("unchecked")
	public List<Book> findAllBookByBookName(String bookName) {
		List<Book> list = sessionFactory.getCurrentSession().createQuery("from Book where deleteTime is null and bookName like '%"+bookName+"%' group by bookName").list();
		System.out.println("查到书籍数目为"+list.size());
		return list;
	}
	/** admin/tabBook页面的 bookName 查询
	 * @param bookName
	 * @return
	 */
	@SuppressWarnings("unchecked")
	public List<Book> findAllBookByBookName2(String bookName) {
		List<Book> list = sessionFactory.getCurrentSession().createQuery("from Book where bookName like '%"+bookName+"%' order by bookName asc").list();
		System.out.println("查到书籍数目为"+list.size());
		return list;
	}
	/**“个人中心”的“我要预约”界面
	 * @param bookName
	 * @return
	 */
	@SuppressWarnings("unchecked")
	public List<Book> findAllBookByBookName3(String bookName) {
		List<Book> list = sessionFactory.getCurrentSession().createQuery("from Book where status = 1 and bookName = ?").setParameter(0,bookName).list();
		return list;
	}
	/**管理员，借还书查询
	 * @param id
	 * @return
	 */
	@SuppressWarnings("unchecked")
	public String findAllById4(String id) {
		List<Book> list = sessionFactory.getCurrentSession().createQuery("from Book where id = ?").setParameter(0,id).list();
		return list.get(0).getBookName();
	}
	/** front/reBorrow页面的 bookName 查询
	 * @param bookName
	 * @return
	 */
	@SuppressWarnings("unchecked")
	public List<Book> findReborrowByBookName(String bookName) {
		List<Book> list = sessionFactory.getCurrentSession().createQuery("from Book where bookName like '%"+bookName+"%' order by bookName asc").list();
		System.out.println("查到书籍数目为"+list.size());
		return list;
	}

	/**查询 某一个 bookName
	 * @param bookName
	 * @return
	 */
	
	public List findOneByBookName(String bookName) {
		List<Book> list = sessionFactory.getCurrentSession().createQuery("from Book where bookName = ? group by bookName").setParameter(0,bookName).list();
		System.out.println("根据这个bookName，查到数据条数"+list.size());
		return list;
	}
	
	/**查询这本书还有多少册
	 * @param bookName
	 * @return
	 */
	public String findAllByBookNameSize(String bookName) {		
		Session session = sessionFactory.getCurrentSession();
		Query query = session.createQuery("from Book where deleteTime is null and status = 1 and bookName =?").setParameter(0,bookName);
		System.out.println("这本书还有***************************************"+query.list().size()+"册");
		return (""+query.list().size());
	}
	
	/**front页面的  theme 查询
	 * @param theme
	 * @return
	 */
	public List<Book> findAllBookByTheme(String theme) {
		List<Book> list = sessionFactory.getCurrentSession().createQuery("from Book where deleteTime is null and theme like '%"+theme+"%' group by bookName").list();
		System.out.println("查到书籍数目为"+list.size());
		return list;
	}

	/**front页面的  autor 查询
	 * @param autor
	 * @return
	 */
	public List<Book> findAllBookByAutor(String autor) {
		System.out.println("findAllBookByAutor*****************************");
		List<Book> list = sessionFactory.getCurrentSession().createQuery("from Book where deleteTime is null and autor like '%"+autor+"%' group by bookName").list();
		return list;
	}
	/**新书上架，查找书籍唯一标识是否已存在
	 * @param bookId
	 * @return
	 */
	public Boolean findBookId2(String bookId) {
		Session session = sessionFactory.getCurrentSession();
		Query query = session.createQuery("from Book where id =? and deleteTime is null").setParameter(0,bookId);
		if (query.list().size() != 0) {
			return true;
		}else{
		return false;}
	}
	/**新书上架
	 * @param book
	 */
	@SuppressWarnings("unchecked")
	public void save(Book book) {
		Session session = sessionFactory.getCurrentSession();
		session.save(book);
	}
	/**旧书下架
	 * @param bookId
	 * @return
	 */
	public Boolean findBookId3(String id) {
		Session session = sessionFactory.getCurrentSession();
		Query query = session.createQuery("from Book where deleteTime is null and id =?").setParameter(0,id);
		if (query.list().size() != 0) {
			return true;
		}else{
		return false;}
	}
	/**旧书下架
	 * @param id
	 */
	public void updateDeleteTime(String id) {
		Session session = sessionFactory.getCurrentSession();		
		Date date = new Date();
		Query query = session.createQuery("update Book set deleteTime = ? where id = ?");
		query.setParameter(0, date);
		query.setParameter(1, id);
		query.executeUpdate();
	}
}
