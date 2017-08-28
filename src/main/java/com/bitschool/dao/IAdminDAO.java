package com.bitschool.dao;

import java.util.HashMap;
import java.util.List;

import com.bitschool.dto.CompanyDTO;
<<<<<<< HEAD
import com.bitschool.dto.GatherRankDTO;
=======
import com.bitschool.dto.GatherPeopleDTO;
>>>>>>> bd86fcdb6f88922ebd6fec808a8c75668e734176
import com.bitschool.dto.GatheringDTO;
import com.bitschool.dto.PersonDTO;

public interface IAdminDAO {
	

	public List<PersonDTO> getPerson();


	public List<CompanyDTO> getCompany();


	public List<GatheringDTO> getGatherList();


<<<<<<< HEAD
	public HashMap<String, Integer> gatherplaceCnt();


	public List<GatherRankDTO> gatherRank();
=======
	public List<GatherPeopleDTO> getGather();


	public List<GatheringDTO> getGatherInfo(String guserId);
>>>>>>> bd86fcdb6f88922ebd6fec808a8c75668e734176


	 

}
