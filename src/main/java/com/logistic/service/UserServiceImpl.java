package com.logistic.service;

import com.logistic.Exception.MsgException;
import com.logistic.mapper.UserMapper;
import com.logistic.pojo.User;
import com.logistic.tool.EmailUtils;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

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
	
	@Override
	public void saveUser(User user) throws MsgException {
		if (!user.getPassword().equals(user.getPassword2())) {
			throw new MsgException("密码不一致");
		}
		if(!user.getEmail().matches("[\\w\\.\\-]+@([\\w\\-]+\\.)+[\\w\\-]+")) {
			throw new MsgException("邮箱格式错误");
		}
		eu.sendHtmlMail("  @qq.com", "你好", user.getEmail());
	}

}
