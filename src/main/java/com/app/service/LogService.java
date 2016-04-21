package com.app.service;

import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.app.dao.LogDAO;
import com.app.model.Book;
import com.app.model.Log;

@Service
@Transactional
public class LogService {

	@Autowired
	private LogDAO logDAO;
	
	@Transactional(propagation = Propagation.REQUIRED)
	public void returnBook(HttpSession session) {
		System.out.println("LogService日志==============================");
		Log log = new Log();
		log.setUid(session.getAttribute("username1").toString());
		Date date = new Date();
		log.setCreateTime(date);
		log.setOperate("还书");
		logDAO.save(log);
	}
	@Transactional(propagation = Propagation.REQUIRED)
	public List<Log> findAllLog(String operate) {
		List<Log> list = logDAO.findAllLog(operate);
		return list;
	}
}
