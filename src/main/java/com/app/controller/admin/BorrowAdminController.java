package com.app.controller.admin;

import java.security.NoSuchAlgorithmException;
import java.util.HashMap;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.jboss.logging.Param;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.app.model.Borrow;
import com.app.model.User;
import com.app.service.BorrowService;

@Controller
public class BorrowAdminController {
	
	@Resource(name = "borrowService")
	BorrowService borrowService;
	
	/*@RequestMapping(value="/admin/borrow_info", method = {RequestMethod.GET})
    @ResponseBody
    public Map showInfo1(Model model,@RequestParam(defaultValue="0") String rows,@RequestParam(defaultValue="20") String page) throws NoSuchAlgorithmException{
		
		System.out.println("get,/admin/borrow_info,borrowAdminController");
        int rows1 = Integer.parseInt(rows);
        int page1 = Integer.parseInt(page);
        System.out.println("rows1="+rows1);
        System.out.println("page1="+page1);
    	return borrowService.list3(page1, rows1);     
    }*/
	
	/*@RequestMapping(value="/admin/borrow_info", method = {RequestMethod.POST})
    @ResponseBody
    public Map showInfo(Model model,@RequestParam(defaultValue="0") String rows,@RequestParam(defaultValue="20") String page) throws NoSuchAlgorithmException{		
        int rows1 = Integer.parseInt(rows);
        int page1 = Integer.parseInt(page);
    	return borrowService.list3(page1, rows1);     
    }*/
	
	@RequestMapping(value="/admin/borrow_1", method = {RequestMethod.POST})
	public String addBorrow (Model model,@ModelAttribute("addBorrow") Borrow borrow,HttpSession session){		
		String str = borrowService.save(borrow,session);
		if(str.equals("b")){	
			model.addAttribute("message2", "无该书籍,或该书籍已被借出");
			}
		if(str.equals("c")){	
			model.addAttribute("message1", "该读者证号不存在");
			}
		if(str.equals("a")){	
			model.addAttribute("message3", "借书成功");
			}
		/*switch (str) {
		case "b":
			model.addAttribute("message2", "无该书籍,或该书籍已被借出");
			break;
		case "c":
			model.addAttribute("message1", "该读者证号不存在");
			break;
		default:
			model.addAttribute("message3", "借书成功");
			break;
		}*/
		return "/admin/borrow";
	}
	
}
