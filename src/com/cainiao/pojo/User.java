package com.cainiao.pojo;

import java.io.Serializable;

/**
 * 用户持久化类
 */
public class User implements Serializable {
	private static final long serialVersionUID = 1L;
	private Integer user_id;
	private String user_username;
	private String user_password;
	public Integer getUser_id() {
		return user_id;
	}
	public void setUser_id(Integer user_id) {
		this.user_id = user_id;
	}
	public String getUser_username() {
		return user_username;
	}
	public void setUser_username(String user_username) {
		this.user_username = user_username;
	}
	public String getUser_password() {
		return user_password;
	}
	public void setUser_password(String user_password) {
		this.user_password = user_password;
	}
	public static long getSerialversionuid() {
		return serialVersionUID;
	}

	
}
