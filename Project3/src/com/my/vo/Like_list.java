package com.my.vo;

public class Like_list {
	int list_id;
	String email;
	int center_id;
	
	
	public int getList_id() {
		return list_id;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public int getCenter_id() {
		return center_id;
	}
	public void setCenter_id(int center_id) {
		this.center_id = center_id;
	}
	
	@Override
	public String toString() {
		return "Like_list [email=" + email + ", center_id=" + center_id + "]";
	}
	
}
