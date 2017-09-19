package com.logistic.mapper;

import java.util.List;

import com.logistic.pojo.OrderInfo;

public interface OrderInfoMapper {

	public List<OrderInfo> findOrderByOrderInfoId(String orderInfoId);//根据订单号查询用户信息
	
	public List<OrderInfo> findOrderByReceiveTel(String receiveTel);

	public List<OrderInfo> findAll();//查询所有订单信息

	public OrderInfo findOrderInfoById(String orderInfoId);//根据订单ID查询用户信息

	public void saveInfo(OrderInfo orderInfo);//订单表中查询数据
}
