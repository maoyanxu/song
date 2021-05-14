package com.cainiao.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.cainiao.pojo.Student;

public interface StudentDao {
	public Student findStudent(@Param("name") String name,
            @Param("id") int id);
	 int getTotal();
	 
	    int addStudent(Student student);
	    void deleteStudent(int id);
	    Student selectStudent(int id);
	    void updateStudent(Student student);
	    Student getStudent(int id);
	    Student getStudent2(int student_id);
	    Student getStudent1(String name);
	    List<Student> list(int start, int count);
}
