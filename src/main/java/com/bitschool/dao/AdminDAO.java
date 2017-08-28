package com.bitschool.dao;

import java.util.HashMap;
import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.bitschool.dto.CompanyDTO;
import com.bitschool.dto.GatherRankDTO;
import com.bitschool.dto.GatheringDTO;
import com.bitschool.dto.PersonDTO;

@Repository
public class AdminDAO implements IAdminDAO{
	//----------------------------------------------- 설 정 -----------------------------------------------//
	
	// [맵핑]
	private static final String namespace = "com.bitschool.basic.MemberMapper";
		
	// [주입] Sqlsession > Mybatis 실행 객체
	@Inject
	private SqlSession session;
	
	//---------------------------------------------------------------------------------------------------//
	
	
	@Override
	public List<PersonDTO> getPerson() {
		
		List<PersonDTO> pdto = session.selectList(namespace+".getPerson");
		
		return pdto;
	}

	@Override
	public List<CompanyDTO> getCompany() {

		List<CompanyDTO> cdto = session.selectList(namespace+".getCompany");
		
		return cdto;
	}

	@Override
	public List<GatheringDTO> getGatherList() {
		
		List<GatheringDTO> gdto = null;
		
		gdto = session.selectList(namespace+".getGatherList");
		
		return gdto;
	}

	@Override
	public HashMap<String, Integer> gatherplaceCnt() {
		
		HashMap<String, Integer> gpCnt = null;
		gpCnt = session.selectOne(namespace+".gatherpacleCnt");
		return gpCnt;
	}

	@Override
	public List<GatherRankDTO> gatherRank() {

		List<GatherRankDTO> gatherRank = null;
		gatherRank = session.selectList(namespace+".gatherRank");
		return gatherRank;
	}

	

}
