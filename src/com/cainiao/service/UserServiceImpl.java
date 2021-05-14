package com.cainiao.service;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.cainiao.dao.UserDao;
import com.cainiao.pojo.User;
@Service("userService")
@Transactional
public class UserServiceImpl implements UserService {
	@Autowired
	private UserDao userDao;
	@Override
	public User findUser(String username, String password) {
		User user = this.userDao.findUser(username, password);
		return user;
	}
	@Override
	public User addUser(String username, String password) {
		User user = this.userDao.addUser(username, password);
		return null;
	}
	@Override
	public int editUser(User user) {
		// TODO Auto-generated method stub
		return userDao.editUser(user);
	}

}
