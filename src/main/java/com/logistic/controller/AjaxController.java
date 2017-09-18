package com.logistic.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.logistic.pojo.OrderInfo;
import com.logistic.service.OrderInfoService;

@Controller
public class AjaxController {
	
	@Autowired
	private OrderInfoService orderInfoService;
	@RequestMapping("/checkOrderInfoId")
	@ResponseBody
	public String CheckOrderInfo(String orderInfoId){
		List<OrderInfo> orderInfo = orderInfoService.findOrderByOrderInfoId(orderInfoId);
		if(orderInfo.isEmpty()) {
			return "1";
		}
		return "0";
	}
}
