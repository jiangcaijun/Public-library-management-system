package com.app.controller;

import java.io.UnsupportedEncodingException;
import java.security.NoSuchAlgorithmException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.support.SessionStatus;

import com.app.model.Book;
import com.app.model.Borrow;
import com.app.model.User;
import com.app.service.BorrowService;

@Controller
public class BorrowAndReturnController {
	
	@Resource(name = "borrowService")
	BorrowService borrowService;
	
	/**当前正借阅的书籍
	 * @param model
	 * @param request
	 * @return
	 * @throws NoSuchAlgorithmException
	 */
	@RequestMapping(value="/front/borrowAndReturn_info", method = {RequestMethod.POST})
    @ResponseBody
    public Map showInfo(Model model, HttpServletRequest request, HttpSession session) throws NoSuchAlgorithmException{
		
		System.out.println("post,/admin/borrowAndReturn_info,BorrowAndReturnController");
        int rows = Integer.parseInt(request.getParameter("rows"));
        int page = Integer.parseInt(request.getParameter("page"));
        String username = session.getAttribute("username").toString();
    	return borrowService.list(page, rows, username);     
    }
	
	/**已归还的书籍
	 * @param model
	 * @param request
	 * @return
	 * @throws NoSuchAlgorithmException
	 */
	@RequestMapping(value="/front/borrowAndReturn_info2", method = {RequestMethod.POST})
    @ResponseBody
    public Map showInfo2(Model model, HttpServletRequest request, HttpSession session) throws NoSuchAlgorithmException{
		
		System.out.println("post,/admin/borrowAndReturn_info,BorrowAndReturnController");
        int rows = Integer.parseInt(request.getParameter("rows"));
        int page = Integer.parseInt(request.getParameter("page"));
        String username = session.getAttribute("username").toString();
    	return borrowService.list3(page, rows,username);     
    }
	/**过期书籍
	 * @param model
	 * @param request
	 * @return
	 * @throws NoSuchAlgorithmException
	 */
	@RequestMapping(value="/front/borrowAndReturn_info3", method = {RequestMethod.POST})
    @ResponseBody
    public Map showInfo3(Model model, HttpServletRequest request) throws NoSuchAlgorithmException{
		
		System.out.println("post,/admin/borrowAndReturn_info,BorrowAndReturnController");
        int rows = Integer.parseInt(request.getParameter("rows"));
        int page = Integer.parseInt(request.getParameter("page"));
    	Map map= borrowService.list4(page, rows);  
    	return map;
    }
	
}
