package com.bitschool.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.bitschool.dto.BTempDTO;

@Repository
public class BTempDAO {
	
	private static final String namespace = "com.bitschool.basic.TempMapper";
	@Inject
	private SqlSession session;

	public List<BTempDTO> selectAll() {
		List<BTempDTO> list = session.selectList(namespace+".listAll");
		return list;
	}

}
