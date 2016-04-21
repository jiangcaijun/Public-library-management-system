package com.app.service;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.FileSystemXmlApplicationContext;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.app.dao.UserDAO;
import com.app.model.User;


@Service
@Transactional
public class UserService {
	@Autowired
	private UserDAO userDAO;
	
	@Transactional(propagation = Propagation.REQUIRED)
	public void save(User user) {
		userDAO.save(user);
	}
	@Transactional(propagation = Propagation.REQUIRED)
	public void update(User user) {
		userDAO.update(user);
	}
	public void delete(User user) {
		userDAO.delete(user);
	}
	@Transactional(propagation = Propagation.REQUIRED)
	public Map list(int page, int rows) {
		return userDAO.queryByHQL(page, rows);
	}
	@Transactional(propagation = Propagation.REQUIRED)
	public Boolean findone(User user) {
		return userDAO.findOne(user);
	}
	@Transactional(propagation = Propagation.REQUIRED)
	public List<User> findone_front_login(User user) {
		return userDAO.findOne_front_login(user);
	}
	@Transactional(propagation = Propagation.REQUIRED)
	public List<User> findone_admin_login(User user) {
		return userDAO.findOne_admin_login(user);
	}
	@Transactional(propagation = Propagation.REQUIRED)
	public boolean update_front_login_1(User user) {
		if( userDAO.findOne_front_login_1(user)){
			String idCard = (userDAO.findByusername(user.getUsername())).get(0).getIdCard();
			System.out.println("忘记密码，查找到的idCard为*********"+idCard);
			userDAO.updatePassword(idCard,user.getUsername());
			return true;
		}
		return false;
	}
	@Transactional(propagation = Propagation.REQUIRED)
	public boolean update_front_myData(String password,String username) {
		userDAO.updatePassword2(password,username);
		return true;
	}
	@Transactional(propagation = Propagation.REQUIRED)
	public boolean findOnelogin(String username,String password) {
		return userDAO.findOnelogin(username,password);
	}
	
}
