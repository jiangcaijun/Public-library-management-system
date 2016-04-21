package com.app.controller;

import java.io.UnsupportedEncodingException;
import java.security.NoSuchAlgorithmException;
import java.util.HashMap;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.support.SessionStatus;

import com.app.model.Book;
import com.app.model.Borrow;
import com.app.model.User;
import com.app.service.BookService;
import com.app.service.BorrowService;
import com.app.service.UserService;

@Controller
public class IndexFrontController {

	@Resource(name = "userService")
	UserService userService;
	@Resource(name = "bookService")
	BookService bookService;
	@Resource(name = "borrowService")
	BorrowService borrowService;

	/**图书馆首页的登录 post 请求
	 * @param model
	 * @return
	 */
	@RequestMapping(value = "front", method = RequestMethod.GET)
	public String front(Model model) {
		if (!model.containsAttribute("frontLogin")) {
			model.addAttribute("frontLogin", new User());
		}
		return "/front/index";
	}

	/**对应图书馆首页的登录
	 * @param model
	 * @param user
	 * @return
	 */
	@RequestMapping(value = "/front", method = RequestMethod.POST)
	@ResponseBody
	public HashMap front(Model model,@Valid User user,HttpSession session){			
		System.out.println("****************post,front,蒋蔡军ajax***********************");
		HashMap a = new HashMap();
		user.setUsername(user.getUsername());
		user.setPassword(user.getPassword());
		List<User> list = userService.findone_front_login(user);
		if ( list.size() == 0) {
			a.put("message", "login_false");
		} else {
			session.setAttribute("username", (list.get(0)).getUsername());
			session.setAttribute("idCard", (list.get(0)).getIdCard());
			session.setAttribute("tel", (list.get(0)).getTel());
			session.setAttribute("auth", "0");
			session.setAttribute("email", (list.get(0)).getEmail());
			a.put("message", "login_true");
		}
		return a;
	}
	/**对应 /front/login 页面的登录
	 * @param model
	 * @param user
	 * @return
	 */
	@RequestMapping(value = "/front1", method = RequestMethod.POST)
	public String front2(Model model, @ModelAttribute("frontLogin1") User user,HttpSession session) {
		System.out.println("****************蒋蔡军***********************");
		List<User> list = userService.findone_front_login(user);
		if ( list.size() == 0) {
			return "/front/login";
		} else {
			session.setAttribute("username", (list.get(0)).getUsername());
			session.setAttribute("idCard", (list.get(0)).getIdCard());
			session.setAttribute("tel", (list.get(0)).getTel());
			session.setAttribute("auth", "0");
			session.setAttribute("email", (list.get(0)).getEmail());
		}return front(model);
	}
	/**退出系统
	 * @param model
	 * @return
	 */
	@RequestMapping(value = "front_logout", method = RequestMethod.GET)
	public String frontLogout(Model model,HttpSession session) {
		if(session.getAttribute("username")!=null){
			//清空session内的所有内容
			session.invalidate();
			return "redirect:/front";
			}
		return "/front/index";
	}
	/**对应图书馆首页的忘记密码
	 * @param model
	 * @param user
	 * @return
	 */
	@RequestMapping(value = "/front_resetPassword", method = RequestMethod.POST)
	public String front_1(Model model, @ModelAttribute("frontResetPassWord") User user) {
		System.out.println("更改密码**************************");
		if (userService.update_front_login_1(user) == false) {
			return front(model);
		} else {
			return front(model);
		}
	}
	@RequestMapping(value = "/front/search", method = RequestMethod.GET)
	public String testRequestParam(Model model, @RequestParam(value = "bookName") String bookName, SessionStatus status,
			HttpServletRequest request) {
		try {
			bookName = new String (request.getParameter("bookName").getBytes("iso-8859-1"),"utf-8");
		} catch (UnsupportedEncodingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		List<Book> books = bookService.findAllByBookName(bookName);

		// 对应 “检索词”
		model.addAttribute("bookName", bookName);

		// 对应 “检索到: ${bookSize} 条结果”
		model.addAttribute("bookSize", books.size());

		model.addAttribute("books", books);

		return "/front/search";
	}

	/**search.jsp页面，添加“主题”的快捷检索
	 * @param model
	 * @param theme
	 * @param status
	 * @param request
	 * @return
	 */
	@RequestMapping(value = "/front/search_theme", method = RequestMethod.GET)
	public String testRequestParam1(Model model, @RequestParam(value = "theme") String theme, SessionStatus status,
			HttpServletRequest request) {
		try {
			theme = new String (request.getParameter("theme").getBytes("iso-8859-1"),"utf-8");
		} catch (UnsupportedEncodingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		List<Book> books = bookService.findAllByTheme(theme);

		// 对应 “检索词”
		model.addAttribute("bookName", theme);

		// 对应 “检索到: ${bookSize} 条结果”
		model.addAttribute("bookSize", books.size());

		model.addAttribute("books", books);

		return "/front/search";
	}
	/**search.jsp页面，添加“热门作者”的快捷检索
	 * @param model
	 * @param theme
	 * @param status
	 * @param request
	 * @return
	 */
	@RequestMapping(value = "/front/search_autor", method = RequestMethod.GET)
	public String testRequestParam2(Model model, @RequestParam(value = "autor") String autor, SessionStatus status,
			HttpServletRequest request) {
		try {
			autor = new String (request.getParameter("autor").getBytes("iso-8859-1"),"utf-8");
		} catch (UnsupportedEncodingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		List<Book> books = bookService.findAllByAutor(autor);

		// 对应 “检索词”
		model.addAttribute("bookName", autor);

		// 对应 “检索到: ${bookSize} 条结果”
		model.addAttribute("bookSize", books.size());

		model.addAttribute("books", books);

		return "/front/search";
	}
	// 对应图书馆首页的“书籍名”搜索框
	@RequestMapping(value = "/front_bookName", method = RequestMethod.POST)
	public String front_bookName(Model model, @ModelAttribute("frontBookName") Book book) {

		System.out.println("post,通过front_bookName，进入IndexFrontController");
		List<Book> books = bookService.findAllByBookName(book.getBookName());

		if (books.size() == 0) {
			System.out.println("查不到数据==========" + books.size());
		} else {
			System.out.println("查到了数据==========" + books.size());
		}
		// 对应 “检索词”
		model.addAttribute("bookName", book.getBookName());

		// 对应 “检索到: ${bookSize} 条结果”
		model.addAttribute("bookSize", books.size());

		model.addAttribute("books", books);

		return "/front/search";

	}

	// 对应图书馆首页的“主题”搜索框
	@RequestMapping(value = "/front_theme", method = RequestMethod.POST)
	public String front_theme(Model model, @ModelAttribute("frontTheme") Book book) {
		System.out.println("********************主题搜索/front_theme********************");
		System.out.println("book.getTheme()==============" + book.getTheme());
		List<Book> books = bookService.findAllByTheme(book.getTheme());
		// 对应 “检索词”
		model.addAttribute("bookName", book.getTheme());

		// 对应 “检索到: ${bookSize} 条结果”
		model.addAttribute("bookSize", books.size());
		model.addAttribute("books", books);
		return "/front/search";

	}

	// 对应图书馆首页的“作者”搜索框
	@RequestMapping(value = "/front_autor", method = RequestMethod.POST)
	public String front_autor(Model model, @ModelAttribute("frontAutor") Book book) {
		System.out.println("********************作者搜索/front_autor********************");
		System.out.println("book.getAutor()==============" + book.getAutor());
		List<Book> books = bookService.findAllByAutor(book.getAutor());
		// 对应 “检索词”
		model.addAttribute("bookName", book.getAutor());

		// 对应 “检索到: ${bookSize} 条结果”
		model.addAttribute("bookSize", books.size());

		model.addAttribute("books", books);

		return "/front/search";

	}
	@RequestMapping(value = "/front/login", method = RequestMethod.GET)
	public String frontLogin(Model model,HttpSession session) {
		return "/front/login";
	}
	/**个人中心的 “个人资料”
	 * @param model
	 * @return
	 */
	@RequestMapping(value = "/front/myData", method = RequestMethod.GET)
	public String myData(Model model,HttpSession session) {
		if(session.getAttribute("username")==null){
			return "redirect:/front";
			}
		return "/front/persondata/myData";
	}
	/**个人中心的 “个人资料”
	 * @param model
	 * @param password1
	 * @param password2
	 * @param password3
	 * @param session
	 * @return
	 */
	@RequestMapping(value = "/front/myData", method = RequestMethod.POST)
	public String front(Model model, @RequestParam(value="password1")String password1,
			@RequestParam(value="password2")String password2,
			@RequestParam(value="password3")String password3,HttpSession session) {
		
		System.out.println("***************myDataResetPass,个人中心，修改密码***************");
		System.out.println("session.getAttribute(username1).toString()==="+session.getAttribute("username").toString());
		if(password2.equals(password3)){
			if(userService.findOnelogin(session.getAttribute("username").toString(),password1)){
				model.addAttribute("message1", "密码更改成功");
				userService.update_front_myData(password2,session.getAttribute("username").toString());
				return "/front/persondata/myData";
			}
			model.addAttribute("message1", "旧密码输入错误，请确认后重新输入");
			return "/front/persondata/myData";
		}else{
			model.addAttribute("message2", "新密码不一致，请确认后重新输入");}

		return "/front/persondata/myData";
	}
	/**个人中心的 “借阅查询”
	 * @param model
	 * @return
	 */
	@RequestMapping(value = "/front/borrowAndReturn", method = RequestMethod.GET)
	public String porrowAndReturn(Model model,HttpSession session) {
		if(session.getAttribute("username")==null){
			return "redirect:/front";
			}
		return "/front/persondata/borrowAndReturn";
	}

	@RequestMapping(value = "/front/nothing", method = RequestMethod.GET)
	public String nothing(Model model,HttpSession session) {
		if(session.getAttribute("username")==null){
			return "redirect:/front";
			}
		return "/front/persondata/nothing";
	}
	/**个人中心的 “过期书籍”
	 * @param model
	 * @return
	 */
	@RequestMapping(value = "/front/late", method = RequestMethod.GET)
	public String late(Model model,HttpSession session) {
		if(session.getAttribute("username")==null){
		return "redirect:/front";
		}
		return "/front/persondata/late";
	}
	
	/**个人中心的 “书籍预约”
	 * @param model
	 * @return
	 */
	@RequestMapping(value = "/front/apply", method = RequestMethod.GET)
	public String apply(Model model,HttpSession session) {
		if(session.getAttribute("username")==null){
			return "redirect:/front";
			}
		return "/front/persondata/apply";
	}

	/**个人中心的 “图书续借”
	 * @param model
	 * @param session
	 * @return
	 */
	@RequestMapping(value = "/front/reBorrow", method = RequestMethod.GET)
	public String reBorrow(Model model,HttpSession session) {
	if(session.getAttribute("username")==null){
		return "redirect:/front";
		}
	return "/front/persondata/reBorrow";
	}
}
