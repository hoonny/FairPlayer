package com.my.controller;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.my.dao.Like_listDAO;
import com.my.vo.Customer;
import com.my.vo.Like_list;

@Controller
public class Like_listController {

	@Autowired
	private Like_listDAO dao;
	

	@RequestMapping("like_list.do")
	public String list(Model model, HttpSession session){
		
		Customer c = (Customer)session.getAttribute("loginInfo");
		String s = c.getEmail();
		List<HashMap<String,Object>> list = dao.list(s);
		for(HashMap<String,Object> list1 : list ) {
			System.out.println(list1);
		}
		model.addAttribute("list",list);
		return "like_list.jsp";
	}

	@RequestMapping("/searchlike.do")
	public String searchlike(Model model,HttpSession session ,int center_id) {
		Customer c = (Customer)session.getAttribute("loginInfo");
		String user = c.getEmail();
		String msg = "";
		int count = dao.count(user);
		
		if(count < 5){
			Like_list list = new Like_list();
			list.setCenter_id(center_id);
			list.setEmail(user);
			Like_list chk = dao.chk(list);
			System.out.println(chk);
			if(chk == null){
				dao.insert(list);
				msg = "1";	
			}else{
				msg = "2";
			}
		}else{
			msg = "3";	
		}
		model.addAttribute("msg",msg);
//		return "/search.jsp";
		return "result.jsp";
	}
	
	@RequestMapping("likedelete")
	public String delete(Model model, int list_id){
		
		System.out.println(list_id);
		dao.delete(list_id);
		String msg = "1";
		return "like_list.do";
	}
}
