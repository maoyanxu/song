package com.cainiao.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.cainiao.dao.CourseDao;
import com.cainiao.pojo.Course;
@Service
@Transactional
public class CourseServiceImpl implements CourseService{
 @Autowired
  private CourseDao courseDao;
	@Override
	public int getTotal() {
		// TODO Auto-generated method stub
		return courseDao.getTotal();
	}

	@Override
	public int addCourse(Course course) {
		// TODO Auto-generated method stub
		return courseDao.addCourse(course);
	}

	@Override
	public void deleteCourse(int id) {
		courseDao.deleteCourse(id);
	}

	@Override
	public void updateCourse(Course course) {
        courseDao.updateCourse(course);		
	}

	@Override
	public Course getCourse(int id) {
		// TODO Auto-generated method stub
		return courseDao.getCourse(id);
	}
	@Override
	public Course getCourse3(int course_id) {
		// TODO Auto-generated method stub
		return courseDao.getCourse3(course_id);
	}
	@Override
	public Course getCourse1(String name) {
		// TODO Auto-generated method stub
		return courseDao.getCourse1(name);
	}
	@Override
	public Course getCourse2(String teacher) {
		// TODO Auto-generated method stub
		return courseDao.getCourse2(teacher);
	}

	@Override
	public List<Course> list(int start, int count) {
		// TODO Auto-generated method stub
		return courseDao.list(start, count);
	}

}
