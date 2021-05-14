package com.cainiao.web.controller;
import java.io.UnsupportedEncodingException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.cainiao.pojo.Student;
import com.cainiao.pojo.User;
import com.cainiao.service.StudentService;
import com.cainiao.service.UserService;
@Controller
public class UserController {
	@Autowired
	private UserService userService;
	@Autowired
	private StudentService studentService;
	
	@RequestMapping(value = "/login.action", method = RequestMethod.POST)
	public String login(String user, String username,String password, Model model, 
            HttpSession session,HttpServletRequest request) {
		if("1".equals(user)) {
			String name=username;
			int id=Integer.parseInt(password);
			Student stu=studentService.findStudent(name, id);
			session.setAttribute("stu_SESSION", stu);
			User user2 = new User();
			user2.setUser_username(stu.getName());
			user2.setUser_password(Integer.toString(stu.getId()));
			if(stu != null){
				session.setAttribute("USER_SESSION", user2);
				return "main1";
//				return "redirect:customer/list.action";
			}
				request.setAttribute("msg", "用户名或密码错误，请重新输入");
				return "login";
		}else if("0".equals(user)) {
			User user1 = userService.findUser(username, password);
			if(user1 != null){
				session.setAttribute("USER_SESSION", user1);
				return "main";
//				return "redirect:customer/list.action";
			}
			model.addAttribute("msg", "用户名或密码错误，请重新输入");
			return "login";
		}else {
				model.addAttribute("msg", "用户名或密码错误，请重新输入");
				return "login";
			}
	}
	
	
	
	
	
//	
//	@RequestMapping(value = "/login.action", method = RequestMethod.POST)
//	public String login(String username,String password, Model model, 
//                                                          HttpSession session) {
//		User user = userService.findUser(username, password);
//		if(user != null){		
//			session.setAttribute("USER_SESSION", user);
//			return "main";
////			return "redirect:customer/list.action";
//		}
//		model.addAttribute("msg", "用户名或密码错误，请重新输入");
//		return "login";
//	}
//	
//	@RequestMapping(value = "/login1.action", method = RequestMethod.POST)
//	public String login1(String username,String password, Model model, 
//			HttpSession session) {
//		User user = userService.findUser(username, password);
//		if(user != null){		
//			session.setAttribute("USER_SESSION", user);
//			return "main1";
////			return "redirect:customer/list.action";
//		}
//		model.addAttribute("msg", "用户名或密码错误，请重新输入");
//		return "login";
//	}
	
	@RequestMapping(value = "/tomain1.action")
	public String toMain1() {
	    return "main1";
	}
	@RequestMapping(value = "/tomain.action")
	public String toMain() {
	    return "main";
	}
	
	@RequestMapping(value = "/logout.action")
	public String logout(HttpSession session) {
	    session.invalidate();
	    return "redirect:login.action";
	}
	
	@RequestMapping(value = "/login.action", method = RequestMethod.GET)
	public String toLogin() {
	    return "login";
	}
	  @RequestMapping(value = "/add.do")
	   public String addUser(String username ,String password,Model model,HttpServletRequest request,HttpServletResponse response){
	        try {
	        	
				request.setCharacterEncoding("utf-8");
				response.setCharacterEncoding("utf-8");
				response.setContentType("text/html;charset=utf-8");
			} catch (UnsupportedEncodingException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		  
		  
		  userService.addUser(username, password);
	        model.addAttribute("msg", "注册成功，欢迎登录！");
	        return "login";
	    }
	    @RequestMapping("/edituser.action")
	    public String edituser() {
	        return "edituser";
	    }
	    
	    @RequestMapping("/updateUser.action")
	    public String edituserImpl(HttpServletRequest httpServlet,Model model,User user) {
	    	HttpSession session = httpServlet.getSession();
	    	User user1 = (User) session.getAttribute("USER_SESSION");
	    	System.out.println(user1.getUser_id()+"******************************");
	    	user1.setUser_username(user.getUser_username());
	    	user1.setUser_password(user.getUser_password());
	    	int row = userService.editUser(user1);
	    	if(row>0) {
	    		model.addAttribute("msg", "修改成功，请重新登录");
	    	}else {
	    		System.out.println("修改失败");
			}
	        return "login";
	    }

	    @RequestMapping(value ="/shangchuan.do")
	    public String shangchuan() {
	        return "shangchuan";
	    }
}
