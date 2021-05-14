package com.cainiao.service;

import java.util.List;

import com.cainiao.pojo.Work2;


public interface WorkService2 {
	 int getTotal();
	    int addWork(Work2 work);
	    Work2 getWork(int id);
	    List<Work2> list(int start, int count);
}
