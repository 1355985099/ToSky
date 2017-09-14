package com.logistic.controller;

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
	
	//跳转登陆/注册页面
	@RequestMapping("/login/Reg")
	public String tolgin() {
		return "login/login";
	}

	//跳转登陆/注册页面
	@RequestMapping("/reg")
	public String toreg() {
		return "login/reg";
	}
}
