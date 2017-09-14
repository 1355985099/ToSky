package com.logistic.pojo;

import java.util.Date;

/**:用户详细信息
 * @author Administrator
 *
 */
public class UserInfo {
	private String userInfoId;//用户ID
	private String name;//真实姓名
	private String cardNo;//身份证号
    private UserInfo manager;//上级领导
    private Date joinDate;//入职时间
    private Integer salary;//薪资
    private String gender;//性别
    private String tel;//电话
    private String userLevel;//用户等级:4-普通用户 3-部门经理 2-副总 1-总经理 0-超级管理员
	public String getUserInfoId() {
		return userInfoId;
	}
	public void setUserInfoId(String userInfoId) {
		this.userInfoId = userInfoId;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getCardNo() {
		return cardNo;
	}
	public void setCardNo(String cardNo) {
		this.cardNo = cardNo;
	}
	public UserInfo getManager() {
		return manager;
	}
	public void setManager(UserInfo manager) {
		this.manager = manager;
	}
	public Date getJoinDate() {
		return joinDate;
	}
	public void setJoinDate(Date joinDate) {
		this.joinDate = joinDate;
	}
	public Integer getSalary() {
		return salary;
	}
	public void setSalary(Integer salary) {
		this.salary = salary;
	}
	public String getGender() {
		return gender;
	}
	public void setGender(String gender) {
		this.gender = gender;
	}
	public String getTel() {
		return tel;
	}
	public void setTel(String tel) {
		this.tel = tel;
	}
	public String getUserLevel() {
		return userLevel;
	}
	public void setUserLevel(String userLevel) {
		this.userLevel = userLevel;
	}
    
}
