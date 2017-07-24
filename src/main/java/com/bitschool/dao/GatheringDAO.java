package com.bitschool.dao;

import java.util.HashMap;
import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.bitschool.dto.GatheringDTO;
import com.bitschool.dto.RecommGatherDTO;

@Repository
public class GatheringDAO implements IGatheringDAO {

	private static final String namespace = "com.bitschool.GatheringMapper";
	
	@Inject
	private SqlSession session;
	
	@Override
	public List<GatheringDTO> getGatheringAll() {
		
		List<GatheringDTO> gList = null;
		gList = session.selectList(namespace+".getherAll");
		return gList;
	}

	@Override
	public GatheringDTO getGathering(int gatherNo) {
		
		GatheringDTO gdto = null;
		gdto = session.selectOne(namespace+".getherOne", gatherNo);
		
		return gdto;
	}

	@Override
	public List<GatheringDTO> getGatheringCheck(List<String> cList, List<String> aList, String sSelect, String sSTR) {

		HashMap<String, Object> list = new HashMap<String, Object>();
		list.put("cList", cList);
		list.put("aList", aList);
		list.put("sSelect", sSelect);
		list.put("sSTR", sSTR);
		
		List<GatheringDTO> gList = null;
		gList = session.selectList(namespace+".getherCheck", list);
		
		
		return gList;
	}

	@Override
	public boolean insertGathering(HashMap<String, Object> map) {

		boolean flag = false;
		
		int result = session.insert(namespace+".insertGather", map);
		
		if(result>0){
			flag = true;
		}
		
		return flag;
	}

	@Override
	public List<GatheringDTO> selectPartiList(String guserId) {

		List<GatheringDTO> glist = null;
		
		glist = session.selectList(namespace+".partiList", guserId);
		
		System.out.println("dao의 : "+glist);
		
		return glist;
	}

	@Override
	public List<GatheringDTO> selectMakeList(String guserId) {
		List<GatheringDTO> mlist = null;
		
		mlist = session.selectList(namespace+".makeList", guserId);
		
		System.out.println("dao의 : "+mlist);
		
		return mlist;
	}

	@Override
	public boolean mergeList(List<RecommGatherDTO> recommgatherList) {

		boolean flag = false;
		/*
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("recommgatherList", recommgatherList);
		*/
		
		System.out.println("사용자 누른 갯수 : "+recommgatherList.size());
		
		int cnt = 0;
		
//		이부분 강사님께 여쭤보기
		
		for(int i=0; i<recommgatherList.size(); i++){
			System.out.println("["+i+"] : "+recommgatherList.get(i));
			cnt = session.update(namespace+".mergeList",  recommgatherList.get(i));
		}
		
		if(cnt>0){
			flag=true;
		}
		
		return flag;
	}

	@Override
	public List<GatheringDTO> getRecommAll(String guserId) {

		List<GatheringDTO> recommList = null;
		recommList = session.selectList(namespace+".recommAll", guserId);
		
		return recommList;
	}
	
}
