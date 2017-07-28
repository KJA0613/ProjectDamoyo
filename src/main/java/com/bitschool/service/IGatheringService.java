package com.bitschool.service;


import java.util.HashMap;
import java.util.List;

import com.bitschool.dto.GatherAddonsDTO;
import com.bitschool.dto.GatheringDTO;
import com.bitschool.dto.RecommGatherDTO;

public interface IGatheringService {

	public List<GatheringDTO> getGatheringAll();

	public GatheringDTO getGathering(int gatherNo);

	public List<GatheringDTO> getGatheringCheck(List<String> cList, List<String> aList, String sSelect, String sSTR);

	public boolean GatheringInsert(HashMap<String, Object> map);

	public List<GatheringDTO> getpartiList(String guserId);

	public List<GatheringDTO> getmakeList(String guserId);

	public boolean mergeRecommend(List<RecommGatherDTO> recommgatherList);

	public List<GatheringDTO> getRecommendUser(String guserId);

	public List<GatheringDTO> getRecommDefault();

	public boolean manageAddons(GatherAddonsDTO gadto, String state);

	public boolean existAddons(GatherAddonsDTO gadto);

	public List<GatheringDTO> getAttendList(String guserId);


}
