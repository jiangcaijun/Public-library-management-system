package com.app.controller.admin;

import java.security.NoSuchAlgorithmException;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.app.model.User;
import com.app.service.UserService;

@Controller
public class IndexAdminController {

	/*
	 * @RequestMapping(value = "/index") public String list()
	 * {System.out.println("url输入index"); return "/admin/index"; }
	 */

	@Resource(name = "userService")
	UserService userService;

	@RequestMapping(value = "/admin", method = RequestMethod.GET)
	public String test(Model model) {
		System.out.println("get,through admin_login,get into IndexAdminController.java");
		return "/admin/login";
	}

	@RequestMapping(value = "/admin_index", method = RequestMethod.POST)
	public String test(Model model, @ModelAttribute("adminLogin") User user, HttpSession session) {
		System.out.println("post,through admin_login，get into IndexAdminController.java");
		List<User> list = userService.findone_admin_login(user);
		if (list.size() == 0) {
			return test(model);
		} else {
			session.setAttribute("username1", (list.get(0)).getUsername());
			session.setAttribute("auth1", "1");
			return "/admin/main";
		}
	}
	@RequestMapping(value = "/admin_index", method = RequestMethod.GET)
	public String test2(Model model, HttpSession session) {
		if(session.getAttribute("username1")==null){
			return "/admin/login";
			}
		return "/admin/main";
	}
	
	/**退出系统
	 * @param model
	 * @return
	 */
	@RequestMapping(value = "admin_logout", method = RequestMethod.GET)
	public String frontLogout(Model model,HttpSession session) {
			//清空session内的所有内容
			session.invalidate();
			System.out.println("退出系统==================");
			return "redirect:/admin";
	}

	@RequestMapping("/admin/top")
	public String top() {
		return "/admin/top";
	}

	@RequestMapping("/admin/left")
	public String left() {
		return "/admin/left";
	}

	@RequestMapping("/admin/index")
	public String index() {
		return "/admin/index";
	}

	@RequestMapping("/admin/error")
	public String error() {
		return "/admin/error";
	}

	@RequestMapping("/admin/right")
	public String right() {
		return "/admin/right";
	}

	@RequestMapping("/admin/borrow")
	public String borrow() {
		return "/admin/borrow";
	}

	@RequestMapping("/admin/borrow2")
	public String borrow2() {
		return "/admin/borrow2";
	}

	@RequestMapping("/admin/newBook")
	public String newBook() {
		return "/admin/newBook";
	}

	@RequestMapping("/admin/deleteBook")
	public String deleteBook() {
		return "/admin/deleteBook";
	}

	@RequestMapping("/admin/tabBook")
	public String tabBook() {
		return "/admin/tabBook";
	}
	@RequestMapping("/admin/tabLog")
	public String tabLog() {
		return "/admin/tabLog";
	}
	@RequestMapping("/admin/tabBorrow")
	public String tabBorrow() {
		return "/admin/tabBorrow";
	}
}
