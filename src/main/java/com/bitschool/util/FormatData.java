package com.bitschool.util;

import java.util.List;
import com.bitschool.dto.GatheringDTO;

public class FormatData {
	
	public List<GatheringDTO> formatData(List<GatheringDTO> list){
		
		
		for(int i=0; i<list.size(); i++){
			GatheringDTO gath = list.get(i);
			
			if(gath.getGatherArea()==null||gath.getGatherArea().equals("")){
				gath.setGatherArea("추후 협의");		
			}
	
			if(gath.getGatherDay()==null||gath.getGatherDay().equals("")){
				gath.setGatherDay("추후 협의");
			}
			
			if(gath.getGatherEdate()==null||gath.getGatherEdate().equals("")){
				gath.setGatherEdate("ING");
			}
			
			if(gath.getGatherImg()==null||gath.getGatherImg().equals("")){
				gath.setGatherImg("\\resources\\image\\mozip\\damoyo_noPicture.png");
			}
		
		}
		
		return list;
	}
}
