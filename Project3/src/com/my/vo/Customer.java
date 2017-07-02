package com.my.vo;

public class Customer  {
	private String email;
	private String customer_name;
	private String nickname;
	transient private String password;
	private String call_no;
	private String status;
	private int point;
	public Customer() {
		super();
	}
	public Customer(String email, String customer_name, String nickname, String password, String call_no, String status,
			int point) {
		super();
		this.email = email;
		this.customer_name = customer_name;
		this.nickname = nickname;
		this.password = password;
		this.call_no = call_no;
		this.status = status;
		this.point = point;
	}
	/**
	 * 회원가입용
	 * @param email
	 * @param customer_name
	 * @param nickname
	 * @param password
	 * @param call_no
	 * @param status
	 */
	public Customer(String email, String customer_name, String nickname, String password, String call_no, String status){
		super();
		this.email = email;
		this.customer_name = customer_name;
		this.nickname = nickname;
		this.password = password;
		this.call_no = call_no;
		this.status = status;
	}
	/**
	 * 카카오 로그인용 메서드
	 * @param email
	 * @param nickname
	 * @param password
	 */
	public Customer(String email, String nickname, String password){
		super();
		this.email = email;
		this.password = password;
		this.nickname = nickname;
	}
	
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getCustomer_name() {
		return customer_name;
	}
	public void setCustomer_name(String customer_name) {
		this.customer_name = customer_name;
	}
	public String getNickname() {
		return nickname;
	}
	public void setNickname(String nickname) {
		this.nickname = nickname;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getCall_no() {
		return call_no;
	}
	public void setCall_no(String call_no) {
		this.call_no = call_no;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	public int getPoint() {
		return point;
	}
	public void setPoint(int point) {
		this.point = point;
	}
	
	
	public String toString() {
		return "Customer [email=" + email + ", customer_name=" + customer_name + ", nickname=" + nickname + ", call_no="
				+ call_no + ", status=" + status + ", point=" + point + "]";
	}

	
	
	
}