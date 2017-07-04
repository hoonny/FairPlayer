package com.my.dao;

import java.util.HashMap;
import java.util.List;

import javax.naming.NamingException;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.my.vo.Match_room;
import com.my.vo.Sports;

@Repository
public class MatchDAO {
	
	@Autowired
	private SqlSession session;
	
	public List<String> searchgu() throws NamingException{
		try{
			return session.selectList("LocationMapper.selectGu");
		} catch(Exception e){
			throw e;
		}
	}
	
	public List<String> searchcenter(HashMap<String, String> map) throws NamingException{
		try{
			return session.selectList("Match_roomMapper.findplace", map);
		} catch(Exception e){
			throw e;
		}
	}
	
	public Sports searchid(String center_name) throws NamingException{
		try{
			return session.selectOne("Match_roomMapper.getInformation", center_name);
		} catch(Exception e){
			throw e;
		}
	}
	
	public void roommake(Match_room mr) throws NamingException{
		try{
			session.insert("Match_roomMapper.make", mr);
		} catch(Exception e){
			throw e;
		}
	}
	
	public List<Integer> getlocationid(HashMap<String, Object> sportgu) throws NamingException{
		try{
			return session.selectList("Match_roomMapper.getLocation_id", sportgu);
		} catch(Exception e){
			throw e;
		}
	}
	
	public List<HashMap<String, Object>> roomlist(int location_id) throws NamingException{
		try{
			return session.selectList("Match_roomMapper.list", location_id);
		} catch(Exception e){
			throw e;
		}
	}
	
	public Match_room selectOwner(String email) throws NamingException{
		try{
			return session.selectOne("Match_roomMapper.selectOwner", email);
		} catch(Exception e){
			throw e;
		}
	}
	
	public void deleteRoom(String email) throws NamingException{
		try{
			System.out.println("dao접근 완료");
			session.delete("Match_roomMapper.roomdel", email);
		} catch(Exception e){
			throw e;
		}
	}
}
