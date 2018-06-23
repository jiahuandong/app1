package com.jhd.app.mapper;

import java.util.Map;

import com.jhd.app.beans.User;

public interface UserMapper {
	User getUser(Map<String,Object> user);
}
