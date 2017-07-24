package com.bitschool.service;


import java.util.HashMap;
import java.util.List;

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

	public List<GatheringDTO> getRecommendAll(String guserId);


}
