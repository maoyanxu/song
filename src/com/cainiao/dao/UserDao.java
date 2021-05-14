package com.cainiao.dao;

import org.apache.ibatis.annotations.Param;

import com.cainiao.pojo.User;
public interface UserDao {
	public User findUser(@Param("username") String username,
			                @Param("password") String password);
	public User addUser(@Param("username") String username,
            @Param("password") String password);
	public int editUser(User user);
}
