package com.logistic.pojo;

public class OrderInfo {
	private String orderInfoId;//运单号,自动生成
	private Integer price;//运费
	private Integer number;//货物数量
	
	private String sendTel;//发货人电话号码
	private String sendName;//发货人姓名
	private String sendAddress;//发货人地址
	
	private String receiveTel;//收货人电话号码
	private String receiveName;//收货人姓名
	private String receiveAddress;//收货人地址
	
	private String cargoName;//货物名称
	private Integer weigth;//货物重量
	private Integer volume;//货物体积
	public String getOrderInfoId() {
		return orderInfoId;
	}
	public void setOrderInfoId(String orderInfoId) {
		this.orderInfoId = orderInfoId;
	}
	public Integer getPrice() {
		return price;
	}
	public void setPrice(Integer price) {
		this.price = price;
	}
	public Integer getNumber() {
		return number;
	}
	public void setNumber(Integer number) {
		this.number = number;
	}
	public String getSendTel() {
		return sendTel;
	}
	public void setSendTel(String sendTel) {
		this.sendTel = sendTel;
	}
	public String getSendName() {
		return sendName;
	}
	public void setSendName(String sendName) {
		this.sendName = sendName;
	}
	public String getSendAddress() {
		return sendAddress;
	}
	public void setSendAddress(String sendAddress) {
		this.sendAddress = sendAddress;
	}
	public String getReceiveTel() {
		return receiveTel;
	}
	public void setReceiveTel(String receiveTel) {
		this.receiveTel = receiveTel;
	}
	public String getReceiveName() {
		return receiveName;
	}
	public void setReceiveName(String receiveName) {
		this.receiveName = receiveName;
	}
	public String getReceiveAddress() {
		return receiveAddress;
	}
	public void setReceiveAddress(String receiveAddress) {
		this.receiveAddress = receiveAddress;
	}
	public String getCargoName() {
		return cargoName;
	}
	public void setCargoName(String cargoName) {
		this.cargoName = cargoName;
	}
	public Integer getWeigth() {
		return weigth;
	}
	public void setWeigth(Integer weigth) {
		this.weigth = weigth;
	}
	public Integer getVolume() {
		return volume;
	}
	public void setVolume(Integer volume) {
		this.volume = volume;
	}
	

}
