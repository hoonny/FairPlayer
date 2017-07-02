package com.my.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.my.dao.SportsDAO;
import com.my.vo.Location;

@Controller
public class SportsController {

	@Autowired
	private SportsDAO dao;
	
	
	@RequestMapping("asdf.do")
	public void test(HttpServletRequest request, Model model, String id, String pwd, HttpSession session,
			@RequestParam(value="flag", defaultValue = "0") int flag,
			@RequestParam(value="nickname", defaultValue = "no") String nickname
			 ){
		System.out.println("test.do 들어옴");
		System.out.println(id + " / " + nickname + " / " +flag);
	}
}
