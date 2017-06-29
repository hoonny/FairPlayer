package com.my.dao;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.my.vo.Paging;
import com.my.vo.RepBoard;



@Repository
public class BoardDAOOracle {	//DB와 일하는 메서드들을 모아둠.
	@Autowired
	private SqlSession session;

	public boolean chkPassword(int no, String pwd) throws Exception{

		RepBoard board = new RepBoard();
		board.setNo(no);
		board.setPassword(pwd);
		RepBoard b =session.selectOne("RepBoardMapper.chkpassword", board );

		if(b!=null){
			return true;
		}else 
			return false;
	}

	public void insert(RepBoard board){   //글 작성 메소드

		session.insert("RepBoardMapper.insert", board);

	}
	
	public void setGrp (String email){
		
		int no = session.selectOne("RepBoardMapper.getrepboard_no",email);
		System.out.println("글번호 : " + no);
		session.update("RepBoardMapper.setgrp",no);
	}

	public List<RepBoard> List(Paging paging) throws Exception{ //글 리스트 불러오는 메소드

		return session.selectList("RepBoardMapper.List",paging);


	}

	public void viewsup(int no){		//조회수 업데이트 메소드
		session.update("RepBoardMapper.viewsup", no);
	}


	public RepBoard content(int no){		 //글 내용 보는 메소드
		return session.selectOne("RepBoardMapper.content", no);


	}

	public void update(RepBoard board){   //글 수정하는 메소드

		session.update("RepBoardMapper.update", board);
	}

	public void delete(int no){   //글 수정하는 메소드

		session.delete("RepBoardMapper.delete", no);
	}
	
	
	public void reply(RepBoard board){
		session.insert("RepBoardMapper.reply", board);
	}

	public List<RepBoard> searchByWriter(String nickname){
		return  session.selectList("RepBoardMapper.searchByWriter", nickname);		
	}
	
	public List<RepBoard> searchBySubject(String subject){
		return  session.selectList("RepBoardMapper.searchBySubject", subject);		
	}
	
	public List<RepBoard> searchByContent(String content){
		return  session.selectList("RepBoardMapper.searchByContent", content);		
	}
	
	public int getCount(){
		return session.selectOne("RepBoardMapper.getCount");
	}

	public int getCountbysmt(HashMap<String,String> map){
		return session.selectOne("RepBoardMapper.countbysmt", map);
	}
}
