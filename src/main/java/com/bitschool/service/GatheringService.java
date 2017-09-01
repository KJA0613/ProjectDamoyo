package com.bitschool.service;

import java.util.HashMap;
import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.bitschool.dao.IGatheringDAO;
import com.bitschool.dto.AlarmDTO;
import com.bitschool.dto.GatherAddonsDTO;
import com.bitschool.dto.GatherPeopleDTO;
import com.bitschool.dto.GatheringDTO;
import com.bitschool.dto.RecommGatherDTO;
import com.bitschool.util.FormatData;

@Service
public class GatheringService implements IGatheringService {

	@Inject
	private IGatheringDAO gDao;
	
	private FormatData fData;

	@Override
	public List<GatheringDTO> getGatheringAll() {
		
		List<GatheringDTO> gList = gDao.getGatheringAll();
		fData = new FormatData();
		gList = fData.formatData(gList);

		return gList;
	}

	@Override
	public List<GatheringDTO> getGatheringAll(String sSTR) {
		
		List<GatheringDTO> gList = gDao.getGatheringAll(sSTR);
		fData = new FormatData();
		gList = fData.formatData(gList);

		return gList;
	}

	@Override
	public GatheringDTO getGathering(int gatherNo) {
		
		GatheringDTO gdto = gDao.getGathering(gatherNo);
				
		return gdto;
	}

	@Override
	public List<GatheringDTO> getGatheringCheck(List<String> cList, List<String> aList, List<String> tList, List<String> rList, String sSelect, String sSTR) {
		
		List<GatheringDTO> gList = gDao.getGatheringCheck(cList, aList, tList, rList, sSelect, sSTR);
		
		return gList;
	}

	@Override
	public boolean GatheringInsert(HashMap<String, Object> map) {
		
		boolean flag = gDao.insertGathering(map);
				
		if(flag){ // 게시글 삽입 성공하면
			// 로그인정보(PersonDTO)를 ==> GatherPeopleDTO로 변경하여 넣기  =========== 여기서는 메소드 생성
			flag =	gDao.insertGatherReader(map);
		
			// 메서드에서 잘 넣으면 gatherPeopleDTO의 값을 gatherPeopleInsert로 넘김
		}
		
		return flag;
	}
	
	@Override
	public boolean GatheringPeopleInsert(HashMap<String, Object> map){
		
		boolean flag = false;
		
		flag =	gDao.insertGatherPeople(map);
		
		return flag;
	}

	public List<GatheringDTO> getpartiList(String guserId) {
		
		List<GatheringDTO> glist = gDao.selectPartiList(guserId);
		fData = new FormatData();
		glist = fData.formatData(glist);
		
		return glist;
	}

	@Override
	public List<GatheringDTO> getmakeList(String guserId) {

		List<GatheringDTO> mlist = gDao.selectMakeList(guserId);
		fData = new FormatData();
		mlist = fData.formatData(mlist);
		
		return mlist;
	}

	@Override
	public boolean mergeRecommend(List<RecommGatherDTO> recommgatherList) {

		boolean flag = gDao.mergeList(recommgatherList);
		
		return flag;
	}

	@Override
	public List<GatheringDTO> getRecommendUser(String guserId) {

		List<GatheringDTO> recommList = gDao.getRecommUser(guserId);
		fData = new FormatData();
		recommList = fData.formatData(recommList);
		
		return recommList;
	}

	@Override
	public List<GatheringDTO> getRecommDefault() {

		List<GatheringDTO> recommList = gDao.getRecommDefault();
		fData = new FormatData();
		recommList = fData.formatData(recommList);
		
		return recommList;
	}

	@Override
	public boolean manageAddons(GatherAddonsDTO gadto, String state) {

		boolean flag = gDao.manageAddons(gadto, state);
		
		return flag;
	}

	@Override
	public boolean existAddons(GatherAddonsDTO gadto) {
		
		boolean flag = gDao.existAddons(gadto);
		
		return flag;
	}

	@Override
	public List<GatheringDTO> getAttendList(String guserId) {
		List<GatheringDTO> attendList = gDao.getAttendList(guserId);
		
		return attendList;
	}
	
	//기업회원내가만든모임
	@Override
	public List<GatheringDTO> getComMakeList(String guserId) {

		List<GatheringDTO> mlist = gDao.selectComMakeList(guserId);
		
		fData = new FormatData();
		mlist = fData.formatData(mlist);
		
		return mlist;
	}

	
	@Override
	public boolean updateModalGathering(GatheringDTO gdto) {
		
		boolean flag = gDao.updateModalGathering(gdto);
		
		return flag;
	}

	@Override
	public List<GatherPeopleDTO> getGatherApply(int gatherNo) {

		List<GatherPeopleDTO> gpdto = gDao.getGatherApply(gatherNo);
		
		return gpdto;
	}

	@Override
	public boolean updateRecog(int no) {
		boolean flag = false;
		flag = gDao.updateRecog(no);
		return flag;
	}

	@Override
	public boolean updateRecogYes(int gatherNo) {
		boolean flag = false;
		flag = gDao.updateRecogYes(gatherNo);
		return flag;
	}

	public List<AlarmDTO> gatherAlarm() {

		List<AlarmDTO> alist = gDao.getGatherAlarm();
		
		return alist;
	}

	@Override
	public List<GatherPeopleDTO> getPeoPleAlarm() {
		
		List<GatherPeopleDTO> getPeoPleAlarm = gDao.getPeoPleAlarm();
		
		return getPeoPleAlarm;
	}

	@Override
	public boolean updateRecogNo(int gatherNo) {
		boolean flag = false;
		flag = gDao.updateRecogNo(gatherNo);
		return flag;
	}

	@Override
	public boolean assignBlogId(int gatherNo) {
		boolean flag = false;
		flag = gDao.updateBlogId(gatherNo);
		return flag;
	}
}
