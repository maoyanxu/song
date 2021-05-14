package com.cainiao.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.cainiao.dao.StudentDao;
import com.cainiao.pojo.Student;
import com.cainiao.pojo.User;

@Service
@Transactional
public class StudentServiceImpl implements StudentService{
	 @Autowired
	    StudentDao studentDao;
	 
	    public int getTotal() {
	        return studentDao.getTotal();
	    }
	 
	    public int addStudent(Student student) {
	        return studentDao.addStudent(student);
	    }
	 
	    public void deleteStudent(int id) {
	        studentDao.deleteStudent(id);
	    }
	 
	    public void updateStudent(Student student) {
	        studentDao.updateStudent(student);
	    }
	 
	    public Student getStudent(int id) {
	        return studentDao.getStudent(id);
	    }
	    public Student getStudent2(int student_id) {
	    	return studentDao.getStudent2(student_id);
	    }
	    public Student getStudent1(String name) {
	    	return studentDao.getStudent1(name);
	    }
	 
	    public List<Student> list(int start, int count) {
	        return studentDao.list(start, count);
	    }
		public Student selectStudent(int id) {
			  return studentDao.selectStudent(id);
		}

		@Override
		public Student findStudent(String name, int id) {
			Student student = this.studentDao.findStudent(name, id);
			return student;
		}

		
}
