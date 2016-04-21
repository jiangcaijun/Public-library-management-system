package com.app.service;

import java.util.Date;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.app.dao.ApplyDAO;
import com.app.dao.BookDAO;
import com.app.model.Apply;
import com.app.model.Book;
import com.app.model.Borrow;

@Service
@Transactional
public class ApplyService {
	@Autowired
	private BookDAO bookDAO;
	@Autowired
	private ApplyDAO applyDAO;
	
	@Transactional(propagation = Propagation.REQUIRED)
	public String save(Apply apply,String username) {
		System.out.println("apply.getBookName()==============="+apply.getBookName());
		if(bookDAO.findOneByBookName(apply.getBookName()).size()!=0){
			System.out.println("该书实际上存在**********");
			if(bookDAO.findAllByBookNameSize(apply.getBookName()).equals("0")){
				System.out.println("该书当前库存为零**********");
				Date date = new Date();
				apply.setApplyTime(date);
				apply.setBookName(apply.getBookName());
				apply.setStatus(0);
				apply.setUsername(username);
				if(applyDAO.findAllByBookNameSize(apply.getBookName(),username).equals("0")){
					applyDAO.save(apply);
					return "d";
				}
				return "c";
				}
			System.out.println("该书当前库存不为零**********");
			return "b";
		}
		return "a";
	}
	
	@Transactional(propagation = Propagation.REQUIRED)
	public Map list(int page, int rows) {
		return applyDAO.queryApply(page, rows);
	}
	
	@Transactional(propagation = Propagation.REQUIRED)
	public List findAllApplyByBookName(String bookName,String username) {
		List<Apply> list = applyDAO.findAllApplyByBookName(bookName,username);
		return list;
	}
}
