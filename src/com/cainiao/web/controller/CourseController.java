package com.cainiao.web.controller;

import java.io.UnsupportedEncodingException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.cainiao.pojo.Course;
import com.cainiao.pojo.User;
import com.cainiao.service.CourseService;
import com.cainiao.util.Page;
@Controller
public class CourseController {
	 @Autowired
	    private CourseService courseService;
	 
	    @RequestMapping("/addCourse.do")
	    public String addCourse(HttpServletRequest request,HttpServletResponse response) {
	    	try {
				request.setCharacterEncoding("utf-8");
				response.setCharacterEncoding("utf-8");
			} catch (UnsupportedEncodingException e1) {
				// TODO Auto-generated catch block
				e1.printStackTrace();
			}
	        Course course = new Course();
	 
	        int courseID = Integer.parseInt(request.getParameter("course_id"));
	        String name = request.getParameter("name");
	        String teacher = request.getParameter("teacher");
	 
	        course.setCourse_id(courseID);
	        course.setName(name);
	        course.setTeacher(teacher);
	        courseService.addCourse(course);
//	        HttpSession session = httpServlet.getSession();
//	        User user1 = (User) session.getAttribute("USER_SESSION");
	        return "redirect:listCourse.do";
	    }
	 
	    @RequestMapping("/listCourse.do")
	    public String listCourse(HttpServletRequest request, HttpServletResponse response) {
	    
	        // 获取分页参数
	        int start = 0;
	        int count = 10;
	 
	        try {
	            start = Integer.parseInt(request.getParameter("page.start"));
	            count = Integer.parseInt(request.getParameter("page.count"));
	        } catch (Exception e) {
	        }
	 
	        Page page = new Page(start, count);
	 
	        List<Course> courses = courseService.list(page.getStart(), page.getCount());
	        int total = courseService.getTotal();
	        page.setTotal(total);
	        
	        request.setAttribute("courses", courses);
	        request.setAttribute("page", page);
	 
	        return "listCourse";
	    }
	    @RequestMapping("/listCourse1.do")
	    public String listCourse1(HttpServletRequest request, HttpServletResponse response) {
	    	
	    	// 获取分页参数
	    	int start = 0;
	    	int count = 10;
	    	
	    	try {
	    		start = Integer.parseInt(request.getParameter("page.start"));
	    		count = Integer.parseInt(request.getParameter("page.count"));
	    	} catch (Exception e) {
	    	}
	    	
	    	Page page = new Page(start, count);
	    	
	    	List<Course> courses = courseService.list(page.getStart(), page.getCount());
	    	int total = courseService.getTotal();
	    	page.setTotal(total);
	    	
	    	request.setAttribute("courses", courses);
	    	request.setAttribute("page", page);
	    	
	    	return "listCourse1";
	    }
	 
	    @RequestMapping("/deleteCourse.do")
	    public String deleteCourse(int id) {
	    	courseService.deleteCourse(id);
	        return "redirect:listCourse.do";
	    }
	 
	    @RequestMapping("/editCourse3.do")
	    public ModelAndView editCourse3(int course_id) {
	        ModelAndView mav = new ModelAndView("editCourse");
	        Course course = courseService.getCourse3(course_id);
	        mav.addObject("course", course);
	        return mav;
	    }
	    @RequestMapping("/editCourse.do")
	    public ModelAndView editCourse(int id) {
	    	ModelAndView mav = new ModelAndView("editCourse");
	    	Course course = courseService.getCourse(id);
	    	mav.addObject("course", course);
	    	return mav;
	    }
	    @RequestMapping("/editCourse1.do")
	    public ModelAndView editCourse1(String name) {
	    	ModelAndView mav = new ModelAndView("editCourse");
	    	Course course = courseService.getCourse1(name);
	    	mav.addObject("course", course);
	    	return mav;
	    }
	    @RequestMapping("/editCourse2.do")
	    public ModelAndView editCourse2(String teacher) {
	    	ModelAndView mav = new ModelAndView("editCourse");
	    	Course course = courseService.getCourse2(teacher);
	    	mav.addObject("course", course);
	    	return mav;
	    }
	    @RequestMapping("/editCourse4.do")
	    public ModelAndView editCourse4(int id) {
	    	ModelAndView mav = new ModelAndView("editCourse2");
	    	Course course = courseService.getCourse(id);
	    	mav.addObject("course", course);
	    	return mav;
	    }
	 
	    @RequestMapping("/updateCourse.do")
	    public String updateCourse(HttpServletRequest request, HttpServletResponse response) {
	    	try {
				request.setCharacterEncoding("utf-8");
				response.setCharacterEncoding("utf-8");
			} catch (UnsupportedEncodingException e1) {
				// TODO Auto-generated catch block
				e1.printStackTrace();
			}
	        Course course = new Course();
	 
	        int id = Integer.parseInt(request.getParameter("id"));
	        int course_id = Integer.parseInt(request.getParameter("course_id"));
	        String name = request.getParameter("name");
	        String teacher = request.getParameter("teacher");
	   	 
	        course.setTeacher(teacher);
	        course.setId(id);
	        course.setCourse_id(course_id);
	        course.setName(name);
	 
	        courseService.updateCourse(course);
	        return "redirect:listCourse.do";
	    }
}
