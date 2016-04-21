package com.app.controller;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.app.model.User;
import com.app.service.UserService;

@Controller
public class MyDataController {
	@Resource(name = "userService")
	UserService userService;
	
	/*@RequestMapping(value = "/front/myData", method = RequestMethod.POST)
	@ResponseBody
	public String front(Model model, @RequestParam(value="password1")String password1,
			@RequestParam(value="password2")String password2,
			@RequestParam(value="password3")String password3,HttpSession session) {
		
		System.out.println("******myDataResetPass,个人中心，修改密码****");
		User user = new User();
		user.setUsername(session.getAttribute("username1").toString());
		if(password2==password3){
			if(!userService.findone_front_login(user).equals(null)){
				model.addAttribute("message1", "密码更改成功");
				userService.update_front_myData(password2,user.getUsername());
				return null;
			}model.addAttribute("message1", "旧密码输入错误，请确认后重新输入");
			return null;
		}model.addAttribute("message2", "新密码不一致，请确认后重新输入");

		return "/front/persondata/myData";
	}*/
}
