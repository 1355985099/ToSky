package com.logistic.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class EasyUIController {
	@RequestMapping("toEasyUI")
	public String toEasyUI(){
		return "easyui/easyui";
	}
}
