package com.cainiao.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;

import com.cainiao.dao.WorkDao;
import com.cainiao.pojo.Work;
@Controller
@Transactional
public class WorkServiceImpl implements WorkService{
@Autowired
private WorkDao workDao;
	@Override
	public int getTotal() {
		// TODO Auto-generated method stub
		return workDao.getTotal();
	}

	@Override
	public int addWork(Work work) {
		// TODO Auto-generated method stub
		return workDao.addWork(work);
	}

	@Override
	public void deleteWork(int id) {
		// TODO Auto-generated method stub
		workDao.deleteWork(id);
	}

	@Override
	public void updateWork(Work work) {
		// TODO Auto-generated method stub
		workDao.updateWork(work);
	}

	@Override
	public Work getWork(int id) {
		// TODO Auto-generated method stub
		return workDao.getWork(id);
	}

	@Override
	public List<Work> list(int start, int count) {
		// TODO Auto-generated method stub
		return workDao.list(start, count);
	}

	@Override
	public Work getWork1(int work_id) {
		// TODO Auto-generated method stub
		return workDao.getWork1(work_id);
	}

	@Override
	public Work getWork2(String name) {
		// TODO Auto-generated method stub
		return workDao.getWork2(name);
	}

}
