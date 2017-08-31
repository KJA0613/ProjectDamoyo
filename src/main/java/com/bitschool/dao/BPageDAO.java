package com.bitschool.dao;

import java.sql.SQLException;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Repository;

import com.bitschool.dto.BPageVO;
import com.bitschool.dto.BSearchVO;

@Repository
public class BPageDAO {
	private static final Logger logger = LoggerFactory.getLogger(BPageDAO.class);
	private static final String namespace = "com.bitschool.complete.PageMapper";
	
	@Inject
	private SqlSession session;
	
	public int selectCountAll(BPageVO vo) throws SQLException{
		int total = 0;
		total = session.selectOne(namespace+".count", vo);
		return total;
	}
	
	public int selectSearchCount(BSearchVO vo) throws SQLException{
		int total = 0;
		logger.info("vo is {}",vo.getQuery());
		total = session.selectOne(namespace+".searchCount",vo);
		return total;
	}
	
}
