package com.my.vo;

import java.util.HashMap;

import org.springframework.ui.Model;

public class Match_room {

	private int room_id;
	private String email;
	private int center_id;
	private int location_id;
	private String match_type;
	private String level;
	private String owner;
	private String user;
	private int count;
	
	private static HashMap<Integer, Object> rooms = new HashMap<>();	
	
	public String getOwner() {
		return owner;
	}
	public void setOwner(String owner) {
		this.owner = owner;
	}
	public String getUser() {
		return user;
	}
	public void setUser(String user) {
		this.user = user;
	}
	public int getCount() {
		return count;
	}
	public void setCount(int count) {
		this.count = count;
	}
	public int getRoom_id() {
		return room_id;
	}
	public void setRoom_id(int room_id) {
		this.room_id = room_id;
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
	public int getLocation_id() {
		return location_id;
	}
	public void setLocation_id(int location_id) {
		this.location_id = location_id;
	}
	public String getMatch_type() {
		return match_type;
	}
	public void setMatch_type(String match_type) {
		this.match_type = match_type;
	}
	public String getLevel() {
		return level;
	}
	public void setLevel(String level) {
		this.level = level;
	}
	
	public void make(int room_id, int count, String owner){
		Chat_room chatroom = new Chat_room();
		chatroom.setRoom_id(room_id);
		chatroom.setCount(count);
		chatroom.setOwner_id(owner);
		chatroom.setUser_id(null);
		rooms.put(room_id, chatroom);
		System.out.println(chatroom);
	}
	
	public void join(int room_id, int count, String user){
		if(rooms != null){
			Chat_room chatroom = (Chat_room)rooms.get(room_id);
			System.out.println("user:::" + user);
			chatroom.setUser_id(user);
            chatroom.setCount(count+1);
			rooms.put(room_id, chatroom);
			System.out.println("join : "+chatroom);
		}
	}
	
	public HashMap<Integer, Object> getrooms(){
		return rooms;
	}

	
	@Override
	public String toString() {
		return "Match_room [room_id=" + room_id + ", email=" + email + ", center_id="
				+ center_id + ", location_id=" + location_id + ", match_type=" + match_type + ", level=" + level
				+ ", owner=" + owner + ", user=" + user + ", count=" + count + "]";
	}
	
	
	
	
}
