package com.logistic.pojo;

public class Order {

	private String orderId;//订单号
	private String userId;//用户ID
	private Integer state;//订单状态:'1运输中0已签收'
	private String cargoName;//货物名称
	private String remark;//备注信息
	public String getOrderId() {
		return orderId;
	}
	public void setOrderId(String orderId) {
		this.orderId = orderId;
	}
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public Integer getState() {
		return state;
	}
	public void setState(Integer state) {
		this.state = state;
	}
	public String getCargoName() {
		return cargoName;
	}
	public void setCargoName(String cargoName) {
		this.cargoName = cargoName;
	}
	public String getRemark() {
		return remark;
	}
	public void setRemark(String remark) {
		this.remark = remark;
	}
	@Override
	public String toString() {
		return "Order [orderId=" + orderId + ", userId=" + userId + ", state=" + state + ", cargoName=" + cargoName
				+ ", remark=" + remark + "]";
	}

	
}
