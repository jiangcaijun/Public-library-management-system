package com.app.controller;

import java.security.NoSuchAlgorithmException;
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
import com.app.model.BorrowAndBook;
import com.app.service.BorrowService;

@Controller
public class ReBorrowController {
	@Resource(name = "borrowService")
	BorrowService borrowService;
	
	@RequestMapping(value="/front/tabReBorrow", method = {RequestMethod.POST})
	public String front_bookName(Model model, @ModelAttribute("frontTabBook") Borrow borrow, HttpSession session) {
		System.out.println(borrow.getBookId()+"*************************");
		System.out.println("post,通过/front/tabReBorrow，进入ReBorrowController");
        String username = session.getAttribute("username").toString();
		List<Borrow> borrows = borrowService.findReborrowByBookName(username);
		model.addAttribute("borrows", borrows);
		return "/front/persondata/reBorrow";
	}
	@RequestMapping(value="/front/reBorrow2", method = {RequestMethod.GET})
	public String deleteBook (Model model,@RequestParam(value="bookId") String bookId,SessionStatus status,HttpServletRequest request){
		System.out.println("bookkId==============="+bookId);
		borrowService.update_willReturnTime(bookId);
		return "/front/persondata/reBorrow";
	}
}
