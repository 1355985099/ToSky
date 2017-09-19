package com.logistic.controller;

import javax.servlet.http.HttpSession;

import org.apache.shiro.SecurityUtils;
import org.apache.shiro.subject.Subject;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * 控制主页跳转
 * @author sun
 *
 */
@Controller
public class HomeCotroller {
	
	//访问主机名,自动跳转主页
	@RequestMapping("/")
	public String tohome() {
		return "home";
	}
	@RequestMapping("/home/reg")
	public String toreg() {
		return "login/reg";
	}
	@RequestMapping("/home/login")
	public String tologin() {
		return "login/login";
	}
	@RequestMapping("/home/logout")
	public String logout(HttpSession session) {
		Subject subject = SecurityUtils.getSubject();
		subject.logout();
		session.removeAttribute("sessionUser");
		return "home";
	}
}
