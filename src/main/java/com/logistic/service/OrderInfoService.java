package com.logistic.service;

import java.util.List;

import com.logistic.pojo.OrderInfo;

public interface OrderInfoService {

	List<OrderInfo> findOrderByOrderInfoId(String orderInfoId);

	List<OrderInfo> findOrderByReceiveTel(String receiveTel);

	List<OrderInfo> findAll();

	OrderInfo findOrderInfoById(String orderInfoId);

}
