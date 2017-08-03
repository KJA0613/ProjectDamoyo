package com.bitschool.dao;

import java.util.HashMap;
import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.bitschool.dto.GatherAddonsDTO;
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
	public List<GatheringDTO> getGatheringAll(String sSTR) {
		List<GatheringDTO> gList = null;
		
		System.out.println("dao 까지 잘 들옴 : "+sSTR);
		
		HashMap<String, String> map = new HashMap<String, String>();
		map.put("sSTR", sSTR);
		
		gList = session.selectList(namespace+".damoyoAll", map);
		
		System.out.println(gList.size());
		
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
		
		return glist;
	}

	@Override
	public List<GatheringDTO> selectMakeList(String guserId) {
		List<GatheringDTO> mlist = null;
		
		mlist = session.selectList(namespace+".makeList", guserId);
		
		return mlist;
	}

	@Override
	public boolean mergeList(List<RecommGatherDTO> recommgatherList) {

		boolean flag = false;
		
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
	public List<GatheringDTO> getRecommUser(String guserId) {

		List<GatheringDTO> recommList = null;
		recommList = session.selectList(namespace+".recommAll", guserId);
		
		return recommList;
	}

	@Override
	public List<GatheringDTO> getRecommDefault() {

		List<GatheringDTO> recommList = null;
		recommList = session.selectList(namespace+".recommDefault");
		return recommList;
	}

	@Override
	public boolean manageAddons(GatherAddonsDTO gadto, String state) {
		
		boolean flag = false;
		
		int result=-1;
		
		System.out.println(gadto);
		
		if(state.equals("insert")){// 이미 값이 존재하면 delete
			result = session.insert(namespace+".insertAddons", gadto);// 이미 값이 존재할 경우 0 리턴
			System.out.println("insert 들어옴 : "+result);
		}else{
			result = session.delete(namespace+".deleteAddons", gadto);
			System.out.println("delete 들어옴 : "+result);
		}
		
		if(result>=0){
			flag=true;
		}
		
		return flag;
	}

	@Override
	public boolean existAddons(GatherAddonsDTO gadto) {
		
		boolean flag = false;
		
		int result = session.selectOne(namespace+".existAddons", gadto);
		
		if(result>0){ // 값이 존재하면
			flag = true; // true == 값이 존재
		}
		
		return flag;
	}

	@Override
	public List<GatheringDTO> getAttendList(String guserId) {

		List<GatheringDTO> attendList = null;
		
		attendList = session.selectList(namespace+".attendGather", guserId);
		
		return attendList;
	}
}
