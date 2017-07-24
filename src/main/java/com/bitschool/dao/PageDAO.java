package com.bitschool.dao;

import java.sql.SQLException;
import java.util.HashMap;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

@Repository
public class PageDAO implements IPageDAO {
	
	
	private static final String namespace = "com.bitschool.PageMapper";
	
	@Inject
	private SqlSession session;
	
	@Override
	public int selectCountAll() throws SQLException{
		int total = 0;
		total = session.selectOne(namespace+".count");
		return total;
	}
	
	
	@Override
	public int selectSearchCount(String query, String boardName) throws SQLException{// 페이징 부분
		int total = 0;
		HashMap<String, String> map = new HashMap<String, String>();
		map.put("query", query);
		map.put("boardName", boardName);
		total = session.selectOne(namespace+".searchCount", map);
		System.out.println("총 page 수 : "+total);
		return total;
	}
	
}
