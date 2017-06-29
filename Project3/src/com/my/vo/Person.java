package com.my.vo;

import java.io.Serializable;

public class Person implements Serializable{

	private static final long serialVersionUID = 7421685912565278401L;
	private String name;
	public String getName() {
		return name;
	}
	public void setName(String name){
		this.name = name;
	}
	
}
