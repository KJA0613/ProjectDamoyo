package com.bitschool.dao;


import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;


@Repository
public class SessionDAO {

	private static final String namespace  = "com.bitschool.VisitorMapper";
	
	@Inject
	private SqlSession session; 
	
	public int setVisitor() { 
		
		int result = session.insert(namespace+".insertVisitor");
		
		return result;
	}
	
	public int getToday(){
		int todayCount = 0;
		todayCount = session.selectOne(namespace+".selectToday");
		
		return todayCount;
	}
	
	public int getTotal(){
		int totalCount = 0;
		totalCount = session.selectOne(namespace+".selectTotal");
		
		return totalCount;
	}

	public boolean checkAlarm(String loginId) {

		int result = session.selectOne(namespace+".checkAlarm", loginId);

		boolean flag = false;
		
		if(result>0){
			flag = true;
		}
		
		return flag;
	}
	
}
