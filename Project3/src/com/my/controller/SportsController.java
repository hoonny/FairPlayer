package com.my.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.my.dao.SportsDAO;
import com.my.vo.Location;

@Controller
public class SportsController {

	@Autowired
	private SportsDAO dao;
	
	
	@RequestMapping("test.do")
	public void test( ){
		System.out.println("test.do 들어옴");
//		Sports s =  dao.test();
		
		List<String> s = dao.test();
		System.out.println("다시 Controller");
//		System.out.println(s.getCenter_name() + " / " + s.getSport_name());
		for(String a : s){
			System.out.println(a);
		}
	}
}
