package com.bitschool.dto;

public class GatherRankDTO {
	private String gatherType;
	private int typeCnt;
	private String typeCode;
	
	public String getGatherType() {
		return gatherType;
	}
	public void setGatherType(String gatherType) {
		this.gatherType = gatherType;
	}
	public int getTypeCnt() {
		return typeCnt;
	}
	public void setTypeCnt(int typeCnt) {
		this.typeCnt = typeCnt;
	}
	public String getTypeCode() {
		return typeCode;
	}
	public void setTypeCode(String typeCode) {
		this.typeCode = typeCode;
	}
	
	@Override
	public String toString() {
		return "GatherRankDTO [gatherType=" + gatherType + ", typeCnt=" + typeCnt + ", typeCode=" + typeCode + "]";
	}
	
	
	
}
