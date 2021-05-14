package com.cainiao.web.controller;

import java.io.UnsupportedEncodingException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.cainiao.pojo.Course;
import com.cainiao.pojo.Course2;
import com.cainiao.service.CourseService2;
import com.cainiao.util.Page;
@Controller
public class ChooseController {
	 @Autowired
	    private CourseService2 courseService2;
	 @RequestMapping("/xuanxiu.do")
	    public String addCourse1(HttpServletRequest request,HttpServletResponse response) {
	    	try {
				request.setCharacterEncoding("utf-8");
				response.setCharacterEncoding("utf-8");
			} catch (UnsupportedEncodingException e1) {
				// TODO Auto-generated catch block
				e1.printStackTrace();
			}
	        Course2 course = new Course2();
	 
	        int courseID = Integer.parseInt(request.getParameter("course_id"));
	        String name = request.getParameter("name");
	        String teacher = request.getParameter("teacher");
	 
	        course.setCourse_id(courseID);
	        course.setName(name);
	        course.setTeacher(teacher);
	        courseService2.addCourse(course);
//	        HttpSession session = httpServlet.getSession();
//	        User user1 = (User) session.getAttribute("USER_SESSION");
	        return "redirect:listCourse2.do";
	    }
	 
	 

	    @RequestMapping("/listCourse2.do")
	    public String listCourse2(HttpServletRequest request, HttpServletResponse response) {
	    
	        // 获取分页参数
	        int start = 0;
	        int count = 10;
	 
	        try {
	            start = Integer.parseInt(request.getParameter("page.start"));
	            count = Integer.parseInt(request.getParameter("page.count"));
	        } catch (Exception e) {
	        }
	 
	        Page page = new Page(start, count);
	 
	        List<Course2> courses = courseService2.list(page.getStart(), page.getCount());
	        int total = courseService2.getTotal();
	        page.setTotal(total);
	        
	        request.setAttribute("courses", courses);
	        request.setAttribute("page", page);
	 
	        return "listCourse2";
	    }
	    @RequestMapping("/updateCourse2.do")
	    public String addCourse(HttpServletRequest request,HttpServletResponse response) {
	    	try {
				request.setCharacterEncoding("utf-8");
				response.setCharacterEncoding("utf-8");
			} catch (UnsupportedEncodingException e1) {
				// TODO Auto-generated catch block
				e1.printStackTrace();
			}
	        Course2 course = new Course2();
	 
	        int courseID = Integer.parseInt(request.getParameter("course_id"));
	        String name = request.getParameter("name");
	        String teacher = request.getParameter("teacher");
	 
	        course.setCourse_id(courseID);
	        course.setName(name);
	        course.setTeacher(teacher);
	        courseService2.addCourse(course);
//	        HttpSession session = httpServlet.getSession();
//	        User user1 = (User) session.getAttribute("USER_SESSION");
	        return "redirect:listCourse.do";
	    }
	    
}
