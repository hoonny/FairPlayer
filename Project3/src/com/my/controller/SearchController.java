package com.my.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.naming.NamingException;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.my.dao.Like_listDAO;
import com.my.dao.SearchDAO;
import com.my.vo.Customer;
import com.my.vo.Sports;

@Controller
public class SearchController {
	
	@Autowired
	SearchDAO dao;
	@Autowired
	Like_listDAO ldao;
	//
	@RequestMapping("/searchdetail.do")
	public String searchdetail(HttpSession session, String sport_name, String gu, String dong, Model model) {
			System.out.println(sport_name +";" +gu +";" +dong);			
			HashMap<String, String> map = new HashMap<>();
			map.put("sport_name", sport_name);
			map.put("gu", gu);
			map.put("dong", dong);
			
			//검색버튼 누르면 selector에 계속 남아있도록
			model.addAttribute("sports", sport_name);
			model.addAttribute("gu", gu);
			model.addAttribute("dong", dong);
			
			try {
				//list전체 목록
				List<HashMap<String,Object>> list = dao.search(map);
				System.out.println("리스트");
				System.out.println("뭐지:"+ list);
				model.addAttribute("list", list);
				
				//sport_name목록
				List<String> list1 = dao.selectSports();
				System.out.println("종목:"+ list1);
				model.addAttribute("sport_name_all", list1);
				
				//gu목록
				List<String> list2 = dao.selectBySports(sport_name);
				System.out.println("구:"+ list2);
				model.addAttribute("gu_all", list2);
				
				//dong목록
				List<String> list3 = dao.selectByGu(gu);
				System.out.println("동:"+ list3);
				model.addAttribute("dong_all", list3);
				
				//좋아요
				Customer c = (Customer)session.getAttribute("loginInfo");
				System.out.println("누구냐:"+c);
				if(c != null){
					String s = c.getEmail();
					System.out.println("이메일:"+s);
					List<HashMap<String,Object>> list4 = ldao.list(s);
					System.out.println(list4);
					model.addAttribute("like_list",list4);
				} 
			} catch (NamingException e) {
				e.printStackTrace();
			}//
			
			String forwardURL = "/search.jsp";			
			return forwardURL;
	}

	@RequestMapping("/searchmain.do")
	public String searchmain(Model model, String sports, String gu,
			@RequestParam(value="dong", defaultValue = "no") String dong, HttpSession session) {
		System.out.println("스포츠 : " + sports + " 구 : " + gu);
		model.addAttribute("sports", sports);
		model.addAttribute("gu", gu);
		if(!(dong.equals("no"))){
			model.addAttribute("dong", dong);	
		}
		
		
		List<String> list = new ArrayList<>();
		
		list.add(sports);
		list.add(gu);
		if(!(dong.equals("no"))){
		list.add(dong);
		}
		session.setAttribute("issports", list);
		String forwardURL = "/main.jsp";			
		return forwardURL;
	}
	
	@RequestMapping("/search.do")
	public String search(Model model, String sports, String gu, String dong, HttpSession session) {
		System.out.println("스포츠 : " + sports + " 구 : " + gu + " 동 : " + dong);
		
	
		try {
			//sport_name목록
			List<String> list1 = dao.selectSports();
			System.out.println("종목:"+ list1);
			model.addAttribute("sport_name_all", list1);
			String sports_i = null;
			String gu_i = null;
			
			List<String> l = (List<String>) session.getAttribute("issports");
			System.out.println("세션(sports)값 : "+ l);
			if(l == null){ //menu에서 들어올시
				model.addAttribute("sports", "당구");
				model.addAttribute("gu", "구로구");
				model.addAttribute("dong", "구로동");
				
				//gu목록
				sports_i = "당구";
				List<String> list2 = dao.selectBySports(sports_i);
				System.out.println("구:"+ list2);
				model.addAttribute("gu_all", list2);
				
				//dong목록
				gu_i = "구로구";
				List<String> list3 = dao.selectByGu(gu_i);
				System.out.println("동:"+ list3);
				model.addAttribute("dong_all", list3);
				
			} else{ // main바에서 들어올시
				
				System.out.println("첫번째 값:"+l.get(0));
				System.out.println("두번째 값:"+l.get(1));
				
				model.addAttribute("sports", l.get(0));
				model.addAttribute("gu", l.get(1));
				model.addAttribute("dong", dong);

				sports_i = l.get(0);
				gu_i = l.get(1);
				
				//gu목록s
				List<String> list2 = dao.selectBySports(sports_i);
				System.out.println("구:"+ list2);
				model.addAttribute("gu_all", list2);
				
				//dong목록
				List<String> list3 = dao.selectByGu(gu_i);
				System.out.println("동:"+ list3);
				model.addAttribute("dong_all", list3);
			}
		} catch (NamingException e) {
			e.printStackTrace();
		}
		String forwardURL = "/search.jsp";			
		return forwardURL;
	}
	
	@RequestMapping("/searchdong.do")
	public @ResponseBody List<String> searchdong(HttpSession session, Model model, String sport_name, String gu) {
		System.out.println(" 종목 : " + sport_name+ " 구 : " + gu);
		List<String> list3 = null;
		try {			
			list3 = dao.selectByGu(gu);
			System.out.println("동:"+ list3);
			model.addAttribute("dong_q", list3);
		} catch (NamingException e) {
			e.printStackTrace();
		}
		return list3;
	}
	
	@RequestMapping("/searchmap.do")
	public String searchmap(Model model, int center_id) {
		System.out.println("center_id :"+ center_id);
		List<Sports> list = null;
		try {
			list = dao.selectById(center_id);
			double latitude = list.get(0).getLatitude();
			double longtitude = list.get(0).getLongitude();
			
			model.addAttribute("latitude", latitude);
			model.addAttribute("longtitude", longtitude);
		} catch (NamingException e) {
			e.printStackTrace();
		}
		String forwardURL = "/search.jsp";
		return forwardURL;
	}
	
	@RequestMapping("/searchreserve.do")
	public String searchreserve(Model model, int booking, String booking_site) {
		System.out.println("booking :"+ booking + "booking_site :"+ booking_site);
		List<Sports> list = null;//
		return null;
	}
}
