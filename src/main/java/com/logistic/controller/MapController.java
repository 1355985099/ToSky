package com.logistic.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.logistic.pojo.map;
import com.logistic.service.MapService;

@Controller
public class MapController {

	@Autowired
	private MapService mapservice;
	
	@RequestMapping("/findMap")
	public String find(Model model) throws Exception{
		
		List<String> mapList= mapservice.findMap();
		//将上面内容转换成JSON字符串。
		ObjectMapper objectMapper = new ObjectMapper();
		String maplist = objectMapper.writeValueAsString(mapList);

		for (String map : mapList) {
			System.out.println(map);
		}
		model.addAttribute("maplist",maplist);
		return "ip";
	}
	
}
