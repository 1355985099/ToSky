package com.logistic.service;

import java.util.Date;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.logistic.Exception.MsgException;
import com.logistic.mapper.UserMapper;
import com.logistic.pojo.User;
import com.logistic.pojo.UserAging;
import com.logistic.tool.EmailUtils;

@Service
public class LoginServiceImpl implements LoginService {
	@Autowired
	private EmailUtils eu;
	@Autowired // userMapper对象应该由spring创建
	private UserMapper userMapper;

	@Override
	public void registerUser(User user)  throws MsgException {
		if (!user.getPassword().equals(user.getPassword2())) {
			throw new MsgException("密码不一致");
		}
		if(!user.getEmail().matches("[\\w\\.\\-]+@([\\w\\-]+\\.)+[\\w\\-]+")) {
			throw new MsgException("邮箱格式错误");
		}
		//TODO 邮箱有效性校验
		user.setUserId(UUID.randomUUID().toString());
		user.setState(0);
		userMapper.saveUser(user);  //保存用户
		Date aging=new Date(System.currentTimeMillis()+1000*60*60);
		userMapper.saveAging(user.getUserId(), aging, 0,user.getEmail());
		String html=eu.simpleHtml(user.getUserName(),"http://localhost/login/activate/"+user.getUserId()
							, aging);
		eu.sendHtmlMail(user.getEmail(), "欢迎"+user.getUserName()+"使用通天快递", html); 
	}

	@Override
	@Transactional
	public void activateUser(String userId) throws MsgException {
		UserAging userAging = userMapper.finAging(userId);
		if(userAging==null) {
			throw new MsgException("您还没有注册");
		}
		if(System.currentTimeMillis()>userAging.getActivateAging().getTime()) {
			throw new MsgException("您的连接已超时");
		}
		//修改状态
		userMapper.updateUserActivateState(userId, 1);
		userMapper.updateUserState(userId, 1);
	}

}
