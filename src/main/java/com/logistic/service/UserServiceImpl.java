package com.logistic.service;

import com.logistic.Exception.MsgException;
import com.logistic.mapper.UserMapper;
import com.logistic.pojo.User;
import com.logistic.tool.EmailUtils;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Date;
import java.util.List;
import java.util.UUID;


@Service
public class UserServiceImpl implements UserService {
	@Autowired
	private EmailUtils eu;
	@Autowired // userMapper对象应该由spring创建
	private UserMapper userMapper;

	@Override
	public List<User> findAll() {
		return userMapper.findAll();
	}
	


}
