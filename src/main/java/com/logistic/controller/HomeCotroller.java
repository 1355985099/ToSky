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

}
