package com.bitschool.dto;

public class GatherAddonsDTO {
	private int gatherAddonsNo;
	private int gatherNo;
	private String guserId;
	private String gatherAddonsCode;
	
	public int getGatherAddonsNo() {
		return gatherAddonsNo;
	}
	public void setGatherAddonsNo(int gatherAddonsNo) {
		this.gatherAddonsNo = gatherAddonsNo;
	}
	
	public int getGatherNo() {
		return gatherNo;
	}
	public void setGatherNo(int gatherNo) {
		this.gatherNo = gatherNo;
	}
	
	public String getGuserId() {
		return guserId;
	}
	public void setGuserId(String guserId) {
		this.guserId = guserId;
	}
	
	public String getGatherAddonsCode() {
		return gatherAddonsCode;
	}
	public void setGatherAddonsCode(String gatherAddonsCode) {
		this.gatherAddonsCode = gatherAddonsCode;
	}
	
	@Override
	public String toString() {
		return "GatherAddonsDTO [gatherAddonsNo=" + gatherAddonsNo + ", gatherNo=" + gatherNo + ", guserId=" + guserId
				+ ", gatherAddonsCode=" + gatherAddonsCode + "]";
	}
	
	
	
	
}
