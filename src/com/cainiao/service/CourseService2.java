package com.cainiao.service;

import java.util.List;

import com.cainiao.pojo.Course2;

public interface CourseService2 {
	 int getTotal();
	    int addCourse(Course2 course);
	    void deleteCourse(int id);
	    void updateCourse(Course2 course);
	    Course2 getCourse(int id);
	    Course2 getCourse3(int course_id);
	    Course2 getCourse1(String name);
	    Course2 getCourse2(String teacher);
	    List<Course2> list(int start, int count);
}
