package com.logistic.pojo;

import java.util.Date;

public class UserAging {
	private String userId;
	private String email; 
	private Date activateAging;
	private Integer state;
	
	
	
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public Date getActivateAging() {
		return activateAging;
	}
	public void setActivateAging(Date activateAging) {
		this.activateAging = activateAging;
	}
	public Integer getState() {
		return state;
	}
	public void setState(Integer state) {
		this.state = state;
	}
	@Override
	public String toString() {
		return "UserAging [userId=" + userId + ", email=" + email + ", activateAging=" + activateAging + ", state="
				+ state + "]";
	}
	
	
}
