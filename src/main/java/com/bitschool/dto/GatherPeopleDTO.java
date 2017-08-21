package com.bitschool.dto;

public class GatherPeopleDTO {
	int gatherPeopleNo;
	int gatherNo;			// 이건 게시글 no
	String guserId;			// 이건 지금 로그인 아이디
	String gatherPeopleGrade; // 이건 db에서 넣어보고
	String gatherPeopleDate; // 이것도 db에서sys
	
	public int getGatherPeopleNo() {
		return gatherPeopleNo;
	}
	public void setGatherPeopleNo(int gatherPeopleNo) {
		this.gatherPeopleNo = gatherPeopleNo;
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
	public String getGatherPeopleGrade() {
		return gatherPeopleGrade;
	}
	public void setGatherPeopleGrade(String gatherPeopleGrade) {
		this.gatherPeopleGrade = gatherPeopleGrade;
	}
	public String getGatherPeopleDate() {
		return gatherPeopleDate;
	}
	public void setGatherPeopleDate(String gatherPeopleDate) {
		this.gatherPeopleDate = gatherPeopleDate;
	}
	
	@Override
	public String toString() {
		return "GatherPeople [gatherPeopleNo=" + gatherPeopleNo + ", gatherNo=" + gatherNo + ", guserId=" + guserId
				+ ", gatherPeopleGrade=" + gatherPeopleGrade + ", gatherPeopleDate=" + gatherPeopleDate + "]";
	}
	
	
	
}
