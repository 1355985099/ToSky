package com.logistic.service;

import java.util.Date;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.util.StringUtils;

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
		if(!user.getTel().matches("^1[3|5][0-9]\\d{4,8}$")) {
			throw new MsgException("请输入真确的手机号");
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
	//@Transactional
	public void activateUser(String userId) throws MsgException {
		UserAging userAging = userMapper.finAging(userId);
		if(userAging==null) {
			throw new MsgException("您还没有注册请点击以下连接进行注册,home/reg");
		}
		if(userAging.getState()==1) {
			throw new MsgException("您的帐号以激活请点击以下连接进行登录,home/login");
		}
		if(System.currentTimeMillis()>userAging.getActivateAging().getTime()&&userAging.getState()==0) {
			throw new MsgException("您的连接已超时请点击以下重新发送激活邮件,login/timeout/"+userAging.getUserId()) ;
		}
		//修改状态
		userMapper.updateUserActivateState(userId, 1);
		userMapper.updateUserState(userId, 1);
	}
	
	public User sendEmail(String userId) {
		User user=userMapper.findUser(userId);
		Date aging=new Date(System.currentTimeMillis()+1000*60*60);
		userMapper.updateAging(aging, userId);//更新时间
		String html=eu.simpleHtml(user.getUserName(),"http://localhost/login/activate/"+user.getUserId()
		, aging);
		eu.sendHtmlMail(user.getEmail(), "欢迎"+user.getUserName()+"使用通天快递", html); 
		return user;
	}

	@Override
	public User Login(String userName, String password) throws MsgException {
	   	if(StringUtils.isEmpty(userName)) {
	   		throw new MsgException("用户名不能为空");
    	}
     	if(StringUtils.isEmpty(password)) {
     		 throw new MsgException("密码不能为空");
    	}
     	if(password.length()<8) {
    		 throw new MsgException("密码长度不能小于8");
     	}
    	
		User user = userMapper.Login(userName, password);
		if(user==null) {
			 throw new MsgException("用户名或密码错误");
		}
		return user;
	}

	@Override
	public String isRepeat(String vf) {
		String[] vfs=vf.split(",");
		if(userMapper.isRepeat(vfs[0],vfs[1]).size()<=0) {
			return "true";
		}
		return "false";
	/*	System.out.println(i++);
		if(! vf.split(",")[1].equals("1@qq.com")) {
			return "true";      //返回true 表示没有
		}
		return "false";*/
	
	}

}
