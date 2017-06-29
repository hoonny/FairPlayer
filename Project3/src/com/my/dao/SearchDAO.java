package com.my.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.naming.NamingException;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.my.vo.RepBoard;
import com.my.vo.Sports;

@Repository
public class SearchDAO {
	
	@Autowired
	private SqlSession session;
	
	public List<String> selectSports() throws NamingException{		
		try{
			return session.selectList("searchMapper.selectSports");
		} catch(Exception e){
			throw e;
		}
	}
	
	public List<String> selectBySports(String sport_name) throws NamingException{		
		try{
			return session.selectList("searchMapper.selectBySports", sport_name);
		} catch(Exception e){
			throw e;
		}
	}
	
	public List<HashMap<String, Object>> search(HashMap<String, String> map) throws NamingException{		
		try{
			return session.selectList("searchMapper.search", map);
		} catch(Exception e){
			throw e;
		}
	}
	
	public List<String> selectByGu(String gu) throws NamingException{		
		try{
			return session.selectList("searchMapper.selectByGu", gu);
		} catch(Exception e){
			throw e;
		}
	}
	
	public List<Sports> selectById(int center_id) throws NamingException{		
		try{
			return session.selectList("searchMapper.selectById", center_id);
		} catch(Exception e){
			throw e;
		}
	}

}
