package com.cainiao.web.controller;

import java.io.UnsupportedEncodingException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.cainiao.pojo.Work;
import com.cainiao.pojo.Work2;
import com.cainiao.service.WorkService2;
import com.cainiao.util.Page;

@Controller
public class Work2Controller {
 @Autowired
 private WorkService2 workService2;
 @RequestMapping("/addWork2.do")
	public String addCourse(HttpServletRequest request, HttpServletResponse response) {
		try {
			request.setCharacterEncoding("utf-8");
			response.setCharacterEncoding("utf-8");
		} catch (UnsupportedEncodingException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
		Work2 work = new Work2();

		String name = request.getParameter("name");

		work.setName(name);
		workService2.addWork(work);
		return "success1";
	}
	@RequestMapping("/homeworklist1.do")
	public String homeworklist1(HttpServletRequest request, HttpServletResponse response) {

		// 获取分页参数
		int start = 0;
		int count = 10;

		try {
			start = Integer.parseInt(request.getParameter("page.start"));
			count = Integer.parseInt(request.getParameter("page.count"));
		} catch (Exception e) {
		}

		Page page = new Page(start, count);

		List<Work2> works = workService2.list(page.getStart(), page.getCount());
		int total = workService2.getTotal();
		page.setTotal(total);

		request.setAttribute("works", works);
		request.setAttribute("page", page);
		return "homeworklist1";
	}

}
