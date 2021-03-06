package com.logistic.shiro;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;

import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.AuthenticationException;
import org.apache.shiro.authc.AuthenticationInfo;
import org.apache.shiro.authc.AuthenticationToken;
import org.apache.shiro.authc.SimpleAuthenticationInfo;
import org.apache.shiro.authc.UsernamePasswordToken;
import org.apache.shiro.authz.AuthorizationInfo;
import org.apache.shiro.authz.SimpleAuthorizationInfo;
import org.apache.shiro.realm.AuthorizingRealm;
import org.apache.shiro.subject.PrincipalCollection;
import org.apache.shiro.subject.Subject;
import org.springframework.beans.factory.annotation.Autowired;

import com.logistic.pojo.User;
import com.logistic.service.UserService;
import com.sun.org.apache.xerces.internal.xs.StringList;

public class AuthRealm extends AuthorizingRealm{
	@Autowired
	private UserService userService;
	
	
	@Override
	protected AuthorizationInfo doGetAuthorizationInfo(PrincipalCollection principals) {
		//得到用户对象
//		Subject subject = SecurityUtils.getSubject();
//		String username = subject.getSession().getAttribute("username").toString();
		//根据用户名查询角色信息 
		//List<String> roleList = userService.findRoleByUserName(username);
		
		List<String> roleList = new ArrayList<String>();
		roleList.add("Home");
		roleList.add("服务");
		roleList.add("提供");
		roleList.add("下载");
		roleList.add("About");
		roleList.add("Gallery");
		roleList.add("联系我们");
		//创建授权管理
		SimpleAuthorizationInfo info = new SimpleAuthorizationInfo();
		
		//传入授权管理的集合信息
		info.addStringPermissions(roleList);
		return info;
	}

	@Override
	//登陆认证模块
	protected AuthenticationInfo doGetAuthenticationInfo(AuthenticationToken token) throws AuthenticationException {
		UsernamePasswordToken loginToken =  (UsernamePasswordToken) token;
		String username = loginToken.getUsername();
		User user = userService.findUserByUserName(username);
		AuthenticationInfo info = new SimpleAuthenticationInfo(user,user.getPassword(),this.getName());
		return info;
	}



	
	
	
}
