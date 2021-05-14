package com.cainiao.dao;

import java.util.List;

import com.cainiao.pojo.Work2;


public interface WorkDao2 {
	 int getTotal();
	    int addWork(Work2 work);
	    Work2 getWork(int id);
	    List<Work2> list(int start, int count);
}
