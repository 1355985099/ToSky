package com.logistic.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.logistic.pojo.Dept;
import com.logistic.service.MapService;

@Controller
public class MapController {

	@Autowired
	private MapService mapservice;
	
	@RequestMapping("/findMap")
	public String find(Model model) throws Exception{
		
		List<Dept> mapList= mapservice.findMap();
		//将上面内容转换成JSON字符串。
		ObjectMapper objectMapper = new ObjectMapper();
		String maplist = objectMapper.writeValueAsString(mapList);

		model.addAttribute("mapList",mapList);//用于页面显示
		model.addAttribute("maplist",maplist);//用于js接收处理
		return "ip";
	}
	
}
