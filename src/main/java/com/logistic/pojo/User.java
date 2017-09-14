package com.logistic.pojo;

import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;

public class User {
	private String userId;
	@NotNull(message="电话不能为空")
	private String tel;
	@NotNull(message="用户名不能为空")
	@Size(min=2,max=30)
	private String userName;
	@NotNull(message="密码不能为空")
	@Size(min=10,max=20)
	private String password;
	private Integer state;
	@NotNull(message="邮箱不能")
	private String email;
	
	//用于页面表单
	private String password2;
	
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public String getTel() {
		return tel;
	}
	public void setTel(String tel) {
		this.tel = tel;
	}
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public Integer getState() {
		return state;
	}
	public void setState(Integer state) {
		this.state = state;
	}
	@Override
	public String toString() {
		return "User [userId=" + userId + ", tel=" + tel + ", userName=" + userName + ", password=" + password
				+ ", state=" + state + ", email=" + email + ", confirmPassword=" + getPassword2() + "]";
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getPassword2() {
		return password2;
	}
	public void setPassword2(String password2) {
		this.password2 = password2;
	}
	
	
	
	

}
