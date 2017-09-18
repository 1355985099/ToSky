package com.logistic.controller;

import java.util.List;

import javax.servlet.http.HttpServletResponse;

import org.apache.catalina.servlet4preview.http.HttpServletRequest;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.logistic.pojo.User;
import com.logistic.service.UserService;
import com.logistic.tool.ExportExcelUtils;

@Controller
public class DownLoadController {
	@Autowired
	private UserService userService;
	@RequestMapping("/downLoad")
	public String exportUser(HttpServletRequest request,HttpServletResponse response) throws Exception{
	    String sheetName = "查询信息表";   //导出的Excel名称
	    String [] headers = {"姓名","邮箱","电话"};
	    String [] columns = {"userName","email","tel"};
	    //添加一些数据，大家可以从数据库里读取
	    
	    List<User> list = userService.findAll();
	    ExportExcelUtils<User> util = new ExportExcelUtils<User>();
	    util.export(sheetName,headers,columns,list,request,response);
	    return "redirect:/";
	}

}
