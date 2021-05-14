package com.cainiao.dao;

import java.util.List;

import com.cainiao.pojo.Course;


public interface CourseDao {
	 int getTotal();
	    int addCourse(Course course);
	    void deleteCourse(int id);
	    void updateCourse(Course course);
	    Course getCourse3(int course_id);
	    Course getCourse(int id);
	    Course getCourse1(String name);
	    Course getCourse2(String teacher);
	    List<Course> list(int start, int count);
}
