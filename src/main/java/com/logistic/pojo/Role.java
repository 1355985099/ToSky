package com.logistic.pojo;

public class Role {
	private String roleId;//角色ID
	private String name;//角色名称w
	private String remarks;//角色说明
	private Integer orderNo;//排序号
	private Boolean checked;//用于zTree中转化为json
	
	public Boolean getChecked() {
		return checked;
	}
	public void setChecked(Boolean checked) {
		this.checked = checked;
	}
	public String getId(){//用于zTree中获取id字段
		return roleId;
	}
	public String getRoleId() {
		return roleId;
	}
	public void setRoleId(String roleId) {
		this.roleId = roleId;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getRemarks() {
		return remarks;
	}
	public void setRemarks(String remarks) {
		this.remarks = remarks;
	}
	public Integer getOrderNo() {
		return orderNo;
	}
	public void setOrderNo(Integer orderNo) {
		this.orderNo = orderNo;
	}
	
}
