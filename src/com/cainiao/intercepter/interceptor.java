package com.cainiao.intercepter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import com.cainiao.pojo.User;

public class interceptor implements HandlerInterceptor {

	@Override
	public void afterCompletion(HttpServletRequest arg0, HttpServletResponse arg1, Object arg2, Exception arg3)
			throws Exception {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void postHandle(HttpServletRequest arg0, HttpServletResponse arg1, Object arg2, ModelAndView arg3)
			throws Exception {
		// TODO Auto-generated method stub
		
	}

	@Override
	public boolean preHandle(HttpServletRequest req, HttpServletResponse rsp, Object arg2) throws Exception {
		String uri=req.getRequestURI(); 
		if(uri.indexOf("/login")>0) {
			return true;
		}
		User  user= (User) req.getSession().getAttribute("USER_SESSION");
		if(user!=null) {
			return true;
		}
		req.setAttribute("msg", "ÇëÏÈµÇÂ¼ÓÃ»§£¡");
		req.getRequestDispatcher("/WEB-INF/jsp/login.jsp").forward(req, rsp);
		return false;
	}

}
