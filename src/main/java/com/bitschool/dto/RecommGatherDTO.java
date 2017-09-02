package com.bitschool.dto;

public class RecommGatherDTO {

	private int recommgatherNo;
	private int gatherNo;
	private String gatherSubject;
	private String gatherCategoryTop;
	private String gatherCategoryBot;
	private String gatherAreaTop;
	private String gatherArea;
	private int gatherCnt;
	
	public int getRecommgatherNo() {
		return recommgatherNo;
	}
	public void setRecommgatherNo(int recommgatherNo) {
		this.recommgatherNo = recommgatherNo;
	}
	public int getGatherNo() {
		return gatherNo;
	}
	public void setGatherNo(int gatherNo) {
		this.gatherNo = gatherNo;
	}
	public String getGatherSubject() {
		return gatherSubject;
	}
	public void setGatherSubject(String gatherSubject) {
		this.gatherSubject = gatherSubject;
	}
	public String getGatherCategoryTop() {
		return gatherCategoryTop;
	}
	public void setGatherCategoryTop(String gatherCategoryTop) {
		this.gatherCategoryTop = gatherCategoryTop;
	}
	public String getGatherCategoryBot() {
		return gatherCategoryBot;
	}
	public void setGatherCategoryBot(String gatherCategoryBot) {
		this.gatherCategoryBot = gatherCategoryBot;
	}
	public String getGatherAreaTop() {
		return gatherAreaTop;
	}
	public void setGatherAreaTop(String gatherAreaTop) {
		this.gatherAreaTop = gatherAreaTop;
	}
	public String getGatherArea() {
		return gatherArea;
	}
	public void setGatherArea(String gatherArea) {
		this.gatherArea = gatherArea;
	}
	
	public int getGatherCnt() {
		return gatherCnt;
	}
	public void setGatherCnt(int gatherCnt) {
		this.gatherCnt = gatherCnt;
	}
	
	@Override
	public String toString() {
		return "RecommGatherDTO [recommgatherNo=" + recommgatherNo + ", gatherNo=" + gatherNo + ", gatherSubject="
				+ gatherSubject + ", gatherCategoryTop=" + gatherCategoryTop + ", gatherCategoryBot="
				+ gatherCategoryBot + ", gatherAreaTop=" + gatherAreaTop + ", gatherArea=" + gatherArea
				+ ", gatherCnt="
				+ gatherCnt + "]";
	}
	
	
	
	

}
