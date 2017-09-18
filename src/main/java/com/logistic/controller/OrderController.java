package com.logistic.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.logistic.pojo.OrderInfo;
import com.logistic.service.OrderService;

@Controller
public class OrderController {

	
	@Autowired
	private OrderService orderService;
	
	@RequestMapping("/order")
	public String toOrder(Model model) {
		return "/order/orderInfo";
	}
	
	@RequestMapping("/save")
	
	public String toSave(OrderInfo orderInfo){
		orderService.saveInfo(orderInfo);
		return "/order/orderList";
	}
	

}
