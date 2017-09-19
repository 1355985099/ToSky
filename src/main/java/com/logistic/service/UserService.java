package com.logistic.service;

import java.util.List;

import com.logistic.Exception.MsgException;
import com.logistic.pojo.User;

public interface UserService {
    public List<User> findAll();

	public User findUserByUserName(String username);
}
