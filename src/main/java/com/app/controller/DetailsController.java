package com.app.controller;

import java.io.UnsupportedEncodingException;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.support.SessionStatus;

import com.app.model.Book;
import com.app.service.BookService;

@Controller
public class DetailsController {
	
	@Resource(name = "bookService")
	BookService bookService;
	
	@RequestMapping(value="/front/detail",method = RequestMethod.GET)
    public String testRequestParam(Model model,@RequestParam(value="bookName") String bookName,SessionStatus status,HttpServletRequest request){

		try {
			bookName = new String (request.getParameter("bookName").getBytes("iso-8859-1"),"utf-8");
		} catch (UnsupportedEncodingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
        List <Book> books = bookService.findOneByBookName(bookName);
        String str = bookService.findAllByBookNameSize(bookName);
        
        System.out.println("size========="+str);
        model.addAttribute("size",str);
        model.addAttribute("books",books);
        return "/front/detail";
    }
}
