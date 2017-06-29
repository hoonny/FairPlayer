package com.my.dao;
import java.util.List;

import com.my.vo.Customer;
public interface CustomerDAO{
	/**
	 * 저장하려는 객체의 id가 저장소에 이미 존재하는 경우
	 * "이미 존재하는 아이디입니다"msg를 출력하고 저장안함.
	 * @param c
	 */
	public void singup(Customer c) throws Exception;	
	/**
	 * 전체 고객을 반환한다.
	 * @return
	 */
	public List<Customer> selectAll() throws Exception;
	
	/**
	 * 아이디에 해당하는 고객을 반환한다
	 * @param id 아이디
	 * @return 저장소의 고객객체를 반환한다.
	 *        고객을 찾지 못하면 null을 반환한다.
	 */
	public Customer selectById(String id) throws Exception;
	/**
	 * 이름에 해당하는 고객을 반환한다
	 * @param name 이름
	 * @return
	 */
	public List<Customer> selectByName(String name) throws Exception;
	
	public void delete(String id) throws Exception;
	
	public void update(Customer c) throws Exception;
	

	

	
}







