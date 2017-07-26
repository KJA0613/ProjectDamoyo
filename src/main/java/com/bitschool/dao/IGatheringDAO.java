package com.bitschool.dao;

import java.util.HashMap;
import java.util.List;

import com.bitschool.dto.GatherAddonsDTO;
import com.bitschool.dto.GatheringDTO;
import com.bitschool.dto.RecommGatherDTO;

public interface IGatheringDAO {

	public List<GatheringDTO> getGatheringAll();

	public GatheringDTO getGathering(int gatherNo);

	public List<GatheringDTO> getGatheringCheck(List<String> cList, List<String> aList, String sSelect, String sSTR);

	public boolean insertGathering(HashMap<String, Object> map);

	public List<GatheringDTO> selectPartiList(String guserId);

	public List<GatheringDTO> selectMakeList(String guserId);

	public boolean mergeList(List<RecommGatherDTO> recommgatherList);

	public List<GatheringDTO> getRecommUser(String guserId);

	public List<GatheringDTO> getRecommDefault();

	public boolean manageAddons(GatherAddonsDTO gadto);
	
}
