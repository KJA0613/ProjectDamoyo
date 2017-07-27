package com.bitschool.service;

import java.util.HashMap;
import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.bitschool.dao.IGatheringDAO;
import com.bitschool.dto.GatherAddonsDTO;
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
	public GatheringDTO getGathering(int gatherNo) {
		
		GatheringDTO gdto = gDao.getGathering(gatherNo);
				
		return gdto;
	}

	@Override
	public List<GatheringDTO> getGatheringCheck(List<String> cList, List<String> aList, String sSelect, String sSTR) {
		
		List<GatheringDTO> gList = gDao.getGatheringCheck(cList, aList, sSelect, sSTR);
		
		return gList;
	}

	@Override
	public boolean GatheringInsert(HashMap<String, Object> map) {
		
		boolean flag = gDao.insertGathering(map);
		
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

	

}
