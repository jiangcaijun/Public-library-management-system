package com.app.controller.admin;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.io.FileUtils;
import org.json.JSONObject;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.app.model.Book;
import com.app.model.Borrow;
import com.app.model.Log;
import com.app.service.BookService;
import com.app.service.BorrowService;
import com.app.service.LogService;
import com.app.service.UserService;

@Controller
public class TabBookAdminController {

	@Resource(name = "bookService")
	BookService bookService;
	@Resource(name = "logService")
	LogService logService;
	@Resource(name = "borrowService")
	BorrowService borrowService;
	
	@RequestMapping(value = "/admin/tabBook", method = RequestMethod.POST)
	public String front_bookName(Model model, @ModelAttribute("adminTabBook") Book book) {
		System.out.println("post,通过/admin/tabBook，进入TabBookAdminController");
		List<Book> books = bookService.findAllByBookName2(book.getBookName());
		model.addAttribute("books", books);
		return "/admin/tabBook";
	}
	@RequestMapping(value = "/admin/tabBorrow", method = RequestMethod.POST)
	public String front_bookId(Model model, @ModelAttribute("adminTabBorrow") Borrow borrow) {
		System.out.println("post,通过/admin/tabBorrow，进入TabBookAdminController");
		
		List<Borrow> borrows = borrowService.findAllBorrowByBookId(borrow.getBookId());
		
		String bookName;	
		for(int i = 0;i < borrows.size();i++){
			bookName = bookService.findAllById4(borrows.get(i).getBookId());
			System.out.println("bookName");
			borrows.get(i).setBookName(bookName);
			}

		model.addAttribute("borrows", borrows);
		
		return "/admin/tabBorrow";
	}
	@RequestMapping(value = "/admin/tabLog", method = RequestMethod.POST)
	public String front_operate(Model model, @ModelAttribute("adminTabLog") Log log) {
		List<Log> logs = logService.findAllLog(log.getOperate());
		SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		String str[] = new String[logs.size()];
		for(int i= 0;i<logs.size();i++){
			str[i] = formatter.format(logs.get(i).getCreateTime());
			}
		model.addAttribute("logs", logs);
		return "/admin/tabLog";

	}
}
