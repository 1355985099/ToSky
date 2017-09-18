package com.logistic.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.logistic.mapper.OrderInfoMapper;
import com.logistic.pojo.OrderInfo;
@Service
public class OrderInfoServiceImpl implements OrderInfoService {
	@Autowired
	private OrderInfoMapper orderInfoMapper;
	//用户通过订单号查询用户订单信息
	@Override
	public List<OrderInfo> findOrderByOrderInfoId(String orderInfoId) {
		return orderInfoMapper.findOrderByOrderInfoId(orderInfoId);
	}
	
	@Override
	public List<OrderInfo> findOrderByReceiveTel(String receiveTel) {
		return orderInfoMapper.findOrderByReceiveTel(receiveTel);
	}

	@Override  //查询所有订单信息
	public List<OrderInfo> findAll() {
		return orderInfoMapper.findAll();
	}

	@Override
	public OrderInfo findOrderInfoById(String orderInfoId) {
		//根据订单Id查询用户信息
		return orderInfoMapper.findOrderInfoById(orderInfoId);
	}

}
