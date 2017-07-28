package com.bitschool.dao;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

@Repository
public class PlaceDAO implements IPlaceDAO {
	
	//----------------------------------------------- 설 정 -----------------------------------------------//
	
	// [맵핑]
	private static final String namespace = "com.bitschool.basic.PlaceMapper";
		
	// [주입] Sqlsession > Mybatis 실행 객체
	@Inject
	private SqlSession session;	
	
	
	//----------------------------------------------- 모임공간 -----------------------------------------------//
	
	// [광고주 회원] 모임공간 등록
	
	
}
