package com.my.dao;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.my.vo.Like_list;

@Repository
public class Like_listDAO {
	
	@Autowired
	private SqlSession session;
	
	public List<HashMap<String,Object>> list(String email){
		return session.selectList("Like_listMapper.list",email);
	}
	
	public void insert(Like_list list){
		session.insert("Like_listMapper.insert",list);
	}

	public int count(String email){
		return session.selectOne("Like_listMapper.count",email);
	}
	
	public Like_list chk(Like_list list){
		System.out.println("dao 입"); 
		return session.selectOne("Like_listMapper.chk",list);
	}
	
	public void delete(int list_id){
		session.delete("Like_listMapper.delete",list_id);
	}
}
