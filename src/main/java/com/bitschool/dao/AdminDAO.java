package com.bitschool.dao;

import java.util.HashMap;
import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.bitschool.dto.AlarmDTO;
import com.bitschool.dto.CompanyDTO;
import com.bitschool.dto.GatherRankDTO;
import com.bitschool.dto.GatherPeopleDTO;
import com.bitschool.dto.GatheringDTO;
import com.bitschool.dto.PersonDTO;
import com.bitschool.dto.VisitorTimeDTO;
import com.bitschool.dto.VisitorWeekDTO;

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
	
	public List<GatherPeopleDTO> getGather() {

		List<GatherPeopleDTO> gpdto = null;
		
		gpdto = session.selectList(namespace+".getGather");
		
		return gpdto;
	}

	@Override
	public List<GatheringDTO> getGatherInfo(String guserId) {

		List<GatheringDTO>	gather = session.selectList(namespace+".gatherInfo", guserId);		
		
		return gather;
	}

	@Override
	public List<VisitorWeekDTO> visitWeek() {
		
		List<VisitorWeekDTO> week = null;
		week = session.selectList(namespace+".visitWeek");
		
		return week;
	}

	@Override
	public List<VisitorTimeDTO> visitTime() {
		
		List<VisitorTimeDTO> time = null;
		time = session.selectList(namespace+".visitTime");
		
		return time;
	}

	@Override
	public List<GatherPeopleDTO> getGatherNoPeople(int gatherNo) {

		List<GatherPeopleDTO> gpList = null;
		gpList = session.selectList(namespace+".getGatherNoPeople",gatherNo);
		
		return gpList;
	}

	@Override
	public boolean setRecognition(List<AlarmDTO> alarmList) {
		
		int result = 0;
		
		for(int i=0; i<alarmList.size(); i++){
			result += session.insert(namespace+".setRecognition", alarmList.get(i));
		}
		
		boolean flag = false;
		System.out.println(result+"=="+alarmList.size());
		if(result==alarmList.size()){
			flag=true;
		}
		
		return flag;
	}


	

}
