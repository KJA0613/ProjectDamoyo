package com.bitschool.dto;

public class PlaceRankDTO {
	private String placeName;
	private int cntNum;
	
	public String getPlaceName() {
		return placeName;
	}
	public void setPlaceName(String placeName) {
		this.placeName = placeName;
	}
	public int getCntNum() {
		return cntNum;
	}
	public void setCntNum(int cntNum) {
		this.cntNum = cntNum;
	}
	
	@Override
	public String toString() {
		return "PlaceRankDTO [placeName=" + placeName + ", cntNum=" + cntNum + "]";
	}
	
	
	
	
}
