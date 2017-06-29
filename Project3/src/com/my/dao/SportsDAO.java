package com.my.dao;

import java.io.UnsupportedEncodingException;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.my.vo.Location;



@Repository
public class SportsDAO {

	@Autowired
	private SqlSession session;
	
	
	public List<String> test(){
//	Sports s = new Sports();	
	System.out.println("DAO 들어옴");
	System.out.println("Mapper 실행전");	
	String sports = "당구";
	List<String> s;
	
		s = session.selectList("searchMapper.selectAll", sports );
		System.out.println("Mapper 실행 ");
		System.out.println("결과 : " + s);
		return s;
	
		
	}
	
}
