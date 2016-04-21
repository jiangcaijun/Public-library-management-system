package com.app.dao;

import java.io.Serializable;
import java.util.HashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;
import javax.annotation.Resource;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.cfg.Configuration;
import org.hibernate.stat.Statistics;
import org.hibernate.validator.constraints.Email;
import org.springframework.stereotype.Repository;

import com.app.model.Book;
import com.app.model.Borrow;
import com.app.model.User;

import jdk.nashorn.internal.objects.annotations.Where;

@Repository
public class UserDAO {// extends HibernateDaoSupport {
	static SessionFactory sessionFactory;

	static {
		Configuration cfg = new Configuration();
		sessionFactory = cfg.configure().buildSessionFactory();
	}
	/*
	SessionFactory sessionFactory;
	static Configuration cfg = new Configuration();
	static SessionFactory sessionf = cfg.configure().buildSessionFactory();
*/
	@Resource(name = "sessionFactory")
	public void setSuperSessionFactory(SessionFactory sessionFactory) {
		this.sessionFactory = sessionFactory;
	}

	public void save(User user) {
		Session session = sessionFactory.getCurrentSession();
		session.save(user);
		// session.close();
	}

	public void delete(User user) {
		Session session = sessionFactory.getCurrentSession();
		session.delete(user);
		// session.close();
	}

	// /admin/index.jsp
	public Boolean findOne(User user) {
		Session session = sessionFactory.getCurrentSession();
		Query query = session.createSQLQuery("select * from user where auth= 1 and username= '" + user.getUsername()
				+ "' and password='" + user.getPassword() + "'");
		/*Query query = session.createSQLQuery("select * from user");*/
		if (query.list().size() != 0) {
			return true;
		}else{
		return false;}
	}
	
	/**  对应front/index的用户 “登录”
	 * @param user
	 * @return
	 */
	public List<User> findOne_front_login(User user) {
		List<User> list = sessionFactory.getCurrentSession().createQuery("from User where auth= 0 and username= '" + user.getUsername()
				+ "' and password='" + user.getPassword() + "'").list();
		return list;
	}
	/**  对应admin/login 的管理员登录
	 * @param user
	 * @return
	 */
	public List<User> findOne_admin_login(User user) {
		List<User> list = sessionFactory.getCurrentSession().createQuery("from User where auth= 1 and username= '" + user.getUsername()
				+ "' and password='" + user.getPassword() + "'").list();
		return list;
	}
	/**  对应front/index的用户 “忘记密码”
	 * @param user
	 * @return
	 */
	public Boolean findOne_front_login_1(User user) {
		System.out.println("忘记密码user.getUsername()*****************="+user.getUsername());
		Session session = sessionFactory.getCurrentSession();
		Query query = session.createQuery("from User where auth= 0 and username= ? and idCard = ?");
		query.setParameter(0, user.getUsername());
		query.setParameter(1, user.getIdCard());
		if (query.list().size() != 0) {
			return true;
		}else{
		return false;}
	}
	
	/**查找username对应的身份证idCard,与resetPassword()配合使用
	 * @param username
	 * @return
	 */
	@SuppressWarnings("unchecked")
	public List<User> findByusername(String username) {
		List<User> list = sessionFactory.getCurrentSession().createQuery("from User where username = ?").setParameter(0, username).list();
		return list;
	}
	/**以身份证  后六位来做密码
	 * @param user
	 * @return
	 */
	public void updatePassword(String idCard,String username){
		Session session = sessionFactory.getCurrentSession();
		int n=6;
		String password=idCard.substring(idCard.length()-n,idCard.length());
		String hql = "update User set password = '"+password+"' where username = '"+username+"'";
		System.out.println("hql*********************"+hql);
		Query query = session.createQuery(hql);
		query.executeUpdate();

	}
	/**个人中心的修改密码
	 * @param user
	 * @return
	 */
	public void updatePassword2(String password,String username){
		Session session = sessionFactory.getCurrentSession();
		String hql = "update User set password = '"+password+"' where username = '"+username+"'";
		System.out.println("hql*********************"+hql);
		Query query = session.createQuery(hql);
		query.executeUpdate();

	}
	/**个人中心的修改密码
	 * @param user
	 * @return
	 */
	public Boolean findOnelogin(String username,String password) {
		List<User> list = sessionFactory.getCurrentSession().createQuery("from User where auth= 0 and username= '" + username
				+ "' and password='" + password + "'").list();
		if (list.size() != 0) {
			return true;
		}else{
		return false;}
	}
	public Boolean findOneByEmail(String email) {
		Session session = sessionFactory.getCurrentSession();
		Query query = session.createSQLQuery("select * from user where email= '" + email + "'");

		if (query.list().size() != 0) {
			return true;
		}
		return false;
	}

	public void update(User user) {
		// TODO Auto-generated method stub
		
	}

	public Map queryByHQL(int page, int rows) {
		// TODO Auto-generated method stub
		return null;
	}
	
	public Boolean findUsername(String username) {
		Session session = sessionFactory.getCurrentSession();
		
		Query query = session.createQuery("from User where username = ?").setParameter(0,username);
		System.out.println("findUsername ,query.list().size()="+query.list().size());
		if (query.list().size() != 0) {
			return true;
		}else{
		return false;}
	}

}
