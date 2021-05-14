package com.cainiao.web.controller;

import java.io.UnsupportedEncodingException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.tools.ant.taskdefs.condition.Http;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.cainiao.intercepter.interceptor;
import com.cainiao.pojo.Student;
import com.cainiao.pojo.User;
import com.cainiao.service.StudentService;
import com.cainiao.util.Page;


@Controller
public class StudentController {
 
    @Autowired
    private StudentService studentService;
 
    @RequestMapping("/addStudent.do")
    public String addStudent(HttpServletRequest request,HttpServletResponse response) {
    	try {
			request.setCharacterEncoding("utf-8");
			response.setCharacterEncoding("utf-8");
		} catch (UnsupportedEncodingException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
        Student student = new Student();
 
        int studentID = Integer.parseInt(request.getParameter("student_id"));
        String name = request.getParameter("name");
        int age = Integer.parseInt(request.getParameter("age"));
        String sex = request.getParameter("sex");
        Date birthday = null;
        // String 类型按照 yyyy-MM-dd 的格式转换为 java.util.Date 类
        SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd");
        try {
            birthday = simpleDateFormat.parse(request.getParameter("birthday"));
        } catch (ParseException e) {
            e.printStackTrace();
        }
 
        student.setStudent_id(studentID);
        student.setName(name);
        student.setAge(age);
        student.setSex(sex);
        student.setBirthday(birthday);
        System.out.println(student+"**********************");
        studentService.addStudent(student);
        return "redirect:listStudent.do";
    }
 
    @RequestMapping("/listStudent.do")
    public String listStudent(HttpServletRequest request, HttpServletResponse response) {
 
        // 获取分页参数
        int start = 0;
        int count = 10;
 
        try {
            start = Integer.parseInt(request.getParameter("page.start"));
            count = Integer.parseInt(request.getParameter("page.count"));
        } catch (Exception e) {
        }
 
        Page page = new Page(start, count);
 
        List<Student> students = studentService.list(page.getStart(), page.getCount());
        int total = studentService.getTotal();
        page.setTotal(total);
        
        request.setAttribute("students", students);
        request.setAttribute("page", page);
 
        return "listStudent";
    }
 
    @RequestMapping("/deleteStudent.do")
    public String deleteStudent(int id) {
         studentService.deleteStudent(id);
        return "redirect:listStudent.do";
    }
    @RequestMapping("/selectStudent.do")
    public String findStudent(HttpServletRequest request,HttpServletResponse response,int id,String name) {
    	try {
			request.setCharacterEncoding("utf-8");
			response.setCharacterEncoding("utf-8");
		} catch (UnsupportedEncodingException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
        Student student = studentService.findStudent(name, id);
        int start = 0;
        int count = 10;
 
        try {
            start = Integer.parseInt(request.getParameter("page.start"));
            count = Integer.parseInt(request.getParameter("page.count"));
        } catch (Exception e) {
        }
 
        Page page = new Page(start, count);
 
        int total = studentService.getTotal();
        page.setTotal(total);
        request.setAttribute("student", student);
        return "listStudent1";
    }
 

    
    @RequestMapping("/editStudent2.do")
    public ModelAndView editStudent2(int student_id) {
        ModelAndView mav = new ModelAndView("editStudent");
        Student student = studentService.getStudent2(student_id);
        mav.addObject("student", student);
        return mav;
    }
    @RequestMapping("/editStudent.do")
    public ModelAndView editStudent(int id) {
    	ModelAndView mav = new ModelAndView("editStudent");
    	Student student = studentService.getStudent(id);
    	mav.addObject("student", student);
    	return mav;
    }
    @RequestMapping("/editStudent1.do")
    public ModelAndView editStudent1(String name) {
    	ModelAndView mav = new ModelAndView("editStudent");
    	Student student = studentService.getStudent1(name);
    	mav.addObject("student", student);
    	return mav;
    }
 
    @RequestMapping("/updateStudent.do")
    public String updateStudent(HttpServletRequest request, HttpServletResponse response) {
    	try {
			request.setCharacterEncoding("utf-8");
			response.setCharacterEncoding("utf-8");
		} catch (UnsupportedEncodingException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
        Student student = new Student();
 
        int id = Integer.parseInt(request.getParameter("id"));
        int student_id = Integer.parseInt(request.getParameter("student_id"));
        String name = request.getParameter("name");
        int age = Integer.parseInt(request.getParameter("age"));
        String sex = request.getParameter("sex");
 
        SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd");
        Date birthday = null;
        try {
            birthday = simpleDateFormat.parse(request.getParameter("birthday"));
        } catch (ParseException e) {
            e.printStackTrace();
        }
 
        student.setId(id);
        student.setStudent_id(student_id);
        student.setName(name);
        student.setAge(age);
        student.setSex(sex);
        student.setBirthday(birthday);
 
        studentService.updateStudent(student);
        return "redirect:listStudent.do";

    }
    @RequestMapping("/me.do")
    public String me() {
        return "me";
    }
    @RequestMapping("/fileUpload.do")
    public String fileUpload() {
    	return "fileUpload";
    }
    
    
    
    
}



