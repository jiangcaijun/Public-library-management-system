package com.app.controller;

import java.security.NoSuchAlgorithmException;
import java.util.ArrayList;
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
import org.springframework.web.bind.annotation.ResponseBody;

import com.app.model.Apply;
import com.app.model.Book;
import com.app.model.Borrow;
import com.app.service.ApplyService;
import com.app.service.BookService;
@Controller
public class ApplyController {
	@Resource(name = "applyService")
	ApplyService applyService;
	@Resource(name = "bookService")
	BookService bookService;
	
	/**对应apply.jsp 书籍预约界面
	 * @param model
	 * @param apply
	 * @return
	 */
	@RequestMapping(value="/front/apply", method = {RequestMethod.POST})
	public String addBorrow (Model model,@ModelAttribute("front_apply") Apply apply, HttpSession session){
		
		System.out.println("post,/front/apply,ApplyController,***************************************");
        String username = session.getAttribute("username").toString();
        System.out.println("username==========="+username);
		String str = applyService.save(apply,username);
		if (str.equals("a")){
			model.addAttribute("message1", "该书籍当前图书管内不存在");
		}
		if (str.equals("b")){
			model.addAttribute("message1", "该书籍当前图书管内有库存，请前往图书馆该书籍相应摆放位置借阅");
		}
		if (str.equals("c")){
			model.addAttribute("message1", "该书籍已预约，请勿重复预约");
		}
		if (str.equals("d")){
			model.addAttribute("message1", "预约成功");
		}
		
		//return "/demo/validatesuccess";
		return "/front/persondata/apply";
		
	}
	
	
	/**对应apply.jsp 书籍预约界面
	 * @param model
	 * @param apply
	 * @return
	 */
	/*@RequestMapping(value="/front/apply", method = {RequestMethod.POST})
	@ResponseBody
	public String addBorrow (@ModelAttribute("front_apply") Apply apply){
		
		String message = null;
		System.out.println("post,/front/apply,ApplyController,***************************************");
		System.out.println("post,/front/apply,ApplyController,蒋蔡军蒋蔡军蒋蔡军蒋蔡军蒋蔡军蒋蔡军");
		String str = applyService.save(apply);
		if (str.equals("a")){
			message="该书籍当前图书管内不存在";
		}
		if (str.equals("b")){
			message="该书籍当前图书管内有库存，请前往图书馆该书籍相应摆放位置借阅";
		}
		if (str.equals("c")){
			message="预约成功";
		}
		System.out.println("message==========="+message);
		return message;
		
	}*/
	/*@RequestMapping(value="/front/apply_info", method = {RequestMethod.POST})
    @ResponseBody
    public Map showInfo(Model model, HttpServletRequest request) throws NoSuchAlgorithmException{	
		System.out.println("post,/front/apply_info,ApplyController");
        int rows = Integer.parseInt(request.getParameter("rows"));
        int page = Integer.parseInt(request.getParameter("page"));
    	return applyService.list(page, rows);     
    }*/
	
	@RequestMapping(value="/front/apply_info_1", method = {RequestMethod.POST})
	public String front_bookName(Model model, @ModelAttribute("applyInfo1") Apply apply, HttpSession session) {
		System.out.println("apply表查到的数据");
        String username = session.getAttribute("username").toString();
        System.out.println("username==========="+username);
		List<Apply> applys = applyService.findAllApplyByBookName(apply.getBookName(),username);		
		Integer str;	
		for(int i = 0;i < applys.size();i++){
			str = (bookService.findAllByBookName3(applys.get(i).getBookName())).size();
			applys.get(i).setSum(str);
			}
		
		model.addAttribute("applys", applys);
		return "/front/persondata/apply";
	}
}
