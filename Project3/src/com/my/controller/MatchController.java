package com.my.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;

import javax.naming.NamingException;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.my.dao.MatchDAO;
import com.my.dao.SearchDAO;
import com.my.vo.Customer;
import com.my.vo.Match_room;
import com.my.vo.Sports;

@Controller
public class MatchController {
	
	@Autowired
	SearchDAO sdao;
	@Autowired
	MatchDAO mdao;

	@RequestMapping("/matching.do")
	public String searchbar(Model model) {		
		
		try {
			List<String> sport = sdao.selectSports();
			List<String> gu = mdao.searchgu();
			
			System.out.println(sport);
			System.out.println("------");
			System.out.println(gu);
			model.addAttribute("list_sport", sport);
			model.addAttribute("list_gu", gu);
		} catch (NamingException e) {
			e.printStackTrace();
		}
		return "/matching.jsp";
	}
	
	@RequestMapping("/searchcenter.do")
	   public @ResponseBody List<String> searchcenter(HttpSession session, Model model, String sport_name, String gu) {
	      System.out.println(" 종목 : " + sport_name+ " 구 : " + gu);
	      List<String> list = null;
	      HashMap<String, String> map = new HashMap<>();
	      map.put("sport_name", sport_name);
	      map.put("gu", gu);
	      try {         
	         list = mdao.searchcenter(map);
	         System.out.println("업체명:"+ list);
	         model.addAttribute("center_name", list);
	      } catch (NamingException e) {
	         e.printStackTrace();
	      }
	      return list;
	   }
	
	@RequestMapping("/roommake.do")
	   public String roommake(HttpSession session, Model model,
			                                      String center_name, String match_type, String level) {
	      Customer c = (Customer)session.getAttribute("loginInfo");
	      String email = c.getEmail();
	      Match_room m = (Match_room)session.getAttribute("roomInfo"); 
	    	  
	      int center_id = 0;
	      int location_id = 0;
	      try {  
	       if((m == null)){
	    	  model.addAttribute("flagroom","1"); 
	       } else {
	    	   String email2 = m.getEmail();
	    	   if(!(email.equals(email2))){ 
	  	    	 Sports id_list = mdao.searchid(center_name);
	  	    	 center_id = id_list.getCenter_id();
	  	    	 location_id = id_list.getLocation_id();
	  	    	 System.out.println(":"+ center_id + ":" + location_id );
	  	    	 Match_room matchRoom = new Match_room();
	  	    	 matchRoom.setEmail(email);
	  	    	 matchRoom.setCenter_id(center_id);
	  	    	 matchRoom.setLocation_id(location_id);
	  	    	 matchRoom.setMatch_type(match_type);
	  	    	 matchRoom.setLevel(level);
	  	    	 mdao.roommake(matchRoom);
	  	    	 System.out.println(matchRoom);
	  	    	 session.setAttribute("roomInfo", matchRoom);
	  	         } else {
	  	        	 model.addAttribute("roomflag", "1");
	  	         }  
	       }
	      } catch (NamingException e) {
	         e.printStackTrace();
	      }
	      String forwardURL = "/matching.do";
	      return forwardURL;
	   }

	@RequestMapping("/roomload.do")
	   public String roomload(HttpSession session, Model model,
			                                      String sport_name, String gu) {
	      Customer c = (Customer)session.getAttribute("loginInfo");
	      String email = c.getEmail();
	      System.out.println(sport_name + ":" + gu);
	      try { 
	    	 HashMap<String, Object> location = new HashMap<>();
	    	 List<HashMap<String, Object>> roominfo = new ArrayList();
	    	 
	    	 location.put("sport_name", sport_name);
	    	 location.put("gu", gu);
	    	 List<Integer> location_list = mdao.getlocationid(location);
	    	 for(int i : location_list){
	    		 List<HashMap<String, Object>> list =  mdao.roomlist(i);
	    		 for(HashMap<String,Object> t : list){
	    			 roominfo.add(t);  // 중첩이 안돼니까 밖에 roominfo list에 더하는 방식
	    		 }
	    	 }
	    	 for(HashMap<String, Object> l : roominfo){
	    		 System.out.println(l);
	    	 }
	    	 
	    	 model.addAttribute("roomInfo", roominfo);
	    	 
	      } catch (NamingException e) {
	         e.printStackTrace();
	      }
	      String forwardURL = "/matching.do";
	      return forwardURL;
	   }

}
