package com.bitschool.service;

import java.util.HashMap;
import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.bitschool.dao.IAdminDAO;
import com.bitschool.dto.AlarmDTO;
import com.bitschool.dto.CompanyDTO;
import com.bitschool.dto.GatherRankDTO;
import com.bitschool.dto.GatherPeopleDTO;
import com.bitschool.dto.GatheringDTO;
import com.bitschool.dto.PersonDTO;
import com.bitschool.dto.VisitorTimeDTO;
import com.bitschool.dto.VisitorWeekDTO;

@Service
public class AdminService implements IAdminService {
	
	@Inject
	private IAdminDAO adminDao;
	
	//-----------------------------------------------------------------------------------------------
	//관리자페이지 회원정보보기 (개인)
		@Override
		public List<PersonDTO> getPerson() {
			
			 List<PersonDTO>pdto = adminDao.getPerson();
			
			return pdto;
		}

	//관리자페이지 회원정보보기 (기업)
		@Override
		public List<CompanyDTO> getCompany() {
			
			List<CompanyDTO>cdto = adminDao.getCompany();
			
			return cdto;
		}

		@Override
		public List<GatheringDTO> getGatherList() {

			List<GatheringDTO> gdto = adminDao.getGatherList();
			
			return gdto;
		}

		// 게시글수, 장소글수 받아옴
		@Override
		public HashMap<String, Integer> gatherplaceCnt() {
			// TODO Auto-generated method stub
			HashMap<String, Integer> gpCnt = adminDao.gatherplaceCnt();
			
			return gpCnt;
		}

		@Override
		public List<GatherRankDTO> gatherRank() {
			
			List<GatherRankDTO> gatherRank = adminDao.gatherRank();
			
			return gatherRank;
		}
		
		@Override
		public List<GatherPeopleDTO> getGather() {
			
			List<GatherPeopleDTO> gpdto = adminDao.getGather();
			
			return gpdto;
		}

		@Override
		public List<GatheringDTO> getGatherInfo(String guserId) {

			List<GatheringDTO> gather =  adminDao.getGatherInfo(guserId);
			
			return gather;
		}

		@Override
		public List<VisitorWeekDTO> visitWeek() {
			List<VisitorWeekDTO> week = adminDao.visitWeek();
			return week;
		}

		@Override
		public List<VisitorTimeDTO> visitTime() {
			List<VisitorTimeDTO> time = adminDao.visitTime();
			
			return time;
		}

		@Override
		public List<GatherPeopleDTO> getGatherNoPeople(int gatherNo) {
			
			List<GatherPeopleDTO> gpList = adminDao.getGatherNoPeople(gatherNo);
			
			return gpList;
		}

		@Override
		public boolean setRecognition(List<AlarmDTO> alarmList) {
			// TODO Auto-generated method stub
			
			boolean flag = adminDao.setRecognition(alarmList);
			
			return flag;
		}


		
}
