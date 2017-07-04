package com.my.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Collections;
import java.util.HashMap;
import java.util.HashSet;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Set;

import javax.naming.NamingException;
import javax.servlet.http.HttpSession;
import javax.websocket.EndpointConfig;
import javax.websocket.OnClose;
import javax.websocket.OnMessage;
import javax.websocket.OnOpen;
import javax.websocket.Session;
import javax.websocket.server.ServerEndpoint;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.support.GeneratedKeyHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.my.dao.MatchDAO;
import com.my.dao.SearchDAO;
import com.my.vo.Chat_room;
import com.my.vo.Customer;
import com.my.vo.Match_room;
import com.my.vo.Sports;

@Controller
@ServerEndpoint(value = "/broadcasting", configurator = GetHttpSessionForWebSocket.class)
public class MatchController {
	private static final HashMap<Session, Chat_room> users = new HashMap<>();
	private static final Map<String,Session> sessionMap = new HashMap<String,Session>();
	private static final Map<Session,String> sessionMap2 = new HashMap<Session,String>();
	private static Match_room matchRoom = new Match_room();
	private static int room_no;
	private static String email;
	private static String owner_id;
	
	@Autowired
	SearchDAO sdao;
	@Autowired
	MatchDAO mdao;

	 @OnMessage
	    public void onMessage(String message,Session session) throws IOException {
		 		
		 		String emails = sessionMap2.get(session);
		 		Session sessions = sessionMap.get(emails);
		 		
		    	Chat_room chat1 = users.get(session);
		    	String owner;
		    	String user = null;
		    	int cnt = chat1.getCount();
		    	if(cnt == 1){
		    		owner = chat1.getOwner_id();
		    	}else{
		    		 owner = chat1.getOwner_id();
		    		 user = chat1.getUser_id();
		    	}
		    	if(user != null){
		    		if(emails.equals(owner)) {
			        	sendToOne(message, sessionMap.get(user));
			        } else if(emails.equals(user)){
			        	sendToOne(message, sessionMap.get(owner));
			        }	
		    	}
		    }
	 
	 	private void sendToOne(String message, Session session){
	 		try {
				session.getBasicRemote().sendText(message);
			} catch (IOException e) {
				e.printStackTrace();
			}
	 	}
	    
	    @OnOpen
	    public void onOpen(Session session, EndpointConfig config) throws Exception {
	    	
	    	HashMap<Integer, Object> rooms = matchRoom.getrooms();
			Chat_room chatRoom = new Chat_room();
			chatRoom = (Chat_room) rooms.get(room_no);
			users.put(session,chatRoom);
			sessionMap.put(email, session);
			sessionMap2.put(session,email);
			System.out.println(users.get(session)+"접속");
	    }
	    
	    @OnClose
	    public String onClose(Session session) throws IOException {
	    	Chat_room cr = users.get(session);
	    	String email = sessionMap2.get(session);
	    	System.out.println(email+ "님이 종료하였습니다.");
	    	owner_id = cr.getOwner_id();
	    	System.out.println("방장:"+owner_id);
	    	users.remove(session);
	    	sessionMap.remove(session);
	    	sessionMap2.remove(session);
    	    if(email.equals(owner_id)){
	    		System.out.println("호출햇다.");
	    		return "roomdelete.do";
	    	}
    	return null;
	    }
	    
	    @RequestMapping("roomdelete.do")
	    public void roomdelete(){
	    	try {
	    		System.out.println(owner_id);
				mdao.deleteRoom(owner_id);
			} catch (NamingException e) {
				e.printStackTrace();
			}
	    }
	    
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
	      email = c.getEmail();
	    	  
	      int center_id = 0;
	      int location_id = 0;
	      try {  
	  	    	 Sports id_list = mdao.searchid(center_name);
	  	    	 center_id = id_list.getCenter_id();
	  	    	 location_id = id_list.getLocation_id();
	  	    	 System.out.println(":"+ center_id + ":" + location_id );
	  	    	 
	  	    	 Match_room mr = mdao.selectOwner(email); // Login session을 이용해서 방이 생성됬는지 유무 체크
	  	    	 
	  	    	 if(mr == null){
	  	    		 System.out.println("일단 방이 없으니까 방만들기 수행");
		  	    	 matchRoom.setEmail(email);
		  	    	 matchRoom.setCenter_id(center_id);
		  	    	 matchRoom.setLocation_id(location_id);
		  	    	 matchRoom.setMatch_type(match_type);
		  	    	 matchRoom.setLevel(level);
		  	    	 matchRoom.setOwner(email);
		  	    	 matchRoom.setCount(1);
		  	    	 mdao.roommake(matchRoom);
		  	    	 System.out.println("matchRoom :"+ matchRoom);
		  	    	 
		  	    	 Match_room s_room = mdao.selectOwner(email);
		  	    	 room_no = s_room.getRoom_id();
		  	    	 System.out.println("selectOwner:"+s_room);
		  	    	 matchRoom.make(s_room.getRoom_id(), 1, email);
		  	    	 
		  	    	 model.addAttribute("msg","1");
		  	    	 System.out.println("mr:::"+mr);
	  	    	 } else {
	  	    		 if( mr.getOwner().equals(email)){
	  	    			 model.addAttribute("msg","0");
	  	    		 } // if end
	  	    	 } // if end
	  	    	 
	  	    } catch (NamingException e) {
	         e.printStackTrace();
	      }
	      String forwardURL = "/result.jsp";
	      return forwardURL;
	   }

	@RequestMapping("/roomload.do")
	   public String roomload(HttpSession session, Model model,
			                                      String sport_name, String gu) {
	      Customer c = (Customer)session.getAttribute("loginInfo");
	      System.out.println(sport_name + ":" + gu);
	      String forwardURL = null;
	      try { 
	    	  if(c == null){
	    		  model.addAttribute("msg","0");
	    		  forwardURL = "/result.jsp";
	    	  } else {
	    		 String email = c.getEmail();
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
	 	    	 forwardURL = "/matching.do";
	 	    	 model.addAttribute("sport_name",sport_name);
	 	    	 model.addAttribute("gu",gu);
	    	  }
	      } catch (NamingException e) {
	         e.printStackTrace();
	      }
	      return forwardURL;
	   }

	@RequestMapping("/roomin.do")
	   public String roomIn(HttpSession session, Model model,
			                                      int room_id) throws NamingException {
	      Customer c = (Customer)session.getAttribute("loginInfo");
	      email = c.getEmail();
	      System.out.println("email:::"+email);
	      matchRoom.join(room_id, 1, email);
	      room_no = room_id;
		  model.addAttribute("msg","1");
		  
	      String forwardURL = "/result.jsp";
	      return forwardURL;
	   }	
}
