package com.bitschool.dao;

import java.util.HashMap;
import java.util.List;

import com.bitschool.dto.AlarmDTO;
import com.bitschool.dto.GatherAddonsDTO;
import com.bitschool.dto.GatherPeopleDTO;
import com.bitschool.dto.GatheringDTO;
import com.bitschool.dto.RecommGatherDTO;

public interface IGatheringDAO {

	public List<GatheringDTO> getGatheringAll();

	public GatheringDTO getGathering(int gatherNo);

	public List<GatheringDTO> getGatheringCheck(List<String> cList, List<String> aList, List<String> tList, String sSelect, String sSTR);

	public boolean insertGathering(HashMap<String, Object> map);

	public List<GatheringDTO> selectPartiList(String guserId);

	public List<GatheringDTO> selectMakeList(String guserId);

	public boolean mergeList(List<RecommGatherDTO> recommgatherList);

	public List<GatheringDTO> getRecommUser(String guserId);

	public List<GatheringDTO> getRecommDefault();

	public boolean manageAddons(GatherAddonsDTO gadto, String state);

	public boolean existAddons(GatherAddonsDTO gadto);

	public List<GatheringDTO> getAttendList(String guserId);

	public List<GatheringDTO> getGatheringAll(String sSTR);
	
	//기업회원내가만든모임
	public List<GatheringDTO> selectComMakeList(String guserId);

	public boolean updateModalGathering(GatheringDTO gdto);

	boolean insertGatherReader(HashMap<String, Object> map);

	public boolean insertGatherPeople(HashMap<String, Object> map);

	public List<GatherPeopleDTO> getGatherApply(int gatherNo);

<<<<<<< HEAD
	public boolean updateRecog(int no);

	public boolean updateRecogYes(int gatherNo);

	public boolean updateRecogNo(int gatherNo);

	public boolean updateBlogId(int gatherNo);
=======
	public List<AlarmDTO> getGatherAlarm();

	public List<GatherPeopleDTO> getPeoPleAlarm();
	
>>>>>>> 20b5b62f1c8d3d76da5ff88eac900524f46f643a
}
