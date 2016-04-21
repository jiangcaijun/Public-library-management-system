package com.app.controller.admin;

import java.security.NoSuchAlgorithmException;
import java.util.HashMap;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.app.model.Borrow;
import com.app.model.User;
import com.app.service.BorrowService;

@Controller
public class Borrow2AdminController {
	
	@Resource(name = "borrowService")
	BorrowService borrowService;
	
	@RequestMapping(value="/admin/borrow2_info", method = {RequestMethod.POST})
    @ResponseBody
    public Map showInfo(Model model, HttpServletRequest request) throws NoSuchAlgorithmException{
		
		System.out.println("post,/admin/borrow2_info,borrowAdminController");
        int rows = Integer.parseInt(request.getParameter("rows"));
        int page = Integer.parseInt(request.getParameter("page"));
    	return borrowService.list2(page, rows);     
    }
	
	@RequestMapping(value="/admin/borrow_2", method = {RequestMethod.POST})
	@ResponseBody
	public HashMap addBorrow (Model model,@Valid Borrow borrow,HttpSession session){
		
		System.out.println("******post,/admin/borrow_2,borrowAdminController");
		HashMap a = new HashMap();
		borrow.setBookId(borrow.getBookId());
		System.out.println("borrow.setBookId(borrow.getBookId())="+borrow.getBookId());
		String str = borrowService.saveReturnTime(borrow,session);
		if (str.equals("a")){
			a.put("message1", "无该书籍,或该书籍在图书馆内");
		}else {
			a.put("message1", "还书成功");
		}		
		return a;
		
	}
}
