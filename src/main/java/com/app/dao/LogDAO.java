package com.app.dao;

import java.util.List;

import javax.annotation.Resource;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.stereotype.Repository;

import com.app.model.Log;

@Repository
public class LogDAO {
	@Resource
	SessionFactory sessionFactory;
	
	public Boolean save(Log log) {
		Session session = sessionFactory.getCurrentSession();
		try {
			session.save(log);
			return true;	
		} catch (Exception e) {
			return false;
		}	
	}
	@SuppressWarnings("unchecked")
	public List<Log> findAllLog(String operate) {
		List<Log> list = sessionFactory.getCurrentSession().createQuery("from Log where operate like '%"+operate+"%' order by createTime desc").list();
		return list;
	}
}
