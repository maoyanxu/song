package com.cainiao.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.cainiao.dao.CourseDao2;
import com.cainiao.pojo.Course2;
@Service
@Transactional
public class CourseServiceImpl2 implements CourseService2{
 @Autowired
  private CourseDao2 courseDao2;
	@Override
	public int getTotal() {
		// TODO Auto-generated method stub
		return courseDao2.getTotal();
	}

	@Override
	public int addCourse(Course2 course) {
		// TODO Auto-generated method stub
		return courseDao2.addCourse(course);
	}

	@Override
	public void deleteCourse(int id) {
		courseDao2.deleteCourse(id);
	}

	@Override
	public void updateCourse(Course2 course) {
        courseDao2.updateCourse(course);		
	}

	@Override
	public Course2 getCourse(int id) {
		// TODO Auto-generated method stub
		return courseDao2.getCourse(id);
	}
	@Override
	public Course2 getCourse3(int course_id) {
		// TODO Auto-generated method stub
		return courseDao2.getCourse3(course_id);
	}
	@Override
	public Course2 getCourse1(String name) {
		// TODO Auto-generated method stub
		return courseDao2.getCourse1(name);
	}
	@Override
	public Course2 getCourse2(String teacher) {
		// TODO Auto-generated method stub
		return courseDao2.getCourse2(teacher);
	}

	@Override
	public List<Course2> list(int start, int count) {
		// TODO Auto-generated method stub
		return courseDao2.list(start, count);
	}

}
