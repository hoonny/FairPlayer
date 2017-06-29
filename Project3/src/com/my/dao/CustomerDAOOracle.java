package com.my.dao;

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
	public List<Customer> selectAll() throws Exception {

		return session.selectList("CustomerMapper2.selectByAll");
	}

	@Override
	public Customer selectById(String email) throws Exception {

		return session.selectOne("CustomerMapper.selectById", email);	
	}

	@Override
	public List<Customer> selectByName(String name) throws Exception {

		return session.selectList("CustomerMapper2.selectByName",name);


	}
	
	
	public List<Customer> selectBystatus(String status) throws Exception {
		return session.selectList("CustomerMapper2.selectBystatus",status);
	}
	
	public List<Customer> selectBystatusnull() throws Exception {
		return session.selectList("CustomerMapper2.selectBystatusnull");
	}
	
	public void updatestatus(String id, String check) {
		
		if(check.equals("2")){
		session.update("CustomerMapper2.updatestatusd", id);
		}else if (check.equals("1")){
	    session.update("CustomerMapper2.updatestatusb", id);
		}else if (check.equals("3")){
		session.update("CustomerMapper2.updatestatusnull", id);
		}
		
		
	}
	
	
	@Override
	public void delete(String id){

		session.update("CustomerMapper2.delete", id);

	}

	@Override
	public void update(Customer c){
	
	/*	if("".equals(c.getName())){
		session.update("CustomerMapper2.updatepassword",c);	
		}else {
		session.update("CustomerMapper2.update",c);
		}*/
	}

	
	
	

}
