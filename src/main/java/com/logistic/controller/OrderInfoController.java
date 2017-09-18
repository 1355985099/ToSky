package com.logistic.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.logistic.pojo.OrderInfo;
import com.logistic.service.OrderInfoService;

@Controller
public class OrderInfoController {
	@Autowired
	private OrderInfoService orderInfoService;
	
	
	//转向用户订单查询页面
	@RequestMapping("/toOrderListForUser")
	public String toOrderListForUser() {
		
		return "order/toOrderListForUser";
	}
	
	//用户查询订单结果页面
	@RequestMapping("/findOrderByOrderInfoId")
	public String findOrderByOrderInfoId(@RequestParam(value="orderInfoId",required=false)String orderInfoId,Model model) {
		//根据订单号查询用户信息
		List<OrderInfo> orderInfoList = orderInfoService.findOrderByOrderInfoId(orderInfoId);
		model.addAttribute("orderInfoList", orderInfoList);
		model.addAttribute("orderInfoId", orderInfoId);
		return "order/orderListForUserQuery";
	}
	
	//用户通过手机号查询订单信息
	@RequestMapping("/findOrderByReceiveTel")
	public String findOrderByReceiveTel(@RequestParam(value="receiveTel",required=false)String receiveTel,Model model) {
		//根据订单号查询用户信息
		List<OrderInfo> orderInfoList = orderInfoService.findOrderByReceiveTel(receiveTel);
		model.addAttribute("orderInfoList", orderInfoList);
		model.addAttribute("receiveTel", receiveTel);
		return "order/orderListForUserQuery";
	}
	
	//查询所有订单信息
	@RequestMapping("/sysadmin/order/findAll")
	public String findAll(Model model) {
		
		List<OrderInfo> orderInfoList = orderInfoService.findAll();
		model.addAttribute("orderInfoList", orderInfoList);
		return "/sysadmin/order/jOrderInfoList";
	}
	//转到订单信息查看页面
	@RequestMapping("/sysadmin/order/toview")
	public String findOferInfo(String orderInfoId,Model model) {
		
		OrderInfo orderInfo = orderInfoService.findOrderInfoById(orderInfoId);
		model.addAttribute("orderInfo", orderInfo);
		return "/sysadmin/order/jOrderInfoView";
	}
	//转到订单新增页面
	@RequestMapping("/sysadmin/order/tocreate")
	public String toCreate() {
		
		return "/sysadmin/order/jOrderInfoCreate";
	}
	//新增订单信息
	@RequestMapping("/sysadmin/order/tosave")
	public String createOrderInfo(OrderInfo orderInfo) {
		
		
		return "redirect:/sysadmin/order/jOrderInfoList";
	}
}
