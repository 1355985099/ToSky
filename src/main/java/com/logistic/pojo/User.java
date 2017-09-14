package com.logistic.pojo;


/**:用户信息
 * @author Administrator
 *
 */
public class User {
    private Integer id;//用户id
    private String username;//用户名
    private String tel;//用户电话号码
    private String password;//用户密码
    private Integer state;//用户状态
    private String email;//邮箱
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getTel() {
		return tel;
	}
	public void setTel(String tel) {
		this.tel = tel;
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
    
}
