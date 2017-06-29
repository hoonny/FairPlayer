package com.my.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.my.dao.BoardDAOOracle;
import com.my.dao.CustomerDAO;
import com.my.vo.Customer;
import com.my.vo.RepBoard;

@Controller
public class CustomerController {
	//test
	@Autowired
	private CustomerDAO dao;
	
	@RequestMapping(value="/login.do", method=RequestMethod.POST)
	public String login(HttpServletRequest request, Model model, String id, String pwd, HttpSession session){
		String msg = "";
		Customer c;
		
		session.removeAttribute("loginInfo");
		
		try {
			c = dao.selectById(id);		//id1의 객체
			String password = c.getPassword(); //id1의 비밀번호
			if(password .equals(pwd)) {	
				msg = "1";
				session.setAttribute("loginInfo", c);
			} else {
				msg = "2";
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		
		
		model.addAttribute("msg", msg);
		String forwardURL = "/result.jsp";
		return forwardURL;
	}

	@RequestMapping("/logout.do")
	public String logout(Model model, HttpSession session, HttpServletRequest request){
		session.removeAttribute("loginInfo");
		model.addAttribute("msg", request.getContextPath());
		
		String forwardURL = "main.jsp";
		return forwardURL;
	}

	
	@RequestMapping(value= "/signup.do", method=RequestMethod.POST)
	public String signup(Model model, String email, String name, String nick, String pwd, String repwd, String tel, String tel1, String tel2){
		String msg="";
		String status = "a";

		if( email == null || nick == null || pwd == null || repwd == null || tel == null || tel1 == null || tel2 == null){
			msg = "2";
		} else {

			try {
				String num = tel+"-"+tel1+"-"+tel2;
				Customer c = new Customer();
				c.setEmail(email);
				c.setCustomer_name(name);
				c.setNickname(nick);
				c.setPassword(pwd);
				c.setStatus(status);
				c.setCall_no(num);
				dao.singup(c);
				msg = "1";
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		
		model.addAttribute("msg", msg);
		
		String forwradURL="/result.jsp";
		return forwradURL;
	}

	@RequestMapping("/dupchkid.do")
	public String dupchkid(String email, Model model)
			throws IOException, ServletException {


		String msg = "";


		Customer c;
		try {
			c = dao.selectById(email);	
			if(c == null){
				msg = "1";		//selectById한값에 id가 없을 경우 1을 전송
			} else {
				msg = "-1";		//그 반대.
			}
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (Exception e) {
			e.printStackTrace();
		}

		

		model.addAttribute("msg", msg); //다른객체가 쓸 수 있게 메모리영역에 저장
		String forwardURL="result.jsp";
		return forwardURL;
	}
	
	
	

}
