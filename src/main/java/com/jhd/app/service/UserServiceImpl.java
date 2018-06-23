package com.jhd.app.service;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jhd.app.beans.User;
import com.jhd.app.mapper.UserMapper;
import com.jhd.app.utils.Md5Utlis;

@Service
public class UserServiceImpl implements UserService{
	
	@Autowired
	private UserMapper userMapper;

	@Override
	public User getUser(Map<String,Object> user) {
		user.put("passWord",Md5Utlis.digest((String) user.get("passWord")));
		return userMapper.getUser(user);
	}

}
