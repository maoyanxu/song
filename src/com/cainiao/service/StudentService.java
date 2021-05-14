package com.cainiao.service;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.cainiao.pojo.Student;
import com.cainiao.pojo.User;

public interface StudentService {

	 
    int getTotal();
 
    int addStudent(Student student);
    public Student findStudent( String name, int id);
    void deleteStudent(int id);
    Student selectStudent(int id);
    void updateStudent(Student student);
 
    Student getStudent2(int student_id);
    Student getStudent(int id);
    Student getStudent1(String name);
 
    /**
     * �оٳ��� start λ�ÿ�ʼ�� count ������
     * @param start
     * @param count
     * @return
     */
    List<Student> list(int start, int count);
}
