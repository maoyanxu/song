package com.cainiao.web.controller;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStreamReader;
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
import org.springframework.web.servlet.ModelAndView;

import com.cainiao.pojo.Work;
import com.cainiao.service.WorkService;
import com.cainiao.util.Page;

@Controller
public class WorkController {
	@Autowired
	private WorkService workService;

	@RequestMapping("/addWork.do")
	public String addCourse(HttpServletRequest request, HttpServletResponse response) {
		try {
			request.setCharacterEncoding("utf-8");
			response.setCharacterEncoding("utf-8");
		} catch (UnsupportedEncodingException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
		Work work = new Work();

		int workID = Integer.parseInt(request.getParameter("work_id"));
		String name = request.getParameter("name");
		String text = request.getParameter("text");

		Date date = null;
		SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd");
		try {
			date = simpleDateFormat.parse(request.getParameter("date"));
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		work.setWork_id(workID);
		work.setName(name);
		work.setText(text);
		work.setDate(date);
		workService.addWork(work);
		return "redirect:listWork.do";
	}

	@RequestMapping("/listWork.do")
	public String listWork(HttpServletRequest request, HttpServletResponse response) {

		// 获取分页参数
		int start = 0;
		int count = 10;

		try {
			start = Integer.parseInt(request.getParameter("page.start"));
			count = Integer.parseInt(request.getParameter("page.count"));
		} catch (Exception e) {
		}

		Page page = new Page(start, count);

		List<Work> works = workService.list(page.getStart(), page.getCount());
		int total = workService.getTotal();
		page.setTotal(total);

		request.setAttribute("works", works);
		request.setAttribute("page", page);
		return "listWork";
	}

	@RequestMapping("/deleteWork.do")
	public String deleteWork(int id) {
		workService.deleteWork(id);
		return "redirect:listWork.do";
	}
	@RequestMapping("/homeworklist.do")
	public String homeworklist(HttpServletRequest request) {
		// 获取分页参数
		int start = 0;
		int count = 10;

		try {
			start = Integer.parseInt(request.getParameter("page.start"));
			count = Integer.parseInt(request.getParameter("page.count"));
		} catch (Exception e) {
		}

		Page page = new Page(start, count);

		List<Work> works = workService.list(page.getStart(), page.getCount());
		int total = workService.getTotal();
		page.setTotal(total);

		request.setAttribute("works", works);
		request.setAttribute("page", page);
		return "homeworklist";
	}


	@RequestMapping("/editWork1.do")
	public ModelAndView editCourse(int work_id) {
		ModelAndView mav = new ModelAndView("editWork");
		Work work = workService.getWork1(work_id);
		mav.addObject("work", work);
		return mav;
	}
	@RequestMapping("/editWork.do")
	public ModelAndView editWork(int id) {
		ModelAndView mav = new ModelAndView("editWork");
		Work work = workService.getWork(id);
		mav.addObject("work", work);
		return mav;
	}
	@RequestMapping("/editWork2.do")
	public ModelAndView editWork(String name) {
		ModelAndView mav = new ModelAndView("editWork");
		Work work = workService.getWork2(name);
		mav.addObject("work", work);
		return mav;
	}

	@RequestMapping("/updateWork.do")
	public String updateWork(HttpServletRequest request, HttpServletResponse response) {
		try {
			request.setCharacterEncoding("utf-8");
			response.setCharacterEncoding("utf-8");
		} catch (UnsupportedEncodingException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
		Work work = new Work();

		int id = Integer.parseInt(request.getParameter("id"));
		int work_id = Integer.parseInt(request.getParameter("work_id"));
		String name = request.getParameter("name");
		String text = request.getParameter("text");

		Date date = null;
		SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd");
		try {
			date = simpleDateFormat.parse(request.getParameter("date"));
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		work.setId(id);
		work.setWork_id(work_id);
		work.setName(name);
		work.setText(text);
		work.setDate(date);

		workService.updateWork(work);
		return "redirect:listWork.do";
	}
	
	
	
	@RequestMapping("/lookHomework.do")
	public String lookHomework(String name,HttpServletRequest request) {
		Work homeTask = workService.getWork2(name);
//		Date start = homeTask.getStartTime();
//		Date now = new Date();
//		Date close = homeTask.getCloseTime();
//		if(start.getTime()>now.getTime()) {
//			request.setAttribute("errorMessage", "作业还未开始，开始后方可打开");
//			return "error";
//		}
//		if(now.getTime()>close.getTime()) {
//			request.setAttribute("errorMessage", "作业已结束！！");
//			return "error";
//		}
		String path = request.getServletContext().getRealPath("/WEB-INF/work/"+name+".text");
		File file = new File(path);
		BufferedReader br = null;
        try {
            InputStreamReader reader = new InputStreamReader(new FileInputStream(file));
             br = new BufferedReader(reader);
             String line = "";
             String text = "";
             while( (line = br.readLine()) != null ){
            	    text=text + line;
            	}
             request.setAttribute("name", name);
             System.out.println(text);
             request.setAttribute("text", text);
        } catch (Exception e) {
            e.printStackTrace();
        }finally{
            if(br != null){
                try {
                    br.close();
                } catch (IOException e) {
                    e.printStackTrace();
                }
            }

        }
        return "homework";
	}
}
