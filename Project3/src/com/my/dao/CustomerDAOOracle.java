package com.my.dao;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DuplicateKeyException;
import org.springframework.jdbc.BadSqlGrammarException;
import org.springframework.stereotype.Repository;

import com.my.vo.Customer;
@Repository
public class CustomerDAOOracle implements CustomerDAO {

	//private SqlSessionFactory sqlSessionFactory;


	@Autowired
	private SqlSession session;

	@Override
	public void singup(Customer c) throws Exception {
		try{
			session.insert("CustomerMapper.signup", c);	
		}catch(DuplicateKeyException e){			
			throw new Exception("이미 존재하는 아이디입니다.");  //강제예외발생시키기.
		}catch(BadSqlGrammarException e){
			throw new Exception("SQL구문 오류!");
		}catch(Exception e){
			e.printStackTrace();
			throw e;
		}
	}


	@Override
	public Customer selectById(String email) throws Exception {

		return session.selectOne("CustomerMapper.selectById", email);	
	}
	
	public void signout (String email){
		session.update("CustomerMapper.signout",email);
	}
	
	public void changepwd (HashMap<String,Object> list ){
		session.update("CustomerMapper.changepwd",list);
	}
	
	public void changenick (HashMap<String,Object> list ){
		System.out.println(list);
		session.update("CustomerMapper.changenick",list);
	}
	
	public int checknickname(String nickname){
		return session.selectOne("CustomerMapper.checknickname",nickname);
	}

	@Override
	public List<Customer> selectAll() throws Exception {
		// TODO Auto-generated method stub
		return null;
	}


	@Override
	public List<Customer> selectByName(String name) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}


	@Override
	public void delete(String id) throws Exception {
		// TODO Auto-generated method stub
		
	}


	@Override
	public void update(Customer c) throws Exception {
		// TODO Auto-generated method stub
		
	}
		

}
