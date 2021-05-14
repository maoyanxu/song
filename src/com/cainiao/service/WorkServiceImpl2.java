package com.cainiao.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;

import com.cainiao.dao.WorkDao2;
import com.cainiao.pojo.Work2;
@Controller
@Transactional
public class WorkServiceImpl2 implements WorkService2{
@Autowired
private WorkDao2 workDao2;
	@Override
	public int getTotal() {
		// TODO Auto-generated method stub
		return workDao2.getTotal();
	}
	@Override
	public int addWork(Work2 work) {
		// TODO Auto-generated method stub
		return workDao2.addWork(work);
	}
	@Override
	public Work2 getWork(int id) {
		// TODO Auto-generated method stub
		return workDao2.getWork(id);
	}
	@Override
	public List<Work2> list(int start, int count) {
		// TODO Auto-generated method stub
		 return workDao2.list(start, count);
	}

	
}
