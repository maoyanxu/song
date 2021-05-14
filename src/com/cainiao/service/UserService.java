package com.cainiao.service;
import com.cainiao.pojo.User;
public interface UserService {
	public User findUser(String username,String password);
	
	public User addUser(String username,String password);
	public int editUser(User user);
}
