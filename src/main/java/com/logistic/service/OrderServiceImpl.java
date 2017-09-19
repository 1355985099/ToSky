package com.logistic.service;

import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.logistic.mapper.OrderInfoMapper;
import com.logistic.mapper.OrderMapper;
import com.logistic.pojo.OrderInfo;

@Service
public class OrderServiceImpl implements OrderService{
	@Autowired
	private OrderMapper orderMapper;
	@Autowired
	private OrderInfoMapper orderInfoMapper;


	@Override/**客户下单信息保存*/
	public void saveInfo(OrderInfo orderInfo) {
		orderInfo.setOrderInfoId(UUID.randomUUID().toString());
		orderInfo.setPrice(orderInfo.getPrice());
		orderInfo.setVolume(orderInfo.getVolume());
		orderMapper.saveInfo(orderInfo);//将订单信息插入订单表
		orderInfoMapper.saveInfo(orderInfo);//将订单信息插入订单详细信息表
	}

	

}
