package com.bitschool.service;

import java.util.HashMap;
import java.util.List;

import com.bitschool.dto.AlarmDTO;
import com.bitschool.dto.CompanyDTO;
import com.bitschool.dto.GatherRankDTO;
import com.bitschool.dto.GatherPeopleDTO;
import com.bitschool.dto.GatheringDTO;
import com.bitschool.dto.PersonDTO;
import com.bitschool.dto.VisitorTimeDTO;
import com.bitschool.dto.VisitorWeekDTO;

public interface IAdminService {

	public List<PersonDTO> getPerson();

	public List<CompanyDTO> getCompany();

	public List<GatheringDTO> getGatherList();

	public HashMap<String, Integer> gatherplaceCnt();

	public List<GatherRankDTO> gatherRank();
	
	public List<GatherPeopleDTO> getGather();

	public List<GatheringDTO> getGatherInfo(String guserId);

	public List<VisitorWeekDTO> visitWeek();

	public List<VisitorTimeDTO> visitTime();

	public List<GatherPeopleDTO> getGatherNoPeople(int gatherNo);

	public boolean setRecognition(List<AlarmDTO> alarmList);


	
}
