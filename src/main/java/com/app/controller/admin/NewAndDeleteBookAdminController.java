package com.app.controller.admin;

import java.io.File;
import java.io.IOException;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

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
import com.app.service.BookService;
import com.app.service.BorrowService;
import com.app.service.UserService;

@Controller
public class NewAndDeleteBookAdminController {

	@Resource(name = "bookService")
	BookService bookService;
	
	@RequestMapping(value = "/admin/newBook_1", method = { RequestMethod.POST })
	public String addBorrow(HttpServletRequest request, HttpServletResponse response, Model model,
			@ModelAttribute("newLABBook") Book book, @RequestParam(value = "apkFile") MultipartFile pearlFile,HttpSession session) {

		if (pearlFile != null) {
			// 获取保存的路径，
			String realPath = request.getSession().getServletContext().getRealPath("/");
			realPath = realPath + "/static/img/front/myimg/";
			if (pearlFile.isEmpty()) {
				// 未选择文件
			} else {
				// 文件原名称
				String originFileName = pearlFile.getOriginalFilename();
				String s = originFileName.substring(originFileName.indexOf(".") + 1);
				System.out.println(originFileName);
				String bookPic = "/static/img/front/myimg/"+originFileName;
				book.setBookPic(bookPic);
				System.out.println("bookPic="+bookPic); 
				//s 为文件后缀名
				System.out.println(s);   
				if ((s.equals("jpg")) || (s.equals("png")) || (s.equals("jpeg")) || (s.equals("JPG")) || (s.equals("PNG")) || (s.equals("JPEG"))) {
						
					try {
						// 这里使用Apache的FileUtils方法来进行保存
						FileUtils.copyInputStreamToFile(pearlFile.getInputStream(), new File(realPath, originFileName));					
					} catch (IOException e) {
						e.printStackTrace();
					}
					
					if(bookService.save(book,session)==true){
						model.addAttribute("message1", "上传成功");
						}else{
							model.addAttribute("message2", "该书籍唯一标识已存在，请确认后重新输入");
						}
				}else{
					model.addAttribute("message3", "上传图片格式错误");
				}
			}

		}
		return "/admin/newBook";
	}
	
	@RequestMapping(value="/admin/deleteBook1", method = {RequestMethod.POST})
	public String addBorrow (Model model,@ModelAttribute("deleteBookByid") Book book,HttpSession session){		
		System.out.println("旧书下架**********************");
		String str = bookService.updateDeleteTime(book,session);
		if(str.equals("a")){
			model.addAttribute("message1", "下架成功");}
		if(str.equals("b")){
			model.addAttribute("message2", "该书籍已下架");}
		if(str.equals("c")){
			model.addAttribute("message2", "该书籍唯一标识不存在，或者该书正在读者手中，请确认后重新输入");}	
		return "/admin/deleteBook";	
	}
}
