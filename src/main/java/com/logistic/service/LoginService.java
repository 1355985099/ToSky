package com.logistic.service;


import com.logistic.Exception.MsgException;
import com.logistic.pojo.User;

public interface LoginService {
	void registerUser(User usr) throws MsgException;

	void activateUser(String userId) throws MsgException;
	 User sendEmail(String userId);
	 User Login(String userName,String password) throws MsgException;
	 String isEmailRepeat(String email);
}
