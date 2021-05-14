package com.cainiao.dao;

import java.util.List;

import com.cainiao.pojo.Work;


public interface WorkDao {
	 int getTotal();
	    int addWork(Work work);
	    void deleteWork(int id);
	    void updateWork(Work work);
	    Work getWork(int id);
	    Work getWork1(int work_id);
	    Work getWork2(String name);
	    List<Work> list(int start, int count);
}
